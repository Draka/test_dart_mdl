import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

@Component(
    selector: 'app-menuleft',
    templateUrl: 'menu_left.html',
    directives: const [ROUTER_DIRECTIVES],
    providers: const [ROUTER_PROVIDERS])
class MenuLeftProvider {
  MenuLeftProvider(){
  }
}
