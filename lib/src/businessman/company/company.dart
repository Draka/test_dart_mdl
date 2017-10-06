import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:bolsa_empleo/src/session.dart';

class Company extends Session implements OnInit {
  Router _router;

  Company(this._router) : super(_router);

  Future<Null> ngOnInit() async{}

}