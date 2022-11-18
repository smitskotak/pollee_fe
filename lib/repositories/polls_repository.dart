import 'package:dio/dio.dart';
import 'package:pollee/models/poll/poll.dart';

class PollsRepository {
  PollsRepository({
    required this.apiClient,
  });

  final Dio apiClient;

  Future<bool> createPoll({
    required String question,
    required List<String> options,
    required String expiryDate,
  }) async {
    try {
      final response = await apiClient.post(
        '/polls/createPoll',
        data: {
          'question': question,
          'choices': options,
          'expirationDateTime': expiryDate,
        },
      );
      return response.data['success'] == true;
    } catch (err) {
      print(err);
      return false;
    }
  }

  Future<List<Poll>?> fetchPolls({
    bool? pendingOnly,
  }) async {
    try {
      final response = await apiClient.post(
        '/polls/fetchAll',
        data: FormData.fromMap(
          {
            if (pendingOnly ?? false) 'status': 'PENDING',
          },
        ),
      );
      final list = response.data['content'] as List;
      final polls = list.map((json) => Poll.fromJson(json)).toList();
      return polls;
    } catch (err) {
      print(err);
      return null;
    }
  }

  Future<Poll?> submitVote({
    required String pollId,
    required String option,
  }) async {
    try {
      final response = await apiClient.post(
        '/votes/saveVote',
        data: {
          'pollId': pollId,
          'choiceId': option,
        },
      );
      final data = response.data as Map;
      final poll = Poll.fromJson(data.cast<String, dynamic>());
      return poll;
    } catch (err) {
      print(err);
      return null;
    }
  }

  Future<bool> updatePoll({
    required String pollId,
    required String status,
  }) async {
    try {
      final response = await apiClient.post(
        '/polls/updatePoll',
        data: {
          'pollId': pollId,
          'status': status,
        },
      );
      return response.data['success'] == true;
    } catch (err) {
      print(err);
      return false;
    }
  }
}
