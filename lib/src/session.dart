import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:bolsa_empleo/classes/Errors.dart';
import 'package:bolsa_empleo/classes/Menu.dart';
import 'package:bolsa_empleo/classes/User.dart';
import 'package:bolsa_empleo/services/model.dart';


class Session implements OnInit {
  String title = 'Iniciar Sesión';
  Errors ee = new Errors();
  Map errors = Errors.errors;
  Router _router;

  ModelService users = new ModelService('users');

  Storage localStorage = window.localStorage;

  Session(this._router) {
    Menu.sel['name'] = 'xxx';
    updateUser();
  }

  Future<Null> ngOnInit() async {}

  updateUser() {
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

  //modelos de busqueda generales
  ModelService companies = new ModelService('companies');
  ModelService departments = new ModelService('departments');
  ModelService towns = new ModelService('towns');

  List<Map> list_companies = [];
  List<Map> list_departments = [];
  List<Map> list_towns = [];
  Map page_companies = {};
  List count_companies = [];

  Future listCompanies([Map queryParameters]) async {
    return companies.query(queryParameters).then((HttpRequest request) {
      Map data = JSON.decode(request.responseText);
      list_companies = data['result'];
      page_companies = data['pagination'];

      companies.get('count', queryParameters).then((HttpRequest request) {
        Map data = JSON.decode(request.responseText);
        count_companies = pagination(page_companies, data['result']);
      }, onError: (ProgressEvent e) {
        ee.evaluateError(e);
        errors = Errors.errors;
      });
    }, onError: (ProgressEvent e) {
      ee.evaluateError(e);
      errors = Errors.errors;
    });
  }

  Future listDepartaments([Map queryParameters]) async {
    return departments.query(queryParameters).then((HttpRequest request) {
      Map data = JSON.decode(request.responseText);
      list_departments = data['result'];
    }, onError: (ProgressEvent e) {
      ee.evaluateError(e);
      errors = Errors.errors;
    });
  }

  Future listTowns([Map queryParameters]) async {
    return towns.query(queryParameters).then((HttpRequest request) {
      Map data = JSON.decode(request.responseText);
      list_towns = data['result'];
    }, onError: (ProgressEvent e) {
      ee.evaluateError(e);
      errors = Errors.errors;
    });
  }

  //paginación
  List pagination(page, c) {
    List count = [];
    for (num i = 1; i <= (c / page['limit']).ceil(); i++) {
      count.add(i);
    }
    return count;
  }

}