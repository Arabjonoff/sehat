import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:sehat/src/model/http_result.dart';

import '../../utils/cacheservice.dart';

class ApiProvider {
  Duration durationTimeout = const Duration(seconds: 320);
  final String baseUrl = "https://api.dev.maqsadacademy.uz";

  getReqHeader() {
    String token = CacheService.getToken();
    if (token == "") {
      return {
        "Content-Type": "application/json",
        // "platform": Platform.isIOS ? "ios" : "android",
      };
    } else {
      return {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
        // "X-Device": "device",
        // "platform": Platform.isIOS ? "ios" : "android",
        // "lan": CacheService.getLanguage()
      };
    }
  }

  Future<HttpResult> postRequest(url, body) async {
    if (kDebugMode) {
      print(url);
      print(body);
    }

    final dynamic headers = await getReqHeader();
    try {
      http.Response response = await http
          .post(Uri.parse(url), headers: headers, body: json.encode(body))
          .timeout(durationTimeout);
      return result(response);
    } on TimeoutException catch (_) {
      return HttpResult(isSuccess: false, status: -1, result: null);
    } on SocketException catch (_) {
      return HttpResult(isSuccess: false, status: -1, result: null);
    }
  }

  Future<HttpResult> putRequest(url, body) async {
    if (kDebugMode) {
      print(url);
      print(body);
    }

    final dynamic headers = await getReqHeader();
    try {
      http.Response response = await http
          .put(Uri.parse(url), headers: headers, body: jsonEncode(body))
          .timeout(durationTimeout);
      return result(response);
    } on TimeoutException catch (_) {
      return HttpResult(isSuccess: false, status: -1, result: null);
    } on SocketException catch (_) {
      return HttpResult(isSuccess: false, status: -1, result: null);
    }
  }

  Future<HttpResult> deleteRequest(url, body) async {
    if (kDebugMode) {
      print(url);
      print(body);
    }

    final dynamic headers = await getReqHeader();
    try {
      http.Response response = await http
          .delete(Uri.parse(url), headers: headers, body: jsonEncode(body))
          .timeout(durationTimeout);
      return result(response);
    } on TimeoutException catch (_) {
      return HttpResult(isSuccess: false, status: -1, result: null);
    } on SocketException catch (_) {
      return HttpResult(isSuccess: false, status: -1, result: null);
    }
  }

  Future<HttpResult> getRequest(url) async {
    final dynamic headers = await getReqHeader();
    if (kDebugMode) {
      print(url);
      print(headers);
    }

    try {
      http.Response response = await http
          .get(Uri.parse(url), headers: headers)
          .timeout(durationTimeout);
      return result(response);
    } on TimeoutException catch (_) {
      return HttpResult(isSuccess: false, status: -1, result: null);
    } on SocketException catch (_) {
      return HttpResult(isSuccess: false, status: -1, result: null);
    }
  }

