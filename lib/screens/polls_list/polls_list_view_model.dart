import 'package:mobx/mobx.dart';
import 'package:pollee/models/poll/poll.dart';
import 'package:pollee/repositories/polls_repository.dart';

part 'polls_list_view_model.g.dart';

class PollsListViewModel = _PollsListViewModel with _$PollsListViewModel;

abstract class _PollsListViewModel with Store {
  _PollsListViewModel({
    required this.pollsRepository,
  }) {
    fetch();
  }

  final PollsRepository pollsRepository;

  @observable
  ObservableList<Poll> polls = ObservableList.of([]);

  @observable
  bool isLoading = false;

  @action
  Future<void> fetch() async {
    isLoading = true;
    try {
      final pollsList = await pollsRepository.fetchPolls();
      polls = ObservableList.of(pollsList);
    } catch (err) {
      print(err);
    }
    isLoading = false;
  }

  Future<void> submitPoll({
    required Poll poll,
    required String option,
  }) async {
    try {
      await pollsRepository.submitPoll(poll: poll, option: option);
      await fetch();
    } catch (err) {
      print(err);
    }
  }

  Future<void> approvePoll({
    required Poll poll,
  }) async {
    try {
      await pollsRepository.approvePoll(poll: poll);
      await fetch();
    } catch (err) {
      print(err);
    }
  }

  Future<void> rejectPoll({
    required Poll poll,
  }) async {
    try {
      await pollsRepository.rejectPoll(poll: poll);
      await fetch();
    } catch (err) {
      print(err);
    }
  }
}
