import 'dart:convert';
import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:bolsa_empleo/classes/Menu.dart';
import 'package:bolsa_empleo/classes/User.dart';

@Component(
    selector: 'app-menu',
    templateUrl: 'menu.html',
    directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES])
class MenuDirective {
  Router _router;

  Map user = User.sel;
  Map menu = Menu.sel;

  Storage localStorage = window.localStorage;

  MenuDirective(this._router) {
  }

  void logoutBtn() {
    User.token = '';
    User.user = {};
    User.sel = {'name': ''};

    localStorage['token'] = '';
    localStorage['user'] = JSON.encode(User.user);

    _router.navigate(['Login']);
  }
}
