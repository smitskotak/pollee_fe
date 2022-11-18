import 'package:mobx/mobx.dart';
import 'package:pollee/models/poll/poll.dart';

part 'polls_list_view_model.g.dart';

class PollsListViewModel = _PollsListViewModel with _$PollsListViewModel;

abstract class _PollsListViewModel with Store {
  _PollsListViewModel() {
    fetch();
  }

  @observable
  ObservableList<Poll> polls = ObservableList.of([]);

  @observable
  bool isLoading = false;

  @action
  Future<void> fetch() async {
    isLoading = true;
    final pollsList = await getPolls();
    isLoading = false;
    polls = ObservableList.of(pollsList);
  }

  Future<void> fetchMore() async {
    // TODO:
  }

  Future<void> submitPoll({
    required Poll poll,
    required String option,
  }) async {
    // TODO:
    await Future.delayed(Duration(seconds: 2));
  }

  Future<void> approvePoll({
    required Poll poll,
  }) async {
    // TODO:
    await Future.delayed(Duration(seconds: 2));
  }

  Future<void> rejectPoll({
    required Poll poll,
  }) async {
    // TODO:
    await Future.delayed(Duration(seconds: 2));
  }
}

Future<List<Poll>> getPolls() async {
  await Future.delayed(const Duration(seconds: 2));
  return [
    Poll(
      id: '1',
      question: 'What is weekend look like?',
      options: [
        'Movies',
        'Sports',
      ],
      status: 'PUBLISHED',
      expiresOn: DateTime(2022, 11, 23),
      selectedChoice: 'Movies',
      votesCount: 20,
    ),
    Poll(
      id: '2',
      question: 'What is weekend look like?',
      options: [
        'Movies',
        'Sports',
        'Leisure',
      ],
      status: 'PENDING',
      expiresOn: DateTime(2022, 11, 27),
      votesCount: 23,
    ),
  ];
}
