import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/book_model.dart';
import '../../../domain/repos/home_reop.dart';

part 'newset_books_state.dart';

class NewSetBooksCubit extends Cubit<NewSetBooksState> {
  NewSetBooksCubit(this.homeRepo) : super(NewSetBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchNewSetBooks() async {
    emit(NewSetBooksLoading());
    var result = await homeRepo.fetchNewestBooks();
    // result.fold(
    //     (failure) => emit(NewSetBooksFailure(errMessage: failure.errMessage)),
    //     (books) => emit(NewSetBooksSuccess(books: books)));
  }
}
