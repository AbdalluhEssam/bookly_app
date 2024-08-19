import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/core/utils/function/save_books.dart';
import '../../domain/entities/book_entity.dart';
import '../models/book_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchNewestBooks();
  Future<List<BookEntity>> fetchSimilarBooks({required String category});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
      endPoint: "volumes?q=subject:programming&Filtering=free-ebooks&startIndex=${pageNumber * 10}",
    );

    List<BookEntity> books = _getBookList(data);
    saveBooksData(books, kFeaturedBooks);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiService.get(
      endPoint: "volumes?q=computer science&Sorting=newest&Filtering=free-ebooks",
    );

    List<BookEntity> books = _getBookList(data);
    saveBooksData(books, kNewestBooks);
    return books;
  }

  List<BookEntity> _getBookList(Map<String, dynamic> data) {
    // Assuming data is a JSON object with a list of books
    List<BookEntity> books = []; // Parse data into a list of BookEntity objects
    for (var book in data['items']) {
      books.add(BookModel.fromJson(book));
    }
    return books;
  }

  @override
  Future<List<BookEntity>> fetchSimilarBooks({required String category}) async{
    var data = await apiService.get(
      endPoint: "volumes?q=subject:programming&Filtering=free-ebooks&Sorting=relevance",
    );

    List<BookEntity> books = _getBookList(data);
    saveBooksData(books, kNewestBooks);
    return books;
  }
}

// volumes?q=subject:programming&Filtering=free-ebooks&Sorting=relevance
