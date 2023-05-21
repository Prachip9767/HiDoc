import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopLogo extends StatelessWidget {
  const TopLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return !kIsWeb
        ? Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: Container(
              height: 30,
              width: MediaQuery.of(Get.context!).size.width / 4,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16)),
                color: Colors.lightBlueAccent.withOpacity(0.4),
              ),
              child: Center(
                child: Text(
                  'hiDoc',
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    fontSize: 18,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
          )
        : SizedBox.shrink();
  }
}

class ReadMoreButton extends StatelessWidget {
  final double padding;
  final String title;
  const ReadMoreButton({super.key, required this.padding, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: Text(
            title,
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                kIsWeb ? Colors.cyan[600] : Colors.orange[600]),
            minimumSize:
                MaterialStateProperty.all(Size(kIsWeb ? 400 : 300, 50)),
            padding: MaterialStateProperty.all(EdgeInsets.all(10)),
          ),
        ),
      ),
    );
  }
}
