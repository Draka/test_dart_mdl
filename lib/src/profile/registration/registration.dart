import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'dart:math';
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:bolsa_empleo/classes/Errors.dart';
import 'package:bolsa_empleo/services/model.dart';
import 'package:bolsa_empleo/src/profile/profile.dart';


@Component(
    selector: 'my-profile',
    templateUrl: 'registration.html',
    directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES, formDirectives])
class RegistrationComponent extends Profile implements OnInit {
  String title = 'Iniciar Sesión';

  ModelService users = new ModelService('users');
  Storage localStorage = window.localStorage;

  Router _router;

  Map register = {
    'email': '',
    'password': '',
    'fcm_id': 'x',
    'device_id': '',
    'device_type': 'web',
    'personal_info': {}
  };

  RegistrationComponent(this._router) : super(_router);

  void registerBtn() {
    if(!localStorage.containsKey('device_id')){
      var rng = new Random();
      localStorage['device_id'] = 'web-' + rng.nextInt(10000).toString() + '-' + rng.nextInt(10000).toString();
    }

    register['device_id'] = localStorage['device_id'];

    users.post(register).then((HttpRequest request) {
      Map data = JSON.decode(request.responseText);
      print(data);
//      if (!data.containsKey('user')) {
//        //error
//      } else {
//        User.token = data['token'];
//        User.user = data['user'];
//
//        localStorage['token'] = data['token'];
//        localStorage['user'] = JSON.encode(data['user']);
//
//        _router.navigate(['Dashboard']);
//      }
    }, onError: (ProgressEvent e) {
      ee.evaluateError(e);
      errors = Errors.errors;
    });
  }
}
