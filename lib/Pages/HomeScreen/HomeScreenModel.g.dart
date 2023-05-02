// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomeScreenModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeScreenModel on _HomeScreenModelBase, Store {
  late final _$allAvengersAtom =
      Atom(name: '_HomeScreenModelBase.allAvengers', context: context);

  @override
  List<AvengerBO> get allAvengers {
    _$allAvengersAtom.reportRead();
    return super.allAvengers;
  }

  @override
  set allAvengers(List<AvengerBO> value) {
    _$allAvengersAtom.reportWrite(value, super.allAvengers, () {
      super.allAvengers = value;
    });
  }

  late final _$isAvengersLoadingAtom =
      Atom(name: '_HomeScreenModelBase.isAvengersLoading', context: context);

  @override
  bool get isAvengersLoading {
    _$isAvengersLoadingAtom.reportRead();
    return super.isAvengersLoading;
  }

  @override
  set isAvengersLoading(bool value) {
    _$isAvengersLoadingAtom.reportWrite(value, super.isAvengersLoading, () {
      super.isAvengersLoading = value;
    });
  }

  late final _$textValueAtom =
      Atom(name: '_HomeScreenModelBase.textValue', context: context);

  @override
  String get textValue {
    _$textValueAtom.reportRead();
    return super.textValue;
  }

  @override
  set textValue(String value) {
    _$textValueAtom.reportWrite(value, super.textValue, () {
      super.textValue = value;
    });
  }

  late final _$indexAtom =
      Atom(name: '_HomeScreenModelBase.index', context: context);

  @override
  int get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  late final _$errorTextAtom =
      Atom(name: '_HomeScreenModelBase.errorText', context: context);

  @override
  String get errorText {
    _$errorTextAtom.reportRead();
    return super.errorText;
  }

  @override
  set errorText(String value) {
    _$errorTextAtom.reportWrite(value, super.errorText, () {
      super.errorText = value;
    });
  }

  late final _$_HomeScreenModelBaseActionController =
      ActionController(name: '_HomeScreenModelBase', context: context);

  @override
  void setIsAvengersLoading({required bool isLoading}) {
    final _$actionInfo = _$_HomeScreenModelBaseActionController.startAction(
        name: '_HomeScreenModelBase.setIsAvengersLoading');
    try {
      return super.setIsAvengersLoading(isLoading: isLoading);
    } finally {
      _$_HomeScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAllAvengers({required List<AvengerBO> newAvengers}) {
    final _$actionInfo = _$_HomeScreenModelBaseActionController.startAction(
        name: '_HomeScreenModelBase.setAllAvengers');
    try {
      return super.setAllAvengers(newAvengers: newAvengers);
    } finally {
      _$_HomeScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError({required String text}) {
    final _$actionInfo = _$_HomeScreenModelBaseActionController.startAction(
        name: '_HomeScreenModelBase.setError');
    try {
      return super.setError(text: text);
    } finally {
      _$_HomeScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
allAvengers: ${allAvengers},
isAvengersLoading: ${isAvengersLoading},
textValue: ${textValue},
index: ${index},
errorText: ${errorText}
    ''';
  }
}
