import 'package:flutter/material.dart';
import 'package:pollee/models/poll/poll.dart';

class PollCard extends StatelessWidget {
  const PollCard({
    super.key,
    required this.poll,
  });

  final Poll poll;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return Card(
      child: Column(
        children: [
          Text(
            poll.question,
            style: textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
