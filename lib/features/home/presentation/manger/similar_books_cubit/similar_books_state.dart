part of 'similar_books_cubit.dart';

sealed class SimilarBooksState {}

final class SimilarBooksInitial extends SimilarBooksState {}

final class SimilarBooksLoading extends SimilarBooksState {}

final class SimilarBooksFailure extends SimilarBooksState {
  String message;

  SimilarBooksFailure(this.message);
}

final class SimilarBooksSuccess extends SimilarBooksState {
  List<BookModel> books;

  SimilarBooksSuccess(this.books);
}
