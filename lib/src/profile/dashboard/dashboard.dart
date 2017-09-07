import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:bolsa_empleo/classes/Config.dart';
import 'package:bolsa_empleo/classes/Errors.dart';
import 'package:bolsa_empleo/classes/User.dart';
import 'package:bolsa_empleo/services/model.dart';
import 'package:bolsa_empleo/src/partials/footer/footer.dart';
import 'package:bolsa_empleo/src/session.dart';
//import 'package:bolsa_empleo/src/profile/recovery_password/recovery_password.dart';


@Component(
    selector: 'my-profile',
    templateUrl: 'dashboard.html',
    directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES])
class DashboardComponent extends Session implements OnInit {

  Map login = {
    'email': '',
    'password': '',
    'fcm_id': 'x',
    'device_id': '',
    'device_type': 'web'
  };

  //DashboardComponent(_router) : super(_router);
  Router _router;

  DashboardComponent(this._router) : super(_router);

  Future<Null> ngOnInit() async {}
}
