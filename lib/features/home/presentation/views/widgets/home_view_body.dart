import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featured_books_list_view_bloc.dart';
import 'package:flutter/material.dart';
import 'best_seller_list_view.dart';
import 'custom_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              FeaturedBooksListViewBloc(),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: Styles.defaultPadding),
                child: Text(
                  "Newest Books",
                  style: Styles.textStyle18,
                ),
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Styles.defaultPadding),
            child: FeaturedBestSellerListView(),
          ),
        )
      ],
    );
  }
}
