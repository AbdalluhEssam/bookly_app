part of 'newset_books_cubit.dart';

sealed class NewSetBooksState {}

final class NewSetBooksInitial extends NewSetBooksState {}

final class NewSetBooksLoading extends NewSetBooksState {}
final class NewSetBooksPaginationLoading extends NewSetBooksState {}

final class NewSetBooksSuccess extends NewSetBooksState {
  final List<BookEntity> books;

  NewSetBooksSuccess({required this.books});
}

final class NewSetBooksFailure extends NewSetBooksState {
  final String errMessage;

  NewSetBooksFailure({required this.errMessage});
}
final class NewSetBooksPaginationFailure extends NewSetBooksState {
  final String errMessage;

  NewSetBooksPaginationFailure({required this.errMessage});
}
