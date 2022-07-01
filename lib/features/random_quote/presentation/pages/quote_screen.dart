import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/core/utils/app_colors.dart';
import 'package:quotes/core/utils/app_strings.dart';
import 'package:quotes/core/widgets/error_widget.dart';
import 'package:quotes/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:quotes/features/random_quote/presentation/widgets/qoute_content.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quotes/injection_container.dart' as di;

class QuoteScreen extends StatelessWidget {
  const QuoteScreen({Key? key}) : super(key: key);

   @override
  Widget build(BuildContext context) {
    return BlocProvider(
                  create: (context) => di.sl<RandomQuoteCubit>()..getRandomQuote(),
                  child: RefreshIndicator(
        child: Scaffold(
            appBar: AppBar(
                title: const Text(
              AppStrings.appName,
            )),
            body: BlocBuilder<RandomQuoteCubit, RandomQuoteState>(
              builder: (context, state) {
                if (state is RandomQuoteIsLoadingState) {
                  return  Center(
                    child: SpinKitRotatingCircle(
              
                      color: AppColors.hintColor,
                      size: 50.0,
                    ),
                  );
                } else if (state is RandomQuoteErrorState) {
                  return  CustomErrorWidget(onPressed: (){},);
                } else if (state is RandomQuoteLoadedState) {
                  return Column(children: [
                    QuoteContent(quote: state.quote),
                    ElevatedButton(
                      onPressed: () => BlocProvider.of<RandomQuoteCubit>(context).getRandomQuote(),
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.primaryColor,
                        shape: const CircleBorder(),
                      ),
                      child: const Icon(Icons.refresh),
                    )
                  ]);
                } else {
                  return const Center(
                    child: SpinKitRotatingCircle(
                      color: Colors.white,
                      size: 50.0,
                    ),
                  );
                }
              },
            )),
        onRefresh: () =>
            BlocProvider.of<RandomQuoteCubit>(context).getRandomQuote()),
                );
  }



}
