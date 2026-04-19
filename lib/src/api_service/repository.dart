import 'package:sehat/src/api_service/api_provider.dart';

import '../model/http_result.dart';

class Repository{
  ApiProvider _apiProvider = ApiProvider();

  Future<HttpResult> login(data) async => await _apiProvider.login(data);
  Future<HttpResult> verifyLogin(data) async => await _apiProvider.verifyLogin(data);
  Future<HttpResult> register(data) async => await _apiProvider.register(data);
  Future<HttpResult> verifyRegister(data) async => await _apiProvider.verifyRegister(data);
  Future<HttpResult> resendOtp(data) async => await _apiProvider.resendOtp(data);
  Future<HttpResult> home() async => await _apiProvider.home();
  Future<HttpResult> profile() async => await _apiProvider.profile();
  Future<HttpResult> event() async => await _apiProvider.event();
  Future<HttpResult> eventDetails(id) async => await _apiProvider.eventDetails(id);
  Future<HttpResult> registerEvent(data) async => await _apiProvider.registerEvent(data);
  Future<HttpResult> story() async => await _apiProvider.story();
  Future<HttpResult> storyId(id) async => await _apiProvider.storyId(id);
  Future<HttpResult> blog() async => await _apiProvider.blog();
  Future<HttpResult> blogDetails(id) async => await _apiProvider.blogDetails(id);
  Future<HttpResult> news() async => await _apiProvider.news();
  Future<HttpResult> newsDetail(id) async => await _apiProvider.newsDetail(id);
  Future<HttpResult> referral() async => await _apiProvider.referral();
  Future<HttpResult> loyalty() async => await _apiProvider.loyalty();
  Future<HttpResult> services() async => await _apiProvider.services();
  Future<HttpResult> servicesId(id) async => await _apiProvider.servicesId(id);
  Future<HttpResult> doctorId(id) async => await _apiProvider.doctorId(id);
  Future<HttpResult> bookDoctor(data) async => await _apiProvider.bookDoctor(data);
  Future<HttpResult> bookDoctorEquipment(data) async => await _apiProvider.bookDoctorEquipment(data);
  Future<HttpResult> equipmentDetail(id) async => await _apiProvider.equipmentDetail(id);
  Future<HttpResult> bookUpcoming() async => await _apiProvider.bookUpcoming();
  Future<HttpResult> bookHistory() async => await _apiProvider.bookHistory();
  Future<HttpResult> bookDetails(id) async => await _apiProvider.bookDetails(id);
  Future<HttpResult> bookCancel(id) async => await _apiProvider.bookCancel(id);
  Future<HttpResult> bookRate(id,data) async => await _apiProvider.bookRate(id,data);
  Future<HttpResult> analyses() async => await _apiProvider.analyses();
  Future<HttpResult> analysesId(id) async => await _apiProvider.analysesId(id);
  Future<HttpResult> analysesHistory() async => await _apiProvider.analysesHistory();

}