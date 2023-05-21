import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:intl/intl.dart';

class TopCardWidget extends StatelessWidget {
  final String imageUrl;
  final String articleTitle;
  final String articleDescription;
  final DateTime? articlePublishedDate;

  const TopCardWidget({
    Key? key,
    required this.imageUrl,
    required this.articleTitle,
    required this.articleDescription, this.articlePublishedDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (kIsWeb)
          Container(
            color: Colors.grey[200],
            height: MediaQuery.of(Get.context!).size.height/3,
            child: Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        width: double.infinity,
                        height: double.maxFinite,
                        imageUrl:imageUrl,
                        fit: BoxFit.fill,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration:  BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                            ),
                            color: Colors.cyan[400],
                          ),
                          child: Column(
                            children: const [
                              SizedBox(height: 10),
                              Text('Points', style: TextStyle(color: Colors.white)),
                              SizedBox(height: 4),
                              Text(
                                '2',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 Text('Read full article to earn points',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.cyan[400],
                                      fontStyle: FontStyle.italic,
                                    )),
                                if(articlePublishedDate!=null)...[
                                  SizedBox(height: 8,),
                                  Text(
                                    'Published Date: ${
                                      DateFormat('yyyy MMMM dd')
                                          .format(articlePublishedDate!)
                                    }',
                                  )
                                ]
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        if (!kIsWeb)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Card(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    child: CachedNetworkImage(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 5,
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSw7cF_dIQaF1cYoka6EZ1tBRTNbmVw9JwZIQ&usqp=CAU',
                      // imageUrl,
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
                            height: 1.3,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Text('Read full article to earn points',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.cyan[400],
                                  fontStyle: FontStyle.italic,
                                )),
                          ],
                        ),
                      ),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.only(bottomRight: Radius.circular(16)),
                            color: Colors.cyan[400]),
                        child: Column(
                          children: const [
                            SizedBox(
                              height: 10,
                            ),
                            Text('Points', style: TextStyle(color: Colors.white)),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              '2',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),

      ],
    );

  }
}
