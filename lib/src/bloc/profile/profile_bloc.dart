import 'package:rxdart/rxdart.dart';
import 'package:sehat/src/api_service/repository.dart';
import 'package:sehat/src/model/home/profile/profile_model.dart';
import 'package:sehat/src/model/http_result.dart';

class ProfileBloc{
  final Repository _repository = Repository();
  final _fetchProfileSubject = BehaviorSubject<ProfileModel>();
  Stream<ProfileModel> get getProfileStream => _fetchProfileSubject.stream;

  getProfile()async{
    HttpResult res = await _repository.profile();
    if(res.status >= 200 && res.status < 299){
      var data = ProfileModel.fromJson(res.result);
      _fetchProfileSubject.sink.add(data);
    }
    else{
      _fetchProfileSubject.sink.addError(res.result);
    }
  }
}
final profileBloc = ProfileBloc();