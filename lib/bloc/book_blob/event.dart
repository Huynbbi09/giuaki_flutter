import 'package:equatable/equatable.dart';
import 'package:qltv/enity/book.dart';

abstract class BookEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddBook extends BookEvent {
  final Book book;

  AddBook(this.book);

  @override
  List<Object?> get props => [book];
}

class UpdateBook extends BookEvent {
  final Book book;

  UpdateBook(this.book);

  @override
  List<Object?> get props => [book];
}

class DeleteBook extends BookEvent {
  final int bookId;

  DeleteBook(this.bookId);

  @override
  List<Object?> get props => [bookId];
}

class LoadBooks extends BookEvent {}
