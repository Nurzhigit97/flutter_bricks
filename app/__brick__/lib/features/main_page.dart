import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:{{packageName}}/core/theme/styles/app_colors.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with WidgetsBindingObserver {
  TabsRouter? _tabsRouter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(color: AppColors.white),
        child: SafeArea(
          top: false,
          child: PopScope(
            canPop: false, // не даём корневому роуту закрыть приложение
            onPopInvokedWithResult: (didPop, _) async {
              if (didPop) {
                return; // если уже кто-то обработал pop — выходим
              }
              final tabsRouter = _tabsRouter;
              if (!mounted || tabsRouter == null) return;
              final currentTab = tabsRouter.stackRouterOfIndex(
                tabsRouter.activeIndex, // берем текущий активный таб
              );
              if (currentTab?.canPop() ?? false) {
                // есть ли экраны в стеке таба
                await currentTab?.maybePop(); // попаем экран внутри таба
                return; // обработали назад
              }
              if (tabsRouter.activeIndex != 0) {
                // если это не первый таб
                tabsRouter.setActiveIndex(0); // переключаемся на первый таб
                return; // обработали назад
              }
              // уже на корне первого таба — ничего не делаем (не закрываем приложение)
            },
            child: AutoTabsScaffold(
              appBarBuilder: (context, tabsRouter) => AppBar(
                title: Text('App'),
                centerTitle: false,
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.settings),
                  ),
                ],
              ),
              routes: const [
                // TODO: Implement navigate to the screen
                // TaskNavigator(),
                // ChatNavigator(),
                // TODO: Implement navigate to the screen
              ],
              bottomNavigationBuilder: (_, tabsRouter) {
                _tabsRouter = tabsRouter;
                return BottomNavigationBar(
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.task),
                      label: 'Task',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.chat),
                      label: 'Chat',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: 'Profile',
                    ),
                  ],
                  currentIndex: tabsRouter.activeIndex,
                  onTap: (index) {
                    final pageCount = tabsRouter.pageCount;
                    final safeIndex = index.clamp(0, pageCount - 1);
                    if (safeIndex == tabsRouter.activeIndex) {
                      _popIfHasChildren(tabsRouter, safeIndex);
                    }
                    tabsRouter.setActiveIndex(safeIndex);
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void _popIfHasChildren(TabsRouter tabsRouter, int index) {
    final currentTab = tabsRouter.stackRouterOfIndex(index);
    if (currentTab?.canPop() ?? false) {
      // Если есть дочерние экраны - делаем pop
      currentTab?.maybePop();
    }
  }
}
