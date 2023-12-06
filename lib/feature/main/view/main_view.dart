import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:exercise/core/const/colors.dart';
import 'package:exercise/feature/home/view/home_view.dart';
import 'package:exercise/product/extension/context/duration.dart';
import 'package:exercise/product/extension/context/size.dart';
import 'package:exercise/product/extension/tab_items.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late final PageController pageController;
  int activeIndex = 2;
  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: PageView(
        controller: pageController,
        children: const [
          HomeView(),
          HomeView(),
          HomeView(),
          HomeView(),
          HomeView(),
        ],
      ),
      bottomNavigationBar: _convexBottomNavBar(context),
    );
  }

  ConvexAppBar _convexBottomNavBar(BuildContext context) {
    return ConvexAppBar(
      top: context.sized.kZero,
      color: Colors.black,
      backgroundColor: Colors.white,
      activeColor: Colors.transparent,
      initialActiveIndex: activeIndex,
      items: [
        _tabItem(Icons.flag_outlined,0,TabItems.campus.getName()),
        _tabItem(Icons.bolt_outlined,1,TabItems.activity.getName()),
        _tabItem(Icons.circle_outlined,2, TabItems.mySpace.getName()),
        _tabItem(Icons.groups_outlined,3,TabItems.clubs.getName()),
        _tabItem(Icons.layers_outlined,4,TabItems.resource.getName()),
      ],
      onTap: _bottomNavBarOnTap,
    );
  }
  TabItem<dynamic> _tabItem(IconData icon,int index,String title) {
    return TabItem(
          icon: Icon(icon,color: activeIndex == index ? AppColor.hotCoral.getColor() : Colors.black),
          title: activeIndex == index ? '' : title,
        );
  }
  void _bottomNavBarOnTap(int index){
    setState(() {
      activeIndex = index;
      _changePage(index, context);
    });
  }
  void _changePage(int index,BuildContext context){
    pageController.animateToPage(index, duration: context.duration.durationNormal, curve: Curves.fastLinearToSlowEaseIn);
  }
}
