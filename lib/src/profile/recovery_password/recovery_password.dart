import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:bolsa_empleo/classes/Errors.dart';
import 'package:bolsa_empleo/services/model.dart';


@Component(
    selector: 'my-profile',
    templateUrl: 'recovery_password.html',
    directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES, formDirectives])
class RecoveryPasswordComponent implements OnInit {
  String title = 'Recuperar Contraseña';
  Errors ee = new Errors();
  Map errors = Errors.errors;

  final RouteParams _routeParams;

  ModelService users = new ModelService('users');

  Map login = {};

  RecoveryPasswordComponent(this._routeParams) {
    login['email']=_routeParams.get('email');
  }

  Future<Null> ngOnInit() async {}

  resetPassword() {
    users.get('reset-password', login).then((HttpRequest request){
      Map data = JSON.decode(request.responseText);
      errors = {};

    }, onError: (ProgressEvent e) {
      ee.evaluateError(e);
      errors = Errors.errors;
    });

  }
}
