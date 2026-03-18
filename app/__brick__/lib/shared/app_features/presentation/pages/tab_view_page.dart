import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:{{packageName}}/shared/theme/styles/app_colors.dart';

@RoutePage()
class CustomTabbarPage extends StatefulWidget {
  final List<String> tabs;
  final List<Widget> tabViews;
  final bool? isChildView;

  const CustomTabbarPage({
    super.key,
    required this.tabs,
    required this.tabViews,
    this.isChildView,
  });

  @override
  State<CustomTabbarPage> createState() => _CustomTabbarPageState();
}

class _CustomTabbarPageState extends State<CustomTabbarPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TabBar(
          controller: _tabController,
          dividerColor: Colors.transparent,
          indicator: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.transparent)),
          ),
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          tabs: <Widget>[
            for (var tab in widget.tabs)
              Tab(
                child: AnimatedBuilder(
                  animation: _tabController,
                  builder: (context, child) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color:
                              _tabController.index == widget.tabs.indexOf(tab)
                              ? AppColors.primary
                              : Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          tab,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
        const SizedBox(height: 16),
        widget.isChildView == true
            ? SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.6,
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: widget.tabViews,
                ),
              )
            : Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: widget.tabViews,
                ),
              ),
      ],
    );
  }
}
