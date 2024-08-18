import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/use_case/fetch_featured_books_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.featuredBooksUseCase) : super(FeaturedBooksInitial());

  final FetchFeaturedBooksUseCase featuredBooksUseCase;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    final result = await featuredBooksUseCase.call();
    result.fold(
          (failure) {
        print('Fetch error: ${failure.errMessage}');
        emit(FeaturedBooksFailure(errMessage: failure.errMessage));
      },
          (books) {
        print('Fetched books: ${books.length}');
        emit(FeaturedBooksSuccess(books: books));
      },
    );
  }

}
