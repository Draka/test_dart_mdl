import 'dart:convert';
import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';

import 'package:bolsa_empleo/classes/Errors.dart';
import 'package:bolsa_empleo/classes/User.dart';
import 'package:bolsa_empleo/services/model.dart';
import 'package:bolsa_empleo/src/profile/profile.dart';


@Component(
    selector: 'my-profile',
    templateUrl: 'login.html',
    directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES, formDirectives])
class LoginComponent extends Profile implements OnInit {
  String title = 'Iniciar Sesión';

  ModelService users = new ModelService('users');
  ModelService xlogin = new ModelService('login');
  Storage localStorage = window.localStorage;

  Router _router;

  Map login = {
    'email': '',
    'password': '',
    'fcm_id': 'x',
    'device_id': '',
    'device_type': 'web'
  };

  LoginComponent(this._router) : super(_router){
    if(localStorage['token'] != ''){
      _router.navigate(['CompanyList']);
    }
  }

  void loginBtn() {
    login['device_id'] = localStorage['device_id'];

    xlogin.post(login).then((HttpRequest request) {
      Map data = JSON.decode(request.responseText);
      if (!data.containsKey('user')) {
        //error
      } else {
        User.token = data['token'];
        User.user = data['user'];

        localStorage['token'] = data['token'];
        localStorage['user'] = data['user'];
        User.sel['name'] = data['user']['personal_info']['firstname'];

        _router.navigate(['CompanyList']);
      }
    }, onError: (ProgressEvent e) {
      ee.evaluateError(e);
      errors = Errors.errors;
    });
  }
}
