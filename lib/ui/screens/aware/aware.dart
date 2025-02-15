import 'package:flutter/material.dart';
import 'package:hope/core/assets/app_icons.dart';
import 'package:hope/core/theme/app_colors.dart';

class AwarenessScreen extends StatefulWidget {
  static const routeName = '/awareness';

  const AwarenessScreen({super.key});

  @override
  State<AwarenessScreen> createState() => _AwarenessScreenState();
}

class _AwarenessScreenState extends State<AwarenessScreen> {
  Decoration boxDecoration() {
    return BoxDecoration(
      border: Border.all(color: AppColors.white),
      borderRadius: BorderRadius.circular(50),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.purple,
            child: ImageIcon(
              AssetImage(AppIcons.scanIcon),
              color: AppColors.white,
            ),
            shape: const CircleBorder(
              side: BorderSide(color: AppColors.white, width: 5),
            ),
            onPressed: () {},
          ),
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_outlined),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            toolbarHeight: MediaQuery.of(context).size.height * 0.1,
            backgroundColor: AppColors.purple,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            centerTitle: true,
            title: Text(
              "Hereditary",
              style: TextStyle(color: AppColors.white),
            ),
            bottom: TabBar(
              unselectedLabelColor: AppColors.white,
              labelColor: AppColors.purple,
              indicatorSize: TabBarIndicatorSize.label,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: AppColors.white),
                color: AppColors.white,
              ),
              isScrollable: true,
              dividerColor: Colors.transparent,
              unselectedLabelStyle: TextStyle(color: AppColors.white),
              labelStyle: TextStyle(color: AppColors.purple),
              tabs: [
                Tab(
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: boxDecoration(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(AssetImage(AppIcons.allIcon)),
                        const SizedBox(
                          width: 8,
                        ),
                        Text("all"),
                      ],
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: boxDecoration(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(AssetImage(AppIcons.awareFilled)),
                        const SizedBox(
                          width: 8,
                        ),
                        Text("Breast"),
                      ],
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: boxDecoration(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(AssetImage(AppIcons.awareFilled)),
                        const SizedBox(
                          width: 8,
                        ),
                        Text("Prostate"),
                      ],
                    ),
                  ),
                ),
                Tab(
                    child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: boxDecoration(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ImageIcon(AssetImage(AppIcons.awareFilled)),
                      const SizedBox(
                        width: 8,
                      ),
                      Text("Ovarian"),
                    ],
                  ),
                ))
              ],
            ),
          ),
          //    buildEventsListView()
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [],
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.purple,
            selectedItemColor: AppColors.white,
            unselectedItemColor: AppColors.white,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppIcons.homeIcon)),
                label: 'Home',
                backgroundColor: AppColors.purple,
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppIcons.addIcon)),
                label: 'Add',
                backgroundColor: AppColors.purple,
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppIcons.awareIcon)),
                label: 'Aware',
                backgroundColor: AppColors.purple,
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppIcons.menuIcon)),
                label: 'Menu',
                backgroundColor: AppColors.purple,
              ),
            ],
          ),
        ));
  }
}
