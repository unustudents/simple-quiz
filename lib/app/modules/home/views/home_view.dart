import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../data/widgets/card.dart';
import '../../../data/widgets/snack.dart';
import '../../../data/constant/teks.dart';
import '../../../data/widgets/salomon_bottom_bar.dart';
import '../../../routes/app_pages.dart';
import '../../../data/constant/colors.dart';
import '../../../data/core/extentions.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(4.0.wp, 8.0.wp, 4.0.wp, 1.0.wp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(AppTexts.logo,
                      fit: BoxFit.cover, width: Get.width / 3),
                  InkWell(
                    onTap: () => Get.toNamed(Routes.PROFIL),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: SizedBox(
                        width: 10.0.wp,
                        child: Image.asset(AppTexts.iconProfil,
                            fit: BoxFit.cover, color: Colors.blueGrey),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 35),
              Text.rich(
                TextSpan(
                  text: 'Hay, ',
                  children: [
                    TextSpan(
                        text: '${controller.user?.displayName} !',
                        style: const TextStyle(fontWeight: FontWeight.bold))
                  ],
                  style: TextStyle(
                      color: AppColors.biruTua,
                      fontFamily: 'Poppins',
                      fontSize: 16.0.sp),
                ),
              ),
              const SizedBox(height: 18),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 4,
                          offset: const Offset(2, 2)),
                    ]),
                padding: EdgeInsets.symmetric(vertical: 4.0.wp),
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      panelSertif(title: 'Sertifikat', score: '20'),
                      const VerticalDivider(thickness: 2),
                      panelSertif(title: 'Kuis', score: 15),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Profil PMII',
                    style: TextStyle(
                      color: AppColors.biruTua,
                      fontSize: 20.0.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => SnackbarCustom.warningToast(
                        msg: 'Menu khusus ADMIN, ini akan segera tersedia'),
                    child: Text(
                      'Edit',
                      style: TextStyle(
                          color: AppColors.biruTua,
                          fontSize: 16.0.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                physics: const PageScrollPhysics(),
                child: Row(
                  children: [
                    SizedBox(
                      width: Get.width - 8.0.wp,
                      child: Card(
                        surfaceTintColor: Colors.transparent,
                        elevation: 3,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  opacity: 0.2,
                                  fit: BoxFit.cover,
                                  image: AssetImage(AppTexts.background),
                                  scale: 0.2)),
                          child: ListTile(
                            shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            style: ListTileStyle.drawer,
                            onTap: () => Get.toNamed(Routes.ORGANISATION),
                            title: Text(
                              'Tentang PMII',
                              style: TextStyle(
                                  color: AppColors.biruTua,
                                  fontWeight: FontWeight.w600),
                            ),
                            subtitle: const Text(
                                'Apa yang kamu ketahui tentang PMII, ayo cek !'),
                            leading: Image.asset(AppTexts.logoPMII),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: Get.width - 8.0.wp,
                      child: Card(
                        surfaceTintColor: Colors.transparent,
                        elevation: 3,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  opacity: 0.2,
                                  fit: BoxFit.cover,
                                  image: AssetImage(AppTexts.background),
                                  scale: 0.2)),
                          child: ListTile(
                            shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            style: ListTileStyle.drawer,
                            onTap: () => Get.toNamed(Routes.ORGANISATION),
                            title: Text(
                              'Tentang PMII',
                              style: TextStyle(
                                  color: AppColors.biruTua,
                                  fontWeight: FontWeight.w600),
                            ),
                            subtitle: const Text(
                                'Apa yang kamu ketahui tentang PMII, ayo cek !'),
                            leading: Image.asset(AppTexts.logoPMII),
                            // minLeadingWidth: 70,
                            // trailing: const Icon(Icons.arrow_forward_ios_rounded),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Expanded(
              //   child: ListView.separated(
              //     itemBuilder: (BuildContext context, int index) {
              //       return Card(
              //         surfaceTintColor: Colors.transparent,
              //         color: Colors.blue.shade100,
              //         elevation: 5,
              //         child: ListTile(
              //           shape: ContinuousRectangleBorder(
              //               borderRadius: BorderRadius.circular(30)),
              //           style: ListTileStyle.drawer,
              //           onTap: () {},
              //           title: Text(
              //             'Title',
              //             style: TextStyle(
              //                 color: AppColors.biruTua,
              //                 fontWeight: FontWeight.w600),
              //           ),
              //           subtitle: const Text('Ini adalah sebuah title'),
              //           leading: Image.asset(AppTexts.splash),
              //           minLeadingWidth: 70,
              //         ),
              //       );
              //     },
              //     separatorBuilder: (BuildContext context, int index) =>
              //         const SizedBox(
              //       height: 10,
              //     ),
              //     itemCount: 1,
              //   ),
              // ),
              const SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Quiz Category',
                    style: TextStyle(
                      color: AppColors.biruTua,
                      fontSize: 20.0.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => SnackbarCustom.warningToast(
                        msg: 'Menu khusus ADMIN, ini akan segera tersedia'),
                    child: Text(
                      'Edit',
                      style: TextStyle(
                          color: AppColors.biruTua,
                          fontSize: 16.0.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: FutureBuilder(
                  future: controller.categoryQuiz(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return const Center(child: Text('No Internet'));
                      case ConnectionState.waiting:
                        return ListView.separated(
                          physics: const PageScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return Shimmer.fromColors(
                              baseColor: Colors.grey.shade200,
                              highlightColor: Colors.cyan.shade300,
                              child: const Card(child: SizedBox(height: 80)),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(height: 10),
                          itemCount: 3,
                        );
                      default:
                        if (snapshot.hasData) {
                          return ListView.separated(
                            itemBuilder: (context, index) {
                              var sample = snapshot.data!.docs.elementAt(index);

                              return CardCustom.cardQuiz(
                                  onTap: () => Get.toNamed(Routes.ALLQUIZ,
                                          arguments: {
                                            'uid': sample.id,
                                            'title': sample.data()['title']
                                          }),
                                  index: index,
                                  title: sample.data()['title'],
                                  subtitle: sample.data()['subtitle']);
                            },
                            itemCount: snapshot.data!.docs.length,
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const SizedBox(height: 10),
                          );
                        } else {
                          return Center(
                            child: Text(
                              'Category not created ! 😩',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14.0.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          );
                        }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => SalomonBottomBar(
          currentIndex: controller.currentIndex.value,
          onTap: (i) => controller.currentIndex.value = i,
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: const Icon(Icons.home_filled),
              title: const Text("Home"),
              selectedColor: Colors.purple,
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: const Icon(Icons.favorite_border),
              title: const Text("Likes"),
              selectedColor: Colors.pink,
            ),

            /// Search
            SalomonBottomBarItem(
              icon: const Icon(Icons.search),
              title: const Text("Search"),
              selectedColor: Colors.orange,
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: const Icon(Icons.person_outline_rounded),
              title: const Text("Profile"),
              selectedColor: Colors.teal,
            ),
          ],
        ),
      ),
    );
  }

  // InkWell cardQuiz({required String title}) {
  //   return InkWell(
  //     onTap: () => Get.toNamed(Routes.PRAQUIZ, arguments: title),
  //     radius: 20,
  //     child: Container(
  //       padding: EdgeInsets.all(3.0.wp),
  //       decoration: BoxDecoration(
  //         color: Colors.amber,
  //         borderRadius: BorderRadius.circular(20),
  //       ),
  //       // height: 200,
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           SizedBox(height: 17.0.wp),
  //           Text(
  //             title.toString(),
  //             style: TextStyle(
  //               color: Colors.white,
  //               fontSize: 19.0.sp,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //           const SizedBox(height: 10),
  //           const Text(
  //             'Rabu, 17 Nov 2023',
  //             style: TextStyle(fontWeight: FontWeight.w500),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Expanded panelSertif({required String title, required dynamic score}) {
    return Expanded(
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppColors.biruTua,
              fontSize: 16.0.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            score.toString(),
            style: TextStyle(
              color: AppColors.biruTua,
              fontFamily: 'Mogra',
              fontSize: 22.0.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
