import 'package:flutter/material.dart';
import 'package:quotes/core/utils/app_colors.dart';
import 'package:quotes/features/random_quote/domain/entities/quote.dart';

class QuoteContent extends StatelessWidget {
  const QuoteContent({Key? key, required this.quote}) : super(key: key);
  final Quote quote;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(20.0),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(30)),
        child: DefaultTextStyle(
          style: Theme.of(context).textTheme.bodyLarge!,
          child: Column(
            children:  [
              Text(
                quote.quote,
                textAlign: TextAlign.right,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(quote.author),
            ],
          ),
        ));
  }
}
