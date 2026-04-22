import 'package:rxdart/rxdart.dart';
import 'package:sehat/src/api_service/repository.dart';
import 'package:sehat/src/model/blog/blog_model.dart';
import 'package:sehat/src/model/http_result.dart';
import 'package:sehat/src/model/universalContentModel.dart';

class BlogBloc{
  final Repository _repository = Repository();
  final _fetchBlogSubject = BehaviorSubject<List<BlogResult>>();
  Stream<List<BlogResult>> get getBlocStream => _fetchBlogSubject.stream;

  getAllBlog()async{
    HttpResult result = await _repository.blog();
    if(result.status >= 200 && result.status < 300){
      var data = BlogModel.fromJson(result.result);
      _fetchBlogSubject.add(data.results);
    }
  }
}
final blogBloc = BlogBloc();