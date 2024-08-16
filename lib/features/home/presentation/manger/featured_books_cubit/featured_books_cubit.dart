import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/book_model.dart';
import '../../../domain/repos/home_reop.dart';
part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    var result = await homeRepo.fetchFeaturedBooks();
    // result.fold(
    //     (failure) => emit(FeaturedBooksFailure(errMessage: failure.errMessage)),
    //     (books) => emit(FeaturedBooksSuccess(books: books)));
  }
}
