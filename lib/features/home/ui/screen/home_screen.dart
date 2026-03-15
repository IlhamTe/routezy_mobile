part of '../home_page.dart';

class _HomeScreen extends StatefulWidget {
  const _HomeScreen();

  @override
  State<_HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<_HomeScreen>
    with AutomaticKeepAliveClientMixin {
  late final _cubit = context.read<HomeCubit>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: ValueListenableBuilder(
        valueListenable: _cubit.listenTrackedLocationChanges(),
        builder: (_, box, _) {
          final listTrackedLocation = box.values.toList();
          return ListView.separated(
            itemBuilder: (_, index) {
              final data = listTrackedLocation[index];
              return _TrackLocationItem(
                title: 'Track ${index + 1}',
                accuracy: data.locationAccuracy,
                routes: data.routes.toLatLng2(),
                timestamp: data.timestamp,
              );
            },
            separatorBuilder: (_, _) => Gap.height(32),
            itemCount: listTrackedLocation.length,
            padding: AppPadding.pb64,
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
