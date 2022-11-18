import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:pollee/screens/create_poll/create_poll_view_model.dart';
import 'package:provider/provider.dart';

class CreatePollScreen extends StatelessWidget {
  const CreatePollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => CreatePollViewModel(),
      child: const _CreatePollScaffold(),
    );
  }
}

class _CreatePollScaffold extends StatefulWidget {
  const _CreatePollScaffold({Key? key}) : super(key: key);

  @override
  State<_CreatePollScaffold> createState() => _CreatePollScaffoldState();
}

class _CreatePollScaffoldState extends State<_CreatePollScaffold> {
  final _expiryDateController = TextEditingController();
  ReactionDisposer? _disposer;

  @override
  void initState() {
    _disposer = autorun(
      (_) {
        _expiryDateController.text =
            context.read<CreatePollViewModel>().formattedExpiryDateTime ?? '';
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<CreatePollViewModel>();
    return Observer(
      builder: (context) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                'Create a poll',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(24.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextField(
                      onChanged: (val) => runInAction(
                        () => viewModel.title = val,
                      ),
                      minLines: 1,
                      maxLines: 3,
                      maxLength: 140,
                      decoration: InputDecoration(
                        hintText: 'enter poll title here...',
                        labelText: 'Title',
                        errorText: viewModel.titleError,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ...viewModel.options
                        .mapIndexed(
                          (index, element) => Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  maxLength: 40,
                                  onChanged: (val) {
                                    runInAction(
                                      () => viewModel.setOptionValue(
                                        value: val,
                                        optionPosition: index,
                                      ),
                                    );
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'enter option value here...',
                                    labelText: 'Option ${index + 1}',
                                    errorText: viewModel.optionsErrors[index],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              if (viewModel.showDeleteOptionButton(index))
                                IconButton(
                                  onPressed: () =>
                                      viewModel.deleteOption(index),
                                  icon: const Icon(Icons.delete),
                                ),
                            ],
                          ),
                        )
                        .toList(),
                    if (viewModel.canAddNewOption) ...[
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () => viewModel.addNewOption(),
                        child: const Text(
                          'Add new option',
                        ),
                      ),
                    ],
                    const SizedBox(height: 20),
                    TextField(
                      controller: _expiryDateController,
                      readOnly: true,
                      onTap: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(const Duration(days: 7)),
                        );
                        if (date == null) {
                          return;
                        }
                        final time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (time == null) {
                          return;
                        }
                        runInAction(
                          () {
                            final selectedDateTime = DateTime(
                              date.year,
                              date.month,
                              date.day,
                              time.hour,
                              time.minute,
                              0,
                            );
                            viewModel.expiresAt = selectedDateTime;
                          },
                        );
                      },
                      decoration: InputDecoration(
                        hintText:
                            'set date and time when this poll should be closed',
                        labelText: 'Expires On',
                        errorText: viewModel.expiresAtError,
                      ),
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: viewModel.isFormValid
                          ? () => viewModel.createPoll()
                          : null,
                      child: const Text('Create'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _disposer?.call();
    super.dispose();
  }
}
