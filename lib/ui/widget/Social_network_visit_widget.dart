import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class SocialNetworkVisit extends StatelessWidget {
  const SocialNetworkVisit({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kIsWeb
          ? Colors.cyan[100]
          : Colors.orange[100],
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Social Network for doctors - A special feature on Hidoc Dr',
                  style: context.textTheme.labelLarge?.copyWith(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w900),
                ),
              ),
              ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                      height: 30,
                      width: 70,
                      color:kIsWeb?Colors.cyan[600]:Colors.orange[600],
                      child: Center(
                        child: Text(
                          'Visit',
                          style: context.textTheme.labelLarge?.copyWith(
                              color: Colors.white,
                              fontSize: 16,fontWeight: FontWeight.w900),
                        ),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
