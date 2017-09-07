import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:bolsa_empleo/classes/Errors.dart';

class Profile implements OnInit {
  Errors ee = new Errors();
  Map errors = Errors.errors;
  Router _router;

  Profile(this._router){
    print('yyy');
  }

  Future<Null> ngOnInit() async {
    print('xxx');
  }

}