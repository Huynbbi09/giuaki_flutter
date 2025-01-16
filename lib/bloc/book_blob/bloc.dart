import 'package:bloc/bloc.dart';
import 'package:qltv/bloc/book_blob/event.dart';
import 'package:qltv/bloc/book_blob/state.dart';
import 'package:qltv/enity/book.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  BookBloc() : super(BookInitial()) {
    on<LoadBooks>((event, emit) {
      emit(BookLoading());
      try {
        emit(BookLoaded([]));
      } catch (e) {
        emit(BookError("Failed to load books"));
      }
    });

    on<AddBook>((event, emit) {
      if (state is BookLoaded) {
        final books = List<Book>.from((state as BookLoaded).books);

        final newId = books.isNotEmpty ? books.last.id + 1 : 1;

        final newBook = event.book.copyWith(id: newId);
        books.add(newBook);

        emit(BookLoaded(books));
      }
    });

    on<UpdateBook>((event, emit) {
      if (state is BookLoaded) {
        final books = (state as BookLoaded).books.map((book) {
          return book.id == event.book.id ? event.book : book;
        }).toList();
        emit(BookLoaded(books));
      }
    });

    on<DeleteBook>((event, emit) {
      if (state is BookLoaded) {
        final books = (state as BookLoaded)
            .books
            .where((book) => book.id != event.bookId)
            .toList();
        emit(BookLoaded(books));
      }
    });
  }
}
