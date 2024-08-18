import 'package:bookly_app/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_error_widget.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'custom_loading_indicator.dart';

class FeaturedBooksListViewBloc extends StatelessWidget {
  const FeaturedBooksListViewBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return  FeaturedBooksListView(books: state.books);
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(error :state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}



