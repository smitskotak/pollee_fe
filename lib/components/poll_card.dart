import 'package:flutter/material.dart';
import 'package:pollee/models/poll/poll.dart';
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
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

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
            ...widget.poll.options.map(
              (e) => SelectableOptionWidget(
                value: e,
                isSelected: _selectedOption == e,
                onOptionTapped: () {
                  setState(() {
                    if (_selectedOption == e) {
                      _selectedOption = null;
                    } else {
                      _selectedOption = e;
                    }
                  });
                },
              ),
            ),
            const SizedBox(height: 8),
            if (_selectedOption != null)
              if (_isSubmitting)
                const Center(
                  child: CircularProgressIndicator(),
                )
              else
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
                  child: Text('Submit'),
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
            Icon(Icons.check),
          ],
        ],
      ),
    );
  }
}
