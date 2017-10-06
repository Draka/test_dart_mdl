import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:bolsa_empleo/classes/Menu.dart';
import 'package:bolsa_empleo/classes/User.dart';

@Component(
    selector: 'app-footer',
    templateUrl: 'footer.html',
    directives: const [ROUTER_DIRECTIVES],
    providers: const [ROUTER_PROVIDERS])
class FooterDirective {
  Router _router;
  User user;
  Map menu = Menu.sel;
  FooterDirective(this._router){
  }
}
