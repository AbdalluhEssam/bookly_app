import 'package:bookly_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

import '../entities/book_entity.dart';
import '../repos/home_reop.dart';

class FetchFeaturedBooksUseCase {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase(this.homeRepo);

  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    return await homeRepo.fetchFeaturedBooks();
  }
}
