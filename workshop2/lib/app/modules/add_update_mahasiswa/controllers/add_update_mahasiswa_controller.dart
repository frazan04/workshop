import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AddUpdateMahasiswaController extends GetxController {
  TextEditingController namaMahasiswa = TextEditingController();
  TextEditingController nimMahasiswa = TextEditingController();
  TextEditingController jurusanMahasiswa = TextEditingController();

  Future<void> putData(int dataId) async {
    try {
      final response = await http.put(
        Uri.parse('https://hashiro.id/mahasiswa/$dataId'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'nama': namaMahasiswa.text,
          'nim': nimMahasiswa.text,
          'jurusan': jurusanMahasiswa.text,
          // Tambahkan data lainnya sesuai kebutuhan
        }),
      );

      if (response.statusCode == 200) {
        // Data berhasil diubah
        print('Data berhasil diubah');
      } else {
        throw Exception('Gagal mengubah data');
      }
    } catch (error) {
      print('Error: $error');
      throw Exception('Gagal mengubah data');
    }
  }
}
