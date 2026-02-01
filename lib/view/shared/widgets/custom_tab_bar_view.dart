import 'package:flutter/material.dart';

class CustomTabBarView extends StatelessWidget {
  final List<String> tabTitles;
  final List<Widget> children;

  const CustomTabBarView({
    super.key,
    required this.tabTitles,
    required this.children,
  }) : assert(
         tabTitles.length == children.length,
         'Number of tabs and children must match',
       );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabTitles.length,
      child: Column(
        children: [
          TabBar(tabs: tabTitles.map((title) => Tab(text: title)).toList()),
          Expanded(child: TabBarView(children: children)),
        ],
      ),
    );
  }
}
