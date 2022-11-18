import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pollee/components/poll_card.dart';
import 'package:pollee/repositories/polls_repository.dart';
import 'package:pollee/screens/polls_list/polls_list_view_model.dart';
import 'package:provider/provider.dart';

class PollsListScreen extends StatelessWidget {
  const PollsListScreen({
    super.key,
    required this.isManageSection,
  });

  final bool isManageSection;

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PollsListViewModel(
        pollsRepository: context.read<PollsRepository>(),
        isManageSection: isManageSection,
      ),
      child: const _PollsList(),
    );
  }
}

class _PollsList extends StatelessWidget {
  const _PollsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<PollsListViewModel>();
    return SafeArea(
      bottom: false,
      child: Observer(
        builder: (context) {
          return RefreshIndicator(
            onRefresh: () => viewModel.fetch(),
            child: CustomScrollView(
              slivers: [
                if (viewModel.polls.isNotEmpty)
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return PollCard(
                          poll: viewModel.polls[index],
                        );
                      },
                      childCount: viewModel.polls.length,
                    ),
                  ),
                if (viewModel.isLoading)
                  const SliverToBoxAdapter(
                    child: _LoadingCard(),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _LoadingCard extends StatelessWidget {
  const _LoadingCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 50,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
