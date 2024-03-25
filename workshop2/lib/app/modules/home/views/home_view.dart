import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workshop2/app/routes/app_pages.dart';
// import 'package:workshop_api/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key) {
    controller.getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6BAA3),
      appBar: AppBar(
        backgroundColor: const Color(0xffA94438),
        title: Text(
          'My Students',
          style: GoogleFonts.rubik(color: Colors.white),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Obx(
          () {
            return ListView.builder(
              itemCount: controller.dataMahasiswa.length,
              itemBuilder: (context, index) {
                var item = controller.dataMahasiswa[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffE4DEBE),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: ListTile(
                      leading: Text(
                        "${item.nama![0]}",
                        style: GoogleFonts.rubik(
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      title: Text(
                        "Name: ${item.nama}",
                        style: GoogleFonts.rubik(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Department: ${item.jurusan}',
                            style: GoogleFonts.rubik(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            'ID: ${item.nim}',
                            style: GoogleFonts.rubik(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        Get.defaultDialog(
                            backgroundColor: const Color(0xffE6BAA3),
                            title: "Detail Students",
                            titleStyle: GoogleFonts.rubik(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                            titlePadding: const EdgeInsets.only(top: 10),
                            contentPadding: const EdgeInsets.only(
                                bottom: 20, right: 10, left: 10),
                            content: Column(
                              children: [
                                const Divider(
                                  thickness: 1,
                                  color: Color(0xffA94438),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Name: ${item.nama}',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.rubik(
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  'ID: ${item.nim}',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.rubik(
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  'Department: ${item.jurusan}',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.rubik(
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  'Created at: ${item.createdAt}',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.rubik(
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  'Updated at: ${item.updatedAt}',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.rubik(
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            actions: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(175, 50),
                                    backgroundColor: const Color(0xffD24545)),
                                onPressed: () {
                                  Get.toNamed(Routes.ADD_UPDATE_MAHASISWA,
                                      arguments: item);
                                  // controller.forgotPass();
                                  // Get.back(); // Menutup dialog setelah selesai
                                },
                                child: Text(
                                  "Change Data",
                                  style: GoogleFonts.lato(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xffC1D8C3),
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(175, 50),
                                    backgroundColor: const Color(0xffD24545)),
                                onPressed: () {
                                  controller.delData(int.parse(item.id!));
                                  Get.back();
                                },
                                child: Text(
                                  "Delete Data",
                                  style: GoogleFonts.lato(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xffC1D8C3),
                                  ),
                                ),
                              ),
                            ]);
                      },
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.ADD_MAHASISWA);
        },
        backgroundColor: const Color(0xffD24545),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
