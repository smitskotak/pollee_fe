// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'polls_list_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PollsListViewModel on _PollsListViewModel, Store {
  late final _$pollsAtom =
      Atom(name: '_PollsListViewModel.polls', context: context);

  @override
  ObservableList<Poll> get polls {
    _$pollsAtom.reportRead();
    return super.polls;
  }

  @override
  set polls(ObservableList<Poll> value) {
    _$pollsAtom.reportWrite(value, super.polls, () {
      super.polls = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_PollsListViewModel.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  @override
  String toString() {
    return '''
polls: ${polls},
isLoading: ${isLoading}
    ''';
  }
}
