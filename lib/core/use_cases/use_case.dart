import 'package:dartz/dartz.dart';
import '../errors/failures.dart';


// Generic UseCase<Type, Params>
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call([Params? params]);
}

class NoParams {}
