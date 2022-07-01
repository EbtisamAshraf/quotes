import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:quotes/core/network/network_info.dart';
import 'package:quotes/features/random_quote/data/data_sources/random_quote_local_data_source.dart';
import 'package:quotes/features/random_quote/data/data_sources/random_quote_remote_data_source.dart';
import 'package:quotes/features/random_quote/data/repositories/quote_repository_impl.dart';
import 'package:quotes/features/random_quote/domain/repositories/quote_repository.dart';
import 'package:quotes/features/random_quote/domain/usecases/get_random_quote.dart';
import 'package:quotes/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future <void> init() async {
  ///feature
  //bloc
  sl.registerFactory(() => RandomQuoteCubit(getRandomQuoteUseCase: sl()));
  // use case
  sl.registerLazySingleton(() => GetRandomQuote(quoteRepository: sl()));
  //Repository

  sl.registerLazySingleton<QuoteRepository>(() => QuoteRepositoryImpl(
      randomQuoteLocalDataSource: sl(),
      randomQuoteRemoteDataSource: sl(),
      networkInfo: sl()));

  // data source
  sl.registerLazySingleton<RandomQuoteLocalDataSource>(
      () => RandomQuoteLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<RandomQuoteRemoteDataSource>(
      () => RandomQuoteRemoteDataSourceImpl(client: sl()));
  // core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));

  // external

  final sharedPreferences = await SharedPreferences.getInstance();

  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
