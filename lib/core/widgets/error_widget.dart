import 'package:flutter/material.dart';
import 'package:quotes/core/utils/app_colors.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({Key? key, this.onPressed}) : super(key: key);
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.warning_amber_rounded,
            color: AppColors.primaryColor,
            size: 50,
          ),
          const SizedBox(
            height: 20,
          ),
          Text('something went wrong',
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Please Try Again',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                primary: AppColors.primaryColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0)),
            child: const Text('Reload Screen'),
          ),
        ],
      ),
    );
  }
}
