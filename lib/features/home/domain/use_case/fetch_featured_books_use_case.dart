import 'package:bookly_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/use_cases/use_case.dart';
import '../entities/book_entity.dart';
import '../repos/home_reop.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call([int? params = 0]) async {
    return await homeRepo.fetchFeaturedBooks(
      pageNumber: params!,
    );
  }
}

