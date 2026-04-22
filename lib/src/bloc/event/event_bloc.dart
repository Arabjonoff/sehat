import 'package:rxdart/rxdart.dart';
import 'package:sehat/src/api_service/repository.dart';
import 'package:sehat/src/model/http_result.dart';
import 'package:sehat/src/model/universalContentModel.dart';

class EventBloc{
  final Repository _repository = Repository();
  final _fetchEventSubject = BehaviorSubject<UniversalContentModel>();
  Stream<UniversalContentModel> get getBlocStream => _fetchEventSubject.stream;

  getAllEvent()async{
    HttpResult result = await _repository.blog();
    if(result.status >= 200 && result.status < 300){
      var data = UniversalContentModel.fromJson(result.result);
      _fetchEventSubject.add(data);
    }
  }
}
final eventBloc = EventBloc();