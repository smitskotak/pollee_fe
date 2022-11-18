import 'package:mobx/mobx.dart';
import 'package:pollee/models/poll/poll.dart';

part 'polls_list_view_model.g.dart';

class PollsListViewModel = _PollsListViewModel with _$PollsListViewModel;

abstract class _PollsListViewModel with Store {
  @observable
  ObservableList<Poll> polls = ObservableList.of([]);

  @observable
  bool isLoading = false;
}
