import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/book_model.dart';
import '../../../domain/repos/home_reop.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());
    var result = await homeRepo.fetchSimilarBooks();
    result.fold((failure) => emit(SimilarBooksFailure(failure.errMessage)),
        (books) => emit(SimilarBooksSuccess(books)));
  }
}