  HttpResult result(http.Response response) {
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return HttpResult(
        isSuccess: true,
        status: response.statusCode,
        result: json.decode(utf8.decode(response.bodyBytes)),
      );
    } else {
      try {
        return HttpResult(
          isSuccess: false,
          status: response.statusCode,
          result: json.decode(utf8.decode(response.bodyBytes)),
        );
      } catch (_) {
        return HttpResult(
          isSuccess: false,
          status: response.statusCode,
          result: response.body,
        );
      }
    }
  }

  String normalizePhone(String phone) {
    phone = phone.replaceAll(RegExp(r'\s+'), '');

    if (phone.startsWith('+998')) {
      return phone;
    }

    if (phone.startsWith('998')) {
      return '+$phone';
    }

    throw Exception('Invalid phone format');
  }

  /// Auth 📌

  Future<HttpResult> login(data) async {
    String url = '$baseUrl/api/mobile/auth/login/';
    return await postRequest(url, data);
  }

  Future<HttpResult> verifyLogin(data) async {
    String url = '$baseUrl/api/mobile/auth/verify-login/';
    return await postRequest(url,data);
  }

  Future<HttpResult> register(data) async {
    String url = '$baseUrl/api/mobile/auth/register/';
    return await postRequest(url, data);
  }

  Future<HttpResult> verifyRegister(data) async {
    String url = '$baseUrl/api/mobile/auth/verify-register/';
    return await postRequest(url, data);
  }

  Future<HttpResult> resendOtp(data) async {
    String url = '$baseUrl/api/mobile/auth/resend-otp/';
    return await postRequest(url,data);
  }

  /// Home 📌

  Future<HttpResult> home() async {
    String url = '$baseUrl/api/mobile/home/';
    return await getRequest(url);
  }

  Future<HttpResult> profile() async {
    String url = '$baseUrl/api/mobile/profile/';
    return await getRequest(url);
  }

  Future<HttpResult> event() async {
    String url = '$baseUrl/api/mobile/events/';
    return await getRequest(url);
  }

  Future<HttpResult> eventDetails(id) async {
    String url = '$baseUrl/api/mobile/events/$id/';
    return await getRequest(url);
  }

  Future<HttpResult> registerEvent(data) async {
    String url = '$baseUrl/api/mobile/events/register/';
    return postRequest(url, data);
  }

  Future<HttpResult> story() async {
    String url = '$baseUrl/api/mobile/stories/';
    return await getRequest(url);
  }

  Future<HttpResult> storyId(id) async {
    String url = '$baseUrl/api/mobile/stories/$id/';
    return await getRequest(url);
  }

  Future<HttpResult> blog() async {
    String url = '$baseUrl/api/mobile/blogs/';
    return await getRequest(url);
  }

  Future<HttpResult> blogDetails(id) async {
    String url = '$baseUrl/api/mobile/blogs/$id/';
    return await getRequest(url);
  }

  Future<HttpResult> news() async {
    String url = '$baseUrl/api/mobile/news/';
    return await getRequest(url);
  }

  Future<HttpResult> newsDetail(id) async {
    String url = '$baseUrl/api/mobile/news/$id';
    return await getRequest(url);
  }

  Future<HttpResult> referral() async {
    String url = '$baseUrl/api/mobile/referral/';
    return await getRequest(url);
  }

  Future<HttpResult> loyalty() async {
    String url = '$baseUrl/api/mobile/loyalty/history/';
    return await getRequest(url);
  }

  /// services 📌

  Future<HttpResult> services() async {
    String url = '$baseUrl/api/mobile/services/';
    return await getRequest(url);
  }

  Future<HttpResult> servicesId(id) async {
    String url = '$baseUrl/api/mobile/services/$id/';
    return await getRequest(url);
  }

  Future<HttpResult> doctorId(id) async {
    String url = '$baseUrl/api/mobile/doctors/$id/';
    return await getRequest(url);
  }

  Future<HttpResult> bookDoctor(data) async {
    String url = '$baseUrl/api/mobile/bookings/';
    return await postRequest(url, data);
  }

  Future<HttpResult> bookDoctorEquipment(data) async {
    String url = '$baseUrl/api/mobile/bookings/';
    return await postRequest(url, data);
  }

  Future<HttpResult> equipmentDetail(id) async {
    String url = '$baseUrl/api/mobile/equipment/$id/';
    return await getRequest(url);
  }

  /// Booking 📌

  Future<HttpResult> bookUpcoming() async {
    String url = '$baseUrl/api/mobile/bookings/upcoming/';
    return await getRequest(url);
  }

  Future<HttpResult> bookHistory() async {
    String url = '$baseUrl/api/mobile/bookings/history/';
    return await getRequest(url);
  }

  Future<HttpResult> bookDetails(id) async {
    String url = '$baseUrl/api/mobile/bookings/$id/';
    return await getRequest(url);
  }

  Future<HttpResult> bookCancel(id) async {
    String url = '$baseUrl/api/mobile/bookings/$id/cancel';
    return await postRequest(url, {});
  }

  Future<HttpResult> bookRate(id,data) async {
    String url = '$baseUrl/api/mobile/bookings/$id/rate/';
    return await postRequest(url, data);
  }

  /// analyses 📌

  Future<HttpResult> analyses() async {
    String url = '$baseUrl/api/mobile/analyses/';
    return await getRequest(url);
  }

  Future<HttpResult> analysesId(id) async {
    String url = '$baseUrl/api/mobile/analyses/$id/';
    return await getRequest(url);
  }

  Future<HttpResult> analysesHistory() async {
    String url = '$baseUrl/api/mobile/analyses/history/';
    return await getRequest(url);
  }
}