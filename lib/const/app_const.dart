import '../entity/tab.dart' as tab_model;

class AppConst {
  static const tab_model.Tab defaultTab = tab_model.Tab(title: 'main', code: '');

  static const restrictedTabTitles = ['main', 'std'];

  // messages
  static const sorry = 'Sorry';
  static const running = 'Running...';
  static const restrictedTabMessage = 'You cannot create or remove this tab';
  static const invalidFileName = "Invalid file name";
  static const itMayTakeTime = "It may take a couple of seconds";
}