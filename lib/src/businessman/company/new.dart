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
class CompanyNewComponent extends Session implements OnInit {
  ModelService companies = new ModelService('companies');

  Router _router;
  bool edit = false;

  Map company = {'economic_activity': '', 'sector':'', 'size':''};

  CompanyNewComponent(this._router) : super(_router) {
    Menu.sel['name'] = 'CompanyList';
    Errors.errors = {};

    listDepartaments({'_sort': 'name', '_limit': '500'});
  }

  void registerBtn() {
    companies.post(company).then((HttpRequest request) {
      Map data = JSON.decode(request.responseText);
      _router.navigate(['CompanyList']);
    }, onError: (ProgressEvent e) {
      ee.evaluateError(e);
      errors = Errors.errors;
    });
  }

  void findTowns() {
    new Future(() {
      listTowns({'departament_name': company['department'], '_sort': 'name', '_limit': '500'});
    });
  }
}
