import 'package:get/get.dart';

import '../controllers/add_update_mahasiswa_controller.dart';

class AddUpdateMahasiswaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddUpdateMahasiswaController>(
      () => AddUpdateMahasiswaController(),
    );
  }
}
