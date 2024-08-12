import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'best_seller_list_view.dart';
import 'custom_app_bar.dart';
import 'featured_list_view.dart';

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
              CustomApBar(),
              FeaturedBooksListView(),
              SizedBox(
                height: 40,
              ),
              Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: Styles.defaultPadding),
                  child: Text(
                    "Newset Books",
                    style: Styles.textStyle18,
                  )),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Styles.defaultPadding),
            child: FeaturedBastSellerListView(),
          ),
        )
      ],
    );
  }
}
