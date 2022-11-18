import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pollee/models/poll/poll.dart';
import 'package:pollee/repositories/user_repository.dart';
import 'package:pollee/screens/polls_list/polls_list_view_model.dart';
import 'package:provider/provider.dart';

class PollCard extends StatefulWidget {
  const PollCard({
    super.key,
    required this.poll,
  });

  final Poll poll;

  @override
  State<PollCard> createState() => _PollCardState();
}

class _PollCardState extends State<PollCard> {
  String? _selectedOption;
  bool _isSubmitting = false;

  @override
  void initState() {
    _selectedOption = widget.poll.selectedChoice;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final isPollExpired =
        widget.poll.expirationDateTime.isBefore(DateTime.now());
    final hasUserVoted = widget.poll.selectedChoice != null;
    final isPollPendingToBeApproved = widget.poll.status == 'PENDING';
    final showSubmitButton = !isPollExpired &&
        !isPollPendingToBeApproved &&
        !hasUserVoted &&
        !_isSubmitting;
    final isUserAdmin = context.read<UserRepository>().isUserAdmin;
    final showApproveOrRejectButton =
        isPollPendingToBeApproved && isUserAdmin && !_isSubmitting;

    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 12,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              widget.poll.question,
              style: textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            ...widget.poll.choices.map(
              (e) {
                if (hasUserVoted) {
                  return VotedOptionWidget(
                    value: e.text,
                    votesPercentages: e.voteCount / widget.poll.totalVotes,
                  );
                }
                return SelectableOptionWidget(
                  value: e.text,
                  isSelected: _selectedOption == e.text,
                  onOptionTapped: () {
                    if (isPollPendingToBeApproved) {
                      return;
                    }
                    setState(() {
                      if (_selectedOption == e.text) {
                        _selectedOption = null;
                      } else {
                        _selectedOption = e.text;
                      }
                    });
                  },
                );
              },
            ),
            const SizedBox(height: 8),
            if (_isSubmitting)
              const Center(
                child: CircularProgressIndicator(),
              ),
            if (showSubmitButton)
              ElevatedButton(
                onPressed: () async {
                  setState(() {
                    _isSubmitting = true;
                  });
                  await context.read<PollsListViewModel>().submitPoll(
                        poll: widget.poll,
                        option: _selectedOption!,
                      );
                  setState(() {
                    _isSubmitting = false;
                  });
                },
                child: const Text('Submit'),
              ),
            if (showApproveOrRejectButton)
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          _isSubmitting = true;
                        });
                        await context
                            .read<PollsListViewModel>()
                            .approvePoll(poll: widget.poll);
                        setState(() {
                          _isSubmitting = false;
                        });
                      },
                      child: const Text('Approve'),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          _isSubmitting = true;
                        });
                        await context
                            .read<PollsListViewModel>()
                            .rejectPoll(poll: widget.poll);
                        setState(() {
                          _isSubmitting = false;
                        });
                      },
                      child: const Text('Reject'),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class SelectableOptionWidget extends StatelessWidget {
  const SelectableOptionWidget({
    super.key,
    required this.value,
    required this.isSelected,
    required this.onOptionTapped,
  });

  final String value;
  final bool isSelected;
  final VoidCallback onOptionTapped;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onOptionTapped,
      child: Row(
        children: [
          Expanded(
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
          if (isSelected) ...[
            const SizedBox(width: 8),
            const Icon(Icons.check),
          ],
        ],
      ),
    );
  }
}

class VotedOptionWidget extends StatelessWidget {
  const VotedOptionWidget({
    super.key,
    required this.value,
    required this.votesPercentages,
  });

  final String value;

  final double votesPercentages;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LinearPercentIndicator(
        lineHeight: 24,
        percent: votesPercentages,
        center: Text(
          value,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        barRadius: const Radius.circular(12),
        backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        progressColor: Theme.of(context).colorScheme.primaryContainer,
      ),
    );
  }
}
