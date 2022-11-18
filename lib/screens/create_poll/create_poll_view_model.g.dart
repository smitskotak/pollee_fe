// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_poll_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreatePollViewModel on _CreatePollViewModel, Store {
  Computed<String?>? _$titleErrorComputed;

  @override
  String? get titleError =>
      (_$titleErrorComputed ??= Computed<String?>(() => super.titleError,
              name: '_CreatePollViewModel.titleError'))
          .value;
  Computed<List<String?>>? _$optionsErrorsComputed;

  @override
  List<String?> get optionsErrors => (_$optionsErrorsComputed ??=
          Computed<List<String?>>(() => super.optionsErrors,
              name: '_CreatePollViewModel.optionsErrors'))
      .value;
  Computed<bool>? _$canAddNewOptionComputed;

  @override
  bool get canAddNewOption =>
      (_$canAddNewOptionComputed ??= Computed<bool>(() => super.canAddNewOption,
              name: '_CreatePollViewModel.canAddNewOption'))
          .value;
  Computed<String?>? _$formattedExpiryDateTimeComputed;

  @override
  String? get formattedExpiryDateTime => (_$formattedExpiryDateTimeComputed ??=
          Computed<String?>(() => super.formattedExpiryDateTime,
              name: '_CreatePollViewModel.formattedExpiryDateTime'))
      .value;
  Computed<String?>? _$expiresAtErrorComputed;

  @override
  String? get expiresAtError => (_$expiresAtErrorComputed ??= Computed<String?>(
          () => super.expiresAtError,
          name: '_CreatePollViewModel.expiresAtError'))
      .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_CreatePollViewModel.isFormValid'))
          .value;

  late final _$titleAtom =
      Atom(name: '_CreatePollViewModel.title', context: context);

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$optionsAtom =
      Atom(name: '_CreatePollViewModel.options', context: context);

  @override
  ObservableList<OptionViewModel> get options {
    _$optionsAtom.reportRead();
    return super.options;
  }

  @override
  set options(ObservableList<OptionViewModel> value) {
    _$optionsAtom.reportWrite(value, super.options, () {
      super.options = value;
    });
  }

  late final _$expiresAtAtom =
      Atom(name: '_CreatePollViewModel.expiresAt', context: context);

  @override
  DateTime? get expiresAt {
    _$expiresAtAtom.reportRead();
    return super.expiresAt;
  }

  @override
  set expiresAt(DateTime? value) {
    _$expiresAtAtom.reportWrite(value, super.expiresAt, () {
      super.expiresAt = value;
    });
  }

  late final _$createPollAsyncAction =
      AsyncAction('_CreatePollViewModel.createPoll', context: context);

  @override
  Future<void> createPoll() {
    return _$createPollAsyncAction.run(() => super.createPoll());
  }

  late final _$_CreatePollViewModelActionController =
      ActionController(name: '_CreatePollViewModel', context: context);

  @override
  void addNewOption() {
    final _$actionInfo = _$_CreatePollViewModelActionController.startAction(
        name: '_CreatePollViewModel.addNewOption');
    try {
      return super.addNewOption();
    } finally {
      _$_CreatePollViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteOption(int position) {
    final _$actionInfo = _$_CreatePollViewModelActionController.startAction(
        name: '_CreatePollViewModel.deleteOption');
    try {
      return super.deleteOption(position);
    } finally {
      _$_CreatePollViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOptionValue({required String value, required int optionPosition}) {
    final _$actionInfo = _$_CreatePollViewModelActionController.startAction(
        name: '_CreatePollViewModel.setOptionValue');
    try {
      return super.setOptionValue(value: value, optionPosition: optionPosition);
    } finally {
      _$_CreatePollViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
options: ${options},
expiresAt: ${expiresAt},
titleError: ${titleError},
optionsErrors: ${optionsErrors},
canAddNewOption: ${canAddNewOption},
formattedExpiryDateTime: ${formattedExpiryDateTime},
expiresAtError: ${expiresAtError},
isFormValid: ${isFormValid}
    ''';
  }
}
