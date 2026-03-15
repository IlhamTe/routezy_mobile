part of '../track_location_page.dart';

class _TrackLocationScreen extends StatefulWidget {
  const _TrackLocationScreen();

  @override
  State<_TrackLocationScreen> createState() => _TrackLocationScreenState();
}

class _TrackLocationScreenState extends State<_TrackLocationScreen> {
  late final _cubit = context.read<TrackLocationCubit>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _cubit.initialize();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isTracking = context.select(
      (TrackLocationCubit cubit) => cubit.state.isTracking,
    );

    return MultiBlocListener(
      listeners: [
        BlocListener<TrackLocationCubit, TrackLocationState>(
          listenWhen: (prev, current) {
            /// Listen [stateTracking] and [route] only
            return prev.stateTracking.status != current.stateTracking.status ||
                prev.route != current.route;
          },
          listener: (context, state) {
            if (state.stateTracking.status.isError) {
              ShowWidgetHelper.showCustomModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return _TimeoutExceptionBottomSheet(
                    onSaveRoutePressed: state.route.isEmpty
                        ? null
                        : () {
                            /// Close [TimeoutExceptionBottomSheet]
                            Navigator.pop(context);

                            ShowWidgetHelper.showCustomModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (context) {
                                return _TrackingResultBottomSheet(
                                  route: state.route.toLatLng2(),
                                  accuracy:
                                      state.currentSettings.locationAccuracy,
                                  onSavePressed: () {
                                    _cubit.saveTrackingLocation();
                                    Navigator.pop(context);
                                  },
                                );
                              },
                            );
                          },
                  );
                },
              );
            }
          },
        ),
        BlocListener<TrackLocationCubit, TrackLocationState>(
          listenWhen: (prev, current) {
            /// Only listen [stateLocationPermissionService]
            return prev.stateLocationPermissionService.status !=
                current.stateLocationPermissionService.status;
          },
          listener: (context, state) {
            if (state.stateLocationPermissionService.status.isError) {
              ShowWidgetHelper.showCustomModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return LocationPermissionAlertBottomSheet();
                },
              );
            }
          },
        ),
        BlocListener<TrackLocationCubit, TrackLocationState>(
          listenWhen: (prev, current) {
            /// Listen [stateSaveTracking] and [shouldPopPage]
            return prev.stateSaveTracking.status !=
                    current.stateSaveTracking.status ||
                prev.shouldPopPage != current.shouldPopPage;
          },
          listener: (context, state) {
            if (state.stateSaveTracking.status.isSuccess) {
              ShowWidgetHelper.showSnackBar(
                context: context,
                type: SnackBarType.success,
                behavior: SnackBarBehavior.fixed,
                padding: AppPadding.paLG,
                message: 'Great job! Your run has been saved.',
              ).then((_) {
                if (state.shouldPopPage) {
                  /// Back to previous page
                  router.pop();
                }
              });
            } else if (state.stateSaveTracking.status.isError) {
              ShowWidgetHelper.showSnackBar(
                context: context,
                type: SnackBarType.error,
                padding: AppPadding.paLG,
                behavior: SnackBarBehavior.fixed,
                message: "Something went wrong. We couldn't save your route.",
              );
            }
          },
        ),
        BlocListener<TrackLocationCubit, TrackLocationState>(
          listenWhen: (prev, current) {
            /// Listen all state except [stateSaveTracking]
            return prev.isTracking != current.isTracking ||
                prev.route != current.route ||
                prev.stateTracking.status != current.stateTracking.status ||
                prev.stateLocationPermissionService.status !=
                    current.stateLocationPermissionService.status;
          },
          listener: (context, state) async {
            if (state.shouldShowTrackResult) {
              /// Waiting for Idle Transition to complete first
              await Future.delayed(Duration(milliseconds: 800));
              if (context.mounted) {
                ShowWidgetHelper.showCustomModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) {
                    return _TrackingResultBottomSheet(
                      route: state.route.toLatLng2(),
                      accuracy: state.currentSettings.locationAccuracy,
                      onSavePressed: () {
                        _cubit.saveTrackingLocation();

                        /// Close [TrackingResultBottomSheet]
                        Navigator.pop(context);
                      },
                    );
                  },
                );
              }
            }
          },
        ),
      ],
      child: PopScope(
        canPop: isTracking == false,
        onPopInvokedWithResult: (didPop, _) {
          if (didPop) return;

          if (isTracking) {
            _cubit.stopTracking(shouldPopPage: true);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            scrolledUnderElevation: 0,
            foregroundColor: AppColors.primaryMain,
            title: TextLabel(
              'Routezy ${isTracking ? 'is tracking ...' : ''}',
              style: AppTextStyles.heading6,
              color: AppColors.primaryMain,
            ),
          ),
          backgroundColor: Colors.white,
          body: Center(
            child: Padding(
              padding: AppPadding.phLG,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 24,
                children: [
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 400),
                    transitionBuilder: (child, animation) =>
                        ScaleTransition(scale: animation, child: child),
                    child: isTracking
                        ? Lottie.asset(AssetAnimation.running)
                        : _IdleSection(),
                  ),

                  PrimaryButton.large(
                    onPressed: () {
                      if (isTracking) {
                        _cubit.stopTracking(shouldPopPage: false);
                      } else {
                        LocationPermissionUtil.requestLocationServiceWithAlert(
                          context: context,
                          onLocationAllowed: () {
                            _cubit.startTracking();
                          },
                        );
                      }
                    },
                    text: isTracking ? 'STOP' : 'GO',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
