import 'package:angular/angular.dart';

@Pipe('getErrors')
class GetErrorsPipe extends PipeTransform {
  List<Map> transform(List<Map> value, String param) {
    return value.where((item) => item['param'] == param).toList();
  }
}