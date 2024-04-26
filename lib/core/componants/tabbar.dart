import 'package:flutter/material.dart';

import 'colors.dart';

class Tabbar extends StatefulWidget {
  const Tabbar({
    Key? key,
    required this.views,
    required this.tabs,
  }) : super(key: key);
  final List<Widget> tabs, views;
  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> with TickerProviderStateMixin {
  TabController? controller;
  // final categories = [
  //   'شقق سكنية',
  //   'غرف سكنية',
  // ];
  // List<Widget> getTabs() {
  //   List<Widget> tabs = [];

  //   for (int i = 0; i < categories.length; i++) {
  //     tabs.add(
  //       Tab(
  //         text: categories[i],
  //       ),
  //     );
  //   }
  //   return tabs;
  // }

  // List<Widget> getViews() {
  //   List<Widget> views = [];

  //   for (int i = 0; i < categories.length; i++) {
  //     views.add(const ListViewBody());
  //   }
  //   return views;
  // }

  @override
  void initState() {
    controller = TabController(length: widget.tabs.length, vsync: this);
    controller!.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: TabBar(
                      dividerColor: Colors.transparent,
                      controller: controller,
                      indicatorPadding: const EdgeInsets.all(5),
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                          color: kPrimary,
                          borderRadius: BorderRadius.circular(10)),
                      labelStyle: const TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                      labelColor: Colors.white,
                      unselectedLabelColor: kPrimary,
                      // isScrollable: true,
                      tabs: widget.tabs),
                ),
              ),
            ],
          ),
          Expanded(
            child: SizedBox(
                width: double.maxFinite,
                child:
                    TabBarView(controller: controller, children: widget.views)),
          ),
        ],
      ),
    );
  }
}
