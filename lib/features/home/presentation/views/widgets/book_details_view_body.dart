import 'package:bookly_app/features/home/data/models/book_model.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manger/similar_books_cubit/similar_books_cubit.dart';
import 'books_details_section.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final BookEntity bookModel;

  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding:const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                BoolDetailsSection(bookModel: bookModel,),
                const  Expanded(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                const   SimilarBooksSection(),
                const  SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}