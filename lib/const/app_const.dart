import '../entity/tab.dart' as tab_model;

class AppConst {
  static const tab_model.Tab defaultTab = tab_model.Tab(title: 'main', code: '');

  static const restrictedTabTitles = ['main', 'std'];

  static const sorry = 'Sorry';

  static const restrictedTabMessage = 'You cannot create or remove tab with that title';
}