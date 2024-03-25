import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AddMahasiswaController extends GetxController {
  TextEditingController namaMahasiswa = TextEditingController();
  TextEditingController nimMahasiswa = TextEditingController();
  TextEditingController jurusanMahasiswa = TextEditingController();

  Future<void> postData() async {
    // print(namaMahasiswa);
    // int nim = int.parse(nimMahasiswa.text);
    try {
      final response = await http.post(
        Uri.parse('https://hashiro.id/mahasiswa'),
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

      print(response.statusCode);
      if (response.statusCode == 201) {
        // Data berhasil ditambahkan
        print('Data berhasil ditambahkan');
        // Anda bisa menambahkan logika lain jika diperlukan
      } else {
        throw Exception('Gagal menambahkan data');
      }
    } catch (error) {
      print('Error: $error');
      throw Exception('Gagal menambahkan data');
    }
  }
}
