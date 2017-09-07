import 'dart:convert';
import 'dart:html';
import 'dart:math';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:bolsa_empleo/classes/User.dart';
import 'package:bolsa_empleo/src/profile/dashboard/dashboard.dart';
import 'package:bolsa_empleo/src/profile/login/login.dart';
import 'package:bolsa_empleo/src/profile/recovery_password/recovery_password.dart';
import 'package:bolsa_empleo/src/profile/registration/registration.dart';
//
@Component(
    selector: 'main-app',
    templateUrl: 'app.html',
    directives: const [ROUTER_DIRECTIVES],
    providers: const [ROUTER_PROVIDERS])
@RouteConfig(const [
  const Route(
      path: '/login',
      name: 'Login',
      component: LoginComponent,
      useAsDefault: true),
  const Route(
      path: '/registration',
      name: 'Registration',
      component: RegistrationComponent),
  const Route(
      path: '/recovery-password',
      name: 'RecoveryPassword',
      component: RecoveryPasswordComponent),
  const Route(
      path: '/dashboard',
      name: 'Dashboard',
      component: DashboardComponent)
])
class AppComponent {
  Storage localStorage = window.localStorage;

  AppComponent() {
    //mira si hay una sesión para el usuario
    User.token = localStorage.containsKey('token') ? localStorage['token'] : '';
    if (localStorage.containsKey('user')) {
      User.user = JSON.decode(localStorage['user']);
    }

    if (!localStorage.containsKey('device_id')) {
      var rng = new Random();
      localStorage['device_id'] = 'web-' + rng.nextInt(10000).toString() + '-' +
          rng.nextInt(10000).toString();
    }
  }
}
