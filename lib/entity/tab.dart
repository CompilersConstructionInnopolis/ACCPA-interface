import 'package:freezed_annotation/freezed_annotation.dart';

part 'tab.freezed.dart';

part 'tab.g.dart';

@freezed
class Tab with _$Tab {
  const factory Tab({
    String? title,
    String? content,
  }) = _Tab;

  factory Tab.fromJson(json) => _$TabFromJson(json);
}
