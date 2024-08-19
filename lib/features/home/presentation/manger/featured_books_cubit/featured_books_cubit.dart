import 'dart:developer';

import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/use_case/fetch_featured_books_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.featuredBooksUseCase) : super(FeaturedBooksInitial());

  final FetchFeaturedBooksUseCase featuredBooksUseCase;

  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FeaturedBooksLoading());
    } else {
      emit(FeaturedBooksPaginationLoading());
    }
    final result = await featuredBooksUseCase.call(pageNumber);
    result.fold(
      (failure) {
        if (pageNumber == 0) {
          log('Fetch error: ${failure.errMessage}');
          emit(FeaturedBooksFailure(errMessage: failure.errMessage));
        } else {
          emit(FeaturedBooksPaginationFailure(errMessage: failure.errMessage));
        }
      },
      (books) {
        log('Fetched books: ${books.length}');
        emit(FeaturedBooksSuccess(books: books));
      },
    );
  }
}
