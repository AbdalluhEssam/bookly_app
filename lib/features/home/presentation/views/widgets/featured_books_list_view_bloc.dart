import 'package:bookly_app/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_error_widget.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/book_entity.dart';
import 'custom_loading_indicator.dart';

class FeaturedBooksListViewBloc extends StatefulWidget {
  const FeaturedBooksListViewBloc({super.key});

  @override
  State<FeaturedBooksListViewBloc> createState() =>
      _FeaturedBooksListViewBlocState();
}

class _FeaturedBooksListViewBlocState extends State<FeaturedBooksListViewBloc> {
  List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccess) {
          books.addAll(state.books);
        }

        if (state is FeaturedBooksPaginationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage,style: const TextStyle(color: Colors.black),),
              duration: const Duration(seconds: 3),
            ),

          );
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccess ||
            state is FeaturedBooksPaginationLoading ||
            state is FeaturedBooksPaginationFailure) {
          return FeaturedBooksListView(books: books);
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(error: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
