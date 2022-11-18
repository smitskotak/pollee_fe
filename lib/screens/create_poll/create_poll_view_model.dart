import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

part 'create_poll_view_model.g.dart';

class CreatePollViewModel = _CreatePollViewModel with _$CreatePollViewModel;

abstract class _CreatePollViewModel with Store {
  @observable
  String title = '';

  @computed
  String? get titleError => title.trim().isEmpty ? 'Required!' : null;

  @observable
  ObservableList<OptionViewModel> options = ObservableList.of([
    OptionViewModel(value: null),
    OptionViewModel(value: null),
  ]);

  @computed
  List<String?> get optionsErrors {
    return options.map(
      (element) {
        if (element.value == null || element.value!.trim().isEmpty) {
          return 'Required!';
        } else {
          return null;
        }
      },
    ).toList();
  }

  @computed
  bool get canAddNewOption => options.length < 5;

  @observable
  DateTime? expiresAt;

  @computed
  String? get formattedExpiryDateTime {
    if (expiresAt == null) {
      return null;
    }
    return DateFormat('dd-MM-yyyy HH:mm').format(expiresAt!);
  }

  @computed
  String? get expiresAtError {
    if (expiresAt == null) {
      return 'Required';
    }
    return null;
  }

  @computed
  bool get isFormValid {
    if (titleError != null) {
      return false;
    }

    final hasAnyOptionError = optionsErrors
        .map((e) => e != null)
        .reduce((value, element) => value || element);
    if (hasAnyOptionError) {
      return false;
    }

    return true;
  }

  bool showDeleteOptionButton(int position) {
    return position >= 2;
  }

  @action
  void addNewOption() {
    options.add(OptionViewModel(value: null));
  }

  @action
  void deleteOption(int position) {
    options.removeAt(position);
  }

  @action
  void setOptionValue({
    required String value,
    required int optionPosition,
  }) {
    options[optionPosition] = OptionViewModel(value: value);
  }

  @action
  Future<void> createPoll() async {
    // TODO: Make API call
  }
}

class OptionViewModel {
  final String? value;

  OptionViewModel({
    required this.value,
  });
}
