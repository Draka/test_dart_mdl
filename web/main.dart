import 'package:angular/angular.dart';
import 'package:mdl/mdl.dart';

import 'package:bolsa_empleo/app.dart';

void main() {
  bootstrap(AppComponent);
  registerMdl();

  componentFactory().run().then((_) {
  });
}