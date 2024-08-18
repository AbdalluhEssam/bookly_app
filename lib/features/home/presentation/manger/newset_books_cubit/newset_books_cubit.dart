import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/use_case/fetch_newest_books_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/book_model.dart';
part 'newset_books_state.dart';

class NewSetBooksCubit extends Cubit<NewSetBooksState> {
  NewSetBooksCubit(this.fetchNewestBooksUseCase) : super(NewSetBooksInitial());

  final FetchNewestBooksUseCase fetchNewestBooksUseCase;

  Future<void> fetchNewSetBooks() async {
    emit(NewSetBooksLoading());
    var result = await fetchNewestBooksUseCase.call();
    result.fold(
        (failure) => emit(NewSetBooksFailure(errMessage: failure.errMessage)),
        (books) => emit(NewSetBooksSuccess(books: books)));
  }
}
