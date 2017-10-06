import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:bolsa_empleo/classes/Errors.dart';
import 'package:bolsa_empleo/classes/Menu.dart';
import 'package:bolsa_empleo/services/model.dart';

//import 'package:bolsa_empleo/src/businessman/company/company.dart';
import 'package:bolsa_empleo/src/session.dart';


@Component(
    selector: 'my-profile',
    templateUrl: 'new.html',
    directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES, formDirectives])
class CompanyEditComponent extends Session implements OnInit {
  ModelService companies = new ModelService('companies');

  final RouteParams _routeParams;
  Router _router;
  bool edit = true;

  Map company = {'economic_activity': '', 'sector': '', 'size': ''};

  CompanyEditComponent(this._router, this._routeParams) : super(_router) {
    Menu.sel['name'] = 'CompanyList';
    Errors.errors = {};
    listDepartaments({'_sort': 'name', '_limit': '500'});
    get();
  }

  void get() {
    new Future(() {
      companies.get(_routeParams.get('company_id'), {}).then((
          HttpRequest request) {
        Map xdata = JSON.decode(request.responseText);
        towns.query({
          'department_name': xdata['department'],
          '_sort': 'name',
          '_limit': '500'
        }).then((HttpRequest request) {
          Map data = JSON.decode(request.responseText);

          list_towns = data['result'];
          new Future(() {
          company = xdata;
          });
        }, onError: (ProgressEvent e) {
          ee.evaluateError(e);
          errors = Errors.errors;
        });
      }, onError: (ProgressEvent e) {
        ee.evaluateError(e);
        errors = Errors.errors;
      });
    });
  }

  void registerBtn() {
    companies.put(_routeParams.get('company_id'), company).then((
        HttpRequest request) {
      Map data = JSON.decode(request.responseText);
      _router.navigate(['CompanyList']);
    }, onError: (ProgressEvent e) {
      ee.evaluateError(e);
      errors = Errors.errors;
    });
  }

  void findTowns() {
    new Future(() {
      listTowns({
        'department_name': company['department'],
        '_sort': 'name',
        '_limit': '500'
      });
    });
  }
}
