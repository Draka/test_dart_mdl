import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:bolsa_empleo/src/session.dart';


@Component(
    selector: 'my-profile',
    templateUrl: 'dashboard.html',
    directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES])
class DashboardComponent extends Session implements OnInit {

  Router _router;

  DashboardComponent(this._router) : super(_router);

  Future<Null> ngOnInit() async {}
}
