import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:workshop2/app/data/data.dart';
// import 'package:workshop_api/app/data/data.dart';

class HomeController extends GetxController {
  var dataMahasiswa = <DataAPI>[].obs;
  late Timer _timer;

  @override
  void onInit() {
    super.onInit();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      getData();
    });
  }

  @override
  void onClose() {
    super.onClose();
    // Hentikan timer saat widget dihancurkan
    _timer.cancel();
  }

  Future<void> getData() async {
    try {
      final response =
          await http.get(Uri.parse('https://hashiro.id/mahasiswa'));
      print(response.statusCode);
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['data_mahasiswa'];
        print(data);
        // print(data);
        dataMahasiswa.assignAll(data.map((item) => DataAPI.fromJson(item)));
        if (dataMahasiswa.isEmpty) {
          dataMahasiswa.assignAll(data.map((item) => DataAPI.fromJson(item)));
        } else {
          // Data sebelumnya sudah ada, bandingkan dengan data yang baru
          final List<DataAPI> newdataMahasiswa =
              data.map((json) => DataAPI.fromJson(json)).toList();

          if (!listEquals(dataMahasiswa, newdataMahasiswa)) {
            // Ada pembaruan data
            dataMahasiswa.value = newdataMahasiswa;
          }
        }
      } else {
        throw Exception('Gagal mengambil data dari API');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<void> delData(int dataId) async {
    try {
      final response = await http.delete(
        Uri.parse('https://hashiro.id/mahasiswa/$dataId'),
        // headers: <String, String>{
        //   'Content-Type': 'application/json',
        // },
      );

      if (response.statusCode == 200) {
        // Data berhasil dihapus
        print('Data berhasil dihapus');
        // Lakukan penghapusan lokal jika diperlukan
        dataMahasiswa.removeWhere((data) => data.id == dataId);
      } else {
        throw Exception('Gagal menghapus data');
      }
    } catch (error) {
      print('Error: $error');
      throw Exception('Gagal menghapus data');
    }
  }
}
