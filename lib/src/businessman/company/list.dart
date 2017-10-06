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
    templateUrl: 'list.html',
    directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES, formDirectives])
class CompanyListComponent extends Session implements OnInit {
  ModelService companies = new ModelService('companies');

  Router _router;

  num n = 1;
  String s = '';

  CompanyListComponent(this._router) : super(_router) {
    Menu.sel['name'] = 'CompanyList';
    Errors.errors = {};
    search(1);
  }

  void search(num nn) {
    n = nn;
    Map smap = {'_sort': '-createdAt', '_page': n.toString()};

    if (s != '') {
      smap['name__like'] = s;
    }

    listCompanies(smap);
  }
}
