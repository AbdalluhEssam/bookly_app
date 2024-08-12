import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_error_widget.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.28,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.none,
                padding: const EdgeInsetsDirectional.only(
                    start: Styles.defaultPadding),
                itemBuilder: (context, index) => CustomBookImage(
                      bookImage:
                          state.books[index].volumeInfo.imageLinks?.thumbnail ??
                              "",
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      width: 12,
                    ),
                itemCount: state.books.length),
          );
        } else if (state is FeaturedBooksFailure) {
          return Center(
            child: CustomErrorWidget(error: state.errMessage),
          );
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
