import 'dart:html';
import 'dart:math';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:bolsa_empleo/src/profile/dashboard/dashboard.dart';
import 'package:bolsa_empleo/src/profile/login/login.dart';
import 'package:bolsa_empleo/src/profile/recovery_password/recovery_password.dart';

@Component(
    selector: 'app-footer',
    templateUrl: 'footer.html',
    directives: const [ROUTER_DIRECTIVES],
    providers: const [ROUTER_PROVIDERS])
class FooterProvider {
  FooterProvider();
}
