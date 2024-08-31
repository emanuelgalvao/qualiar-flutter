import 'package:flutter/widgets.dart';

import '../../../core/util/app_icons.dart';
import '../../../core/util/app_routes.dart';
import '../../../provider/theme_provider.dart';
import '../repository/home_repository_interface.dart';
import 'home_action.dart';
import 'home_state.dart';

class HomeViewModel extends ChangeNotifier {
  final IHomeRepository homeRepository;
  final ThemeProvider themeProvider;

  HomeViewModel({
    required this.homeRepository,
    required this.themeProvider,
  }) {
    handleAction(LoadData());
  }

  ValueNotifier<HomeState> state = ValueNotifier(
    Loading(toolbarIcon: AppIcons.light),
  );

  void handleAction(HomeAction action) {
    switch (action) {
      case LoadData():
        _loadData();
      case GoToDetails():
        _goToDetails(action.context, action.locationId);
      case SwapTheme():
        _swapTheme();
    }
  }

  void _loadData() async {
    state.value = Loading(toolbarIcon: themeProvider.isDarkMode ? AppIcons.light : AppIcons.dark);
    final homeData = await homeRepository.getHomeData();
    state.value = Reender(
      toolbarIcon: themeProvider.isDarkMode ? AppIcons.light : AppIcons.dark,
      data: homeData,
    );
  }

  void _goToDetails(BuildContext context, int locationId) {
    Navigator.of(context).pushNamed(
      AppRoutes.locationDetails,
      arguments: locationId,
    );
  }

  void _swapTheme() async {
    await themeProvider.swapTheme();
    state.value.toolbarIcon = themeProvider.isDarkMode ? AppIcons.light : AppIcons.dark;
  }
}
