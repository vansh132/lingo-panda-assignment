import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lingo_panda_assignment/provider/news_provider.dart';
import 'package:lingo_panda_assignment/theme/theme_ext.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<News> news = [];

  // Future<List<News>> getNews() async {
  //   // news = await NewsController.getNews();
  //   // print("hoem...");
  //   // print(news);
  //   return news;
  // }

  String timeAgo(String publishedAt) {
    DateTime publishedDate = DateTime.parse(publishedAt);

    DateTime now = DateTime.now();

    Duration difference = now.difference(publishedDate);

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else {
      return '${difference.inDays} day ago';
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<NewsProvider>(context, listen: false).getAllNews();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final appColors = context.appColors;
    return Scaffold(
      body: Container(
        color: appColors.lightGrey,
        child: SafeArea(
            child: Column(
          children: [
            Container(
              color: appColors.primary,
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "MyNews",
                    style: GoogleFonts.poppins(
                      color: appColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextButton.icon(
                    icon: const Icon(
                      Icons.location_pin,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                    label: Text(
                      "IN",
                      style: GoogleFonts.poppins(
                        color: appColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: appColors.lightGrey,
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              child: Text(
                "Top Headlines",
                style: GoogleFonts.poppins(
                  color: appColors.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ).copyWith(
                  color: appColors.richBlack,
                ),
              ),
            ),
            Consumer<NewsProvider>(
              builder: (context, value, child) {
                if (value.isLoading) {
                  return SizedBox(
                    height: height * 0.5,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                final news = value.news;
                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      final singleNews = news[index];
                      final time = timeAgo(singleNews.publishedAt ?? "");
                      return Container(
                        height: height * 0.175,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    singleNews.source?.name ?? 'Unknown Source',
                                    style: GoogleFonts.poppins(
                                      color: appColors.richBlack,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 12),
                                    child: Text(
                                      singleNews.description ?? "",
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.justify,
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        time,
                                        style: GoogleFonts.poppins(
                                          color: Colors.grey.withOpacity(0.8),
                                          fontSize: 12,
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: height * 0.17,
                              width: width * 0.3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    singleNews.urlToImage ??
                                        "https://via.placeholder.com/150",
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    itemCount: news.length,
                  ),
                );
              },
            ),
            // FutureBuilder(
            //   future: getNews(),
            //   builder: (context, snapshot) {
            //     if (snapshot.hasData) {
            //       return Expanded(
            //         child: ListView.builder(
            //           itemBuilder: (context, index) {
            //             final singleNews = news[index];
            //             final time = timeAgo(singleNews.publishedAt ?? "");
            //             return Container(
            //               height: height * 0.175,
            //               decoration: BoxDecoration(
            //                 color: Colors.white.withOpacity(0.5),
            //                 borderRadius: BorderRadius.circular(8),
            //                 boxShadow: [
            //                   BoxShadow(
            //                     color: Colors.grey.withOpacity(0.5),
            //                     blurRadius: 4,
            //                     offset: const Offset(0, 2),
            //                   ),
            //                 ],
            //               ),
            //               padding: const EdgeInsets.all(12),
            //               margin: const EdgeInsets.symmetric(
            //                   horizontal: 16, vertical: 8),
            //               child: Row(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: [
            //                   Expanded(
            //                     child: Column(
            //                       crossAxisAlignment: CrossAxisAlignment.start,
            //                       mainAxisAlignment: MainAxisAlignment.start,
            //                       children: [
            //                         Text(
            //                           singleNews.source?.name ??
            //                               'Unknown Source',
            //                           style: GoogleFonts.poppins(
            //                             color: appColors.richBlack,
            //                             fontSize: 16,
            //                             fontWeight: FontWeight.w600,
            //                           ),
            //                         ),
            //                         const SizedBox(
            //                           height: 8,
            //                         ),
            //                         Padding(
            //                           padding: const EdgeInsets.only(right: 12),
            //                           child: Text(
            //                             singleNews.description ?? "",
            //                             maxLines: 3,
            //                             overflow: TextOverflow.ellipsis,
            //                             textAlign: TextAlign.justify,
            //                             style: GoogleFonts.poppins(
            //                               color: Colors.black,
            //                               fontSize: 14,
            //                               fontWeight: FontWeight.w400,
            //                             ),
            //                           ),
            //                         ),
            //                         Expanded(
            //                           child: Container(
            //                             alignment: Alignment.bottomLeft,
            //                             child: Text(
            //                               time,
            //                               style: GoogleFonts.poppins(
            //                                 color: Colors.grey.withOpacity(0.8),
            //                                 fontSize: 12,
            //                                 fontStyle: FontStyle.italic,
            //                                 fontWeight: FontWeight.w400,
            //                               ),
            //                             ),
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                   Container(
            //                     height: 124,
            //                     width: 124,
            //                     decoration: BoxDecoration(
            //                       borderRadius: BorderRadius.circular(8),
            //                       image: DecorationImage(
            //                         fit: BoxFit.cover,
            //                         image: NetworkImage(
            //                           singleNews.urlToImage ??
            //                               "https://via.placeholder.com/150",
            //                         ),
            //                       ),
            //                     ),
            //                   )
            //                 ],
            //               ),
            //             );
            //           },
            //           itemCount: news.length,
            //         ),
            //       );
            //     } else {
            //       return const Center(
            //         child: Text("No data"),
            //       );
            //     }
            //   },
            // )
          ],
        )),
      ),
    );
  }
}
