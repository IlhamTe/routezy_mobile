part of '../main_home_page.dart';

class _MainHomeScreen extends StatefulWidget {
  const _MainHomeScreen();

  @override
  State<_MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<_MainHomeScreen>
    with TickerProviderStateMixin {
  final _pages = [HomePage(), SettingPage()];
  late final _tabViewController = TabController(length: 2, vsync: this);

  @override
  void dispose() {
    _tabViewController.dispose();
    super.dispose();
  }

  void _onNavBarPressed(int index) {
    _tabViewController.animateTo(
      index,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      body: TabBarView(
        controller: _tabViewController,
        physics: NeverScrollableScrollPhysics(),
        children: _pages,
      ),
      floatingActionButton: AnimatedScale(
        scale: isKeyboardOpen ? 0.0 : 1.0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOutBack,
        child: FloatingActionButton(
          onPressed: () {
            LocationPermissionUtil.requestLocationServiceWithAlert(
              context: context,
              onLocationAllowed: () => router.pushTo(RoutePaths.trackLocation),
            );
          },
          backgroundColor: AppColors.primaryMain,
          shape: CircleBorder(),
          child: Icon(Icons.directions_run, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: NotchedBottomNavbar(
        onTapNavBarItem: _onNavBarPressed,
      ),
    );
  }
}
