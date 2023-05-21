import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfferWidget extends StatelessWidget {
  final BuildContext context;

  const OfferWidget({super.key, required this.context});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
      child: Expanded(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!, width: 2),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  OfferItemWidget(
                    icon: Icons.quiz_sharp,
                    description: 'Participate and Win Exciting Prizes',
                    title: 'Quizzess :',
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  OfferItemWidget(
                    icon: Icons.calculate_outlined,
                    description: ' Get Access to 800+ Evidence Based calculators',
                    title: 'Medical\nCalculators :',
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}

class OfferItemWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const OfferItemWidget(
      {super.key,
      required this.icon,
      required this.description,
      required this.title});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
                height: 50,
                width: 50,
                color: Colors.blueAccent.withOpacity(0.2),
                child: Icon(
                  icon,
                  color: Colors.blueAccent,
                ))),
        const SizedBox(
          width: 12,
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.textTheme.bodyMedium,
              ),
              const SizedBox(
                width: 4,
              ),
              Expanded(
                child: Text(
                  description,
                  style: context.textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
