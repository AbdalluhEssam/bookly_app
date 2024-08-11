import 'package:bookly_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import '../models/book_model.dart';

abstract class HomeRepo {
  Future<Either<Failure,List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Failure,List<BookModel>>> fetchNewSetBooks();
}