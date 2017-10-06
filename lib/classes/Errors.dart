import 'dart:convert';
import 'dart:html';

class Errors {
  static Map errors = {};
  String title = '';

  show(var e) {
    if(e['title'] != e['errorMessage']){
      errors[e['param'] != null ? e['param'] : 'errorAny'] = {
        'title': e['errorMessage'],
        'errorMessage': ''
      };
      return;
    }
    switch (e['title']) {
      case 'EmailOrPasswordNotValid':
        title = 'Correo o contraseña incorrecta';
        break;
      case 'notFound':
        title = 'Usuario no registrado';
        break;
      case '"EmailNotValid"':
        title = 'Correo incorrecto';
        break;
      case 'PasswordNotEmpty':
        title = 'La contraseña no debe estar vacia';
        break;
      default:
        title = e['title'];
    }
    errors[e['param'] != null ? e['param'] : 'errorAny'] = {
      'title': title,
      'errorMessage': ''
    };
  }

  evaluateError(ProgressEvent e) {
    errors = {};
    HttpRequest request = e.target;

    if (request.status == 0) {
      errors['errorAny'] = {
        'param': 'errorAny',
        'title': 'No hay conexión de Internet',
        'errorMessage': ''
      };
    } else if (request.status == 404) {
      errors['errorAny'] = {
        'param': 'errorAny',
        'title': 'Recurso no disponible',
        'errorMessage': ''
      };
    } else {
      var ee = JSON.decode(request.responseText);
      if (ee is List) {
        ee.forEach((e) => show(e));
      } else {
        show(ee);
      }
    }
  }
}
