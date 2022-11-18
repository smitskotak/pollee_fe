import 'package:mobx/mobx.dart';
import 'package:pollee/models/poll/poll.dart';
import 'package:pollee/repositories/polls_repository.dart';

part 'polls_list_view_model.g.dart';

class PollsListViewModel = _PollsListViewModel with _$PollsListViewModel;

abstract class _PollsListViewModel with Store {
  _PollsListViewModel({
    required this.pollsRepository,
    required this.isManageSection,
  }) {
    fetch();
  }

  final PollsRepository pollsRepository;
  bool isManageSection;

  @observable
  ObservableList<Poll> polls = ObservableList.of([]);

  @observable
  bool isLoading = false;

  @action
  Future<void> fetch() async {
    isLoading = true;
    final pollsList = await pollsRepository.fetchPolls(
      pendingOnly: isManageSection,
    );
    if (pollsList != null) {
      polls = ObservableList.of(pollsList);
    }
    isLoading = false;
  }

  Future<void> submitPoll({
    required Poll poll,
    required String option,
  }) async {
    try {
      final updatedPoll =
          await pollsRepository.submitVote(pollId: poll.id, option: option);
      if (updatedPoll != null) {
        final index = polls.indexOf(poll);
        polls[index] = updatedPoll;
      }
    } catch (err) {
      print(err);
    }
  }

  Future<void> approvePoll({
    required Poll poll,
  }) async {
    await pollsRepository.updatePoll(
      pollId: poll.id,
      status: 'APPROVED',
    );
    await fetch();
  }

  Future<void> rejectPoll({
    required Poll poll,
  }) async {
    await pollsRepository.updatePoll(
      pollId: poll.id,
      status: 'REJECTED',
    );
    await fetch();
  }
}
