import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class BarContainer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return   Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Container(
      width: kIsWeb ? screenWidth * 0.8 : double.infinity,
      constraints: kIsWeb
          ? const BoxConstraints(maxWidth: 600)
          : const BoxConstraints(),
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Criticle Care',
                  style: context.textTheme.labelLarge,
                ),
              ),
              const Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Icon(Icons.arrow_drop_down_outlined),
                ),
              ),
        ],

      ),
    ),
  );

  }

}