import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:bolsa_empleo/classes/Errors.dart';
import 'package:bolsa_empleo/classes/User.dart';
import 'package:bolsa_empleo/services/model.dart';


class Session implements OnInit {
  String title = 'Iniciar Sesión';
  Errors ee = new Errors();
  Map errors = Errors.errors;
  Router _router;

  ModelService users = new ModelService('users');

  Storage localStorage = window.localStorage;

  Session(this._router){
    //Cierra el menu lateral
//    final HtmlElement element = querySelector(".mdl-layout");
//    final MaterialLayout menu1 = MaterialLayout.widget(element);
//    if (menu1.drawer.classes.contains('is-visible')) {
//      menu1.toggleDrawer();
//    }
    //actualiza la sesión
    updateUser();
  }

  Future<Null> ngOnInit() async {}

  updateUser(){
    users.get('me').then((request) {
      localStorage['user'] = request.responseText;
      User.user = JSON.decode(localStorage['user']);
    }, onError: (ProgressEvent e) {
      HttpRequest request = e.target;
      if (request.status == 401) {
        User.token = '';
        User.user = {};

        localStorage.remove('token');
        localStorage.remove('user');

        _router.navigate(['Login']);
      } else {
        ee.evaluateError(e);
        errors = Errors.errors;
      }
    });
  }

}