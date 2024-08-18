import 'package:bookly_app/features/home/presentation/manger/similar_books_cubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import 'custom_book_item.dart';

class SimilarBookListView extends StatelessWidget {
  const SimilarBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.18,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.none,
                itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.bookDetailsView,extra: state.books[index]);
                      },
                      child: CustomBookImage(
                        bookImage: state.books[index].image ??
                            "",
                      ),
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      width: 8,
                    ),
                itemCount: state.books.length),
          );
        } else if (state is SimilarBooksFailure) {
          return Text(state.message);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
