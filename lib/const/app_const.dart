import '../entity/tab.dart' as tab_model;

class AppConst {
  static const tab_model.Tab defaultTab = tab_model.Tab(title: 'main', content: '');

  static const restrictedTabTitles = ['main', 'std'];

  // message titles
  static const sorry = 'Sorry';
  static const running = 'Running...';
  static const success = 'Success!';
  static const failed = 'Failed :c';

  // message descriptions
  static const restrictedTabMessage = 'You cannot create or remove this tab';
  static const invalidFileName = "Invalid file name";
  static const itMayTakeTime = "It may take a couple of seconds";
  static const compilationSuccess = "Your program compiled successfully";
  static const compilationFail = "Your program failed";
}