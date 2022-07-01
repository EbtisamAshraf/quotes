import 'package:quotes/core/error/exceptions.dart';
import 'package:quotes/core/network/network_info.dart';
import 'package:quotes/features/random_quote/data/data_sources/random_quote_remote_data_source.dart';
import 'package:quotes/features/random_quote/domain/entities/quote.dart';
import 'package:quotes/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:quotes/features/random_quote/domain/repositories/quote_repository.dart';
import '../data_sources/random_quote_local_data_source.dart';

class QuoteRepositoryImpl implements QuoteRepository {
  final NetworkInfo networkInfo;
  final RandomQuoteLocalDataSource randomQuoteLocalDataSource;
  final RandomQuoteRemoteDataSource randomQuoteRemoteDataSource;

  QuoteRepositoryImpl(
      {required this.networkInfo,
      required this.randomQuoteLocalDataSource,
      required this.randomQuoteRemoteDataSource});

  @override
  Future<Either<Failure, Quote>> getRandomQuote() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteRandomQuote =
            await randomQuoteRemoteDataSource.getRandomQuote();
        randomQuoteLocalDataSource.cacheQuote(remoteRandomQuote);
        return Right(remoteRandomQuote);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localRandomQuote =
            await randomQuoteLocalDataSource.getLastRandomQuote();
        return Right(localRandomQuote);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
