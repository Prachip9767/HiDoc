import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class TopCardWidget extends StatelessWidget {
  final String imageUrl;
  final String articleTitle;
  final String articleDescription;

  const TopCardWidget({
    Key? key,
    required this.imageUrl,
    required this.articleTitle,
    required this.articleDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        elevation: 10,
        color: Colors.white.withOpacity(0.9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              if (kIsWeb)
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                        child: CachedNetworkImage(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height / 5,
                          imageUrl: imageUrl,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 16),
                            Text(
                              articleTitle,
                              style: context.textTheme.bodyText1?.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                height: 1.5,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              articleDescription,
                              style: context.textTheme.bodyText1?.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              if (!kIsWeb)
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                      child: CachedNetworkImage(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height / 5,
                        imageUrl: imageUrl,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          Text(
                            articleTitle,
                            style: context.textTheme.bodyText1?.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            articleDescription,
                            style: context.textTheme.bodyText1?.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
