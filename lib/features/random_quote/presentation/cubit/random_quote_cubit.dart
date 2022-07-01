import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:quotes/core/use_cases/use_case.dart';
import 'package:quotes/core/utils/app_strings.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/quote.dart';
import '../../domain/usecases/get_random_quote.dart';
part 'random_quote_state.dart';

class RandomQuoteCubit extends Cubit<RandomQuoteState> {
  final GetRandomQuote getRandomQuoteUseCase;

  RandomQuoteCubit({required this.getRandomQuoteUseCase})
      : super(RandomQuoteInitial());

  Future<void> getRandomQuote() async {
    emit(RandomQuoteIsLoadingState());

    Either<Failure, Quote> response = await getRandomQuoteUseCase(NoParams());

    emit(
      response.fold(
        (failure) => RandomQuoteErrorState(msg: mapFailureToMsg(failure)),
        (quote) => RandomQuoteLoadedState(quote: quote),
      ),
    );
  }

  String mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.serverFailureMsg;
      case CacheFailure:
        return AppStrings.casheFailureMsg;

      default:
        return AppStrings.unexpectedErrorMsg;
    }
  }
}
