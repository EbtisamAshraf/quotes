import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:quotes/core/error/failures.dart';
import 'package:quotes/core/use_cases/use_case.dart';
import 'package:quotes/features/random_quote/domain/entities/quote.dart';
import 'package:quotes/features/random_quote/domain/repositories/quote_repository.dart';

class GetRandomQuote implements UseCase<Quote, NoParams> {

  final QuoteRepository quoteRepository;

  GetRandomQuote({required this.quoteRepository});

  @override
  Future<Either<Failure, Quote>> call(NoParams params) {
    return quoteRepository.getRandomQuote();
  }
}

class LoginParams extends Equatable {
  final String userName;
  final String password;

  const LoginParams({required this.userName, required this.password});
  @override
  List<Object?> get props => [userName, password];
}
