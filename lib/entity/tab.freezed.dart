// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tab.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Tab _$TabFromJson(Map<String, dynamic> json) {
  return _Tab.fromJson(json);
}

/// @nodoc
mixin _$Tab {
  String? get title => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TabCopyWith<Tab> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TabCopyWith<$Res> {
  factory $TabCopyWith(Tab value, $Res Function(Tab) then) =
      _$TabCopyWithImpl<$Res>;
  $Res call({String? title, String? content});
}

/// @nodoc
class _$TabCopyWithImpl<$Res> implements $TabCopyWith<$Res> {
  _$TabCopyWithImpl(this._value, this._then);

  final Tab _value;
  // ignore: unused_field
  final $Res Function(Tab) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? content = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_TabCopyWith<$Res> implements $TabCopyWith<$Res> {
  factory _$$_TabCopyWith(_$_Tab value, $Res Function(_$_Tab) then) =
      __$$_TabCopyWithImpl<$Res>;
  @override
  $Res call({String? title, String? content});
}

/// @nodoc
class __$$_TabCopyWithImpl<$Res> extends _$TabCopyWithImpl<$Res>
    implements _$$_TabCopyWith<$Res> {
  __$$_TabCopyWithImpl(_$_Tab _value, $Res Function(_$_Tab) _then)
      : super(_value, (v) => _then(v as _$_Tab));

  @override
  _$_Tab get _value => super._value as _$_Tab;

  @override
  $Res call({
    Object? title = freezed,
    Object? content = freezed,
  }) {
    return _then(_$_Tab(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Tab implements _Tab {
  const _$_Tab({this.title, this.content});

  factory _$_Tab.fromJson(Map<String, dynamic> json) => _$$_TabFromJson(json);

  @override
  final String? title;
  @override
  final String? content;

  @override
  String toString() {
    return 'Tab(title: $title, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Tab &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.content, content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(content));

  @JsonKey(ignore: true)
  @override
  _$$_TabCopyWith<_$_Tab> get copyWith =>
      __$$_TabCopyWithImpl<_$_Tab>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TabToJson(this);
  }
}

abstract class _Tab implements Tab {
  const factory _Tab({final String? title, final String? content}) = _$_Tab;

  factory _Tab.fromJson(Map<String, dynamic> json) = _$_Tab.fromJson;

  @override
  String? get title => throw _privateConstructorUsedError;
  @override
  String? get content => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TabCopyWith<_$_Tab> get copyWith => throw _privateConstructorUsedError;
}
