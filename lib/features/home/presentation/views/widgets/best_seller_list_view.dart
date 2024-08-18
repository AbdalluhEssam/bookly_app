import 'package:bookly_app/features/home/presentation/manger/newset_books_cubit/newset_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'best_seller_list_view_item.dart';
import 'custom_error_widget.dart';
import 'custom_loading_indicator.dart';

class FeaturedBestSellerListView extends StatelessWidget {
  const FeaturedBestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewSetBooksCubit, NewSetBooksState>(
      builder: (context, state) {
        if (state is NewSetBooksSuccess) {
          return ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => BestListViewItem(bookModel: state.books[index]),
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemCount: state.books.length,
          );
        } else if (state is NewSetBooksFailure) {
          return Center(child: CustomErrorWidget(error: state.errMessage));
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
