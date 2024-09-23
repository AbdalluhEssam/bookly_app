import 'dart:developer';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/use_case/fetch_newest_books_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'newset_books_state.dart';

class NewSetBooksCubit extends Cubit<NewSetBooksState> {
  NewSetBooksCubit(this.fetchNewestBooksUseCase) : super(NewSetBooksInitial());

  final FetchNewestBooksUseCase fetchNewestBooksUseCase;

  Future<void> fetchNewSetBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(NewSetBooksLoading());
    }else {
      emit(NewSetBooksPaginationLoading());
    }
    var result = await fetchNewestBooksUseCase.call(pageNumber);
    result.fold(
        (failure) {
          if (pageNumber == 0) {
            log('Fetch error: ${failure.errMessage}');
            emit(NewSetBooksFailure(errMessage: failure.errMessage));
          } else {
            emit(NewSetBooksPaginationFailure(errMessage: failure.errMessage));
          }
          emit(NewSetBooksFailure(errMessage: failure.errMessage));
        },
        (books) => emit(NewSetBooksSuccess(books: books)));
  }
}

