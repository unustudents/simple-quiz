import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(4.0.wp, 8.0.wp, 4.0.wp, 1.0.wp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Simple Quiz',
                    style: TextStyle(
                      color: AppColors.biruTua,
                      fontSize: 32.0.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.toNamed(Routes.PROFIL),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: SizedBox(
                        width: 10.0.wp,
                        child: Image.asset(
                          'assets/images/profile.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text.rich(
                TextSpan(
                    text: 'Hay, ',
                    children: [
                      TextSpan(
                          text: '${controller.user?.displayName} !',
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                    style: TextStyle(
                      color: AppColors.biruTua,
                      fontFamily: 'Poppins',
                      fontSize: 16.0.sp,
                    )),
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
                        offset: const Offset(2, 2),
                      ),
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
                    'Your Quiz',
                    style: TextStyle(
                      color: AppColors.biruTua,
                      fontSize: 20.0.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      '... lainnya',
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
                child: controller.quis.isEmpty
                    ? Center(
                        child: Text(
                          'Anda belum mengikuti kuis apapun',
                          style: TextStyle(
                              color: AppColors.biruTua,
                              fontSize: 14.0.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    : MasonryGridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        itemCount: controller.quis.length,
                        itemBuilder: (context, index) {
                          String title = controller.quis.elementAt(index);
                          return cardQuiz(title: title);
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
          // onTap: (i) => setState(() => _currentIndex = i),
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

  InkWell cardQuiz({required String title}) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.PRAQUIZ, arguments: title),
      radius: 20,
      child: Container(
        padding: EdgeInsets.all(3.0.wp),
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(20),
        ),
        // height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 17.0.wp),
            Text(
              title.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 19.0.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Rabu, 17 Nov 2023',
              style: TextStyle(fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }

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
