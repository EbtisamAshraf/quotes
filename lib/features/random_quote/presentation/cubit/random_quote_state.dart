part of 'random_quote_cubit.dart';

abstract class RandomQuoteState extends Equatable {
  const RandomQuoteState();

  @override
  List<Object> get props => [];
}

class RandomQuoteInitial extends RandomQuoteState {}

class RandomQuoteIsLoadingState extends RandomQuoteState {}

class RandomQuoteLoadedState extends RandomQuoteState {
  final Quote quote;

  const RandomQuoteLoadedState({required this.quote});

  @override
  List<Object> get props => [quote];
}

class RandomQuoteErrorState extends RandomQuoteState {
  final String msg;

  const RandomQuoteErrorState({required this.msg});

  @override
  List<Object> get props => [msg];
}
