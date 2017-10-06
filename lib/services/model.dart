import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'package:angular/angular.dart';
import 'package:bolsa_empleo/classes/Config.dart';
import 'package:bolsa_empleo/classes/User.dart';

@Injectable()
class ModelService {
  Config config = new Config();
  String model;
  bool loader = true;

  ModelService(String this.model) {}

  Future get(String id, [Map queryParameters = null, String extend = '']) {
    loader = true;
    Uri uri = new Uri(scheme: config.scheme,
        host: config.client_host,
        port: config.client_port,
        path: "v1/${config.server}/${model}${extend}/${id}",
        queryParameters: queryParameters);
    var a = HttpRequest.request(uri.toString(), method: "GET", requestHeaders: {"content-type": "application/json", "Authorization": "bearer " + User.token});
    a.then((request) {
      loader = false;
    });
    return a;
  }

  Future query([Map queryParameters = null]) {
    loader = true;
    Uri uri = new Uri(scheme: config.scheme,
        host: config.client_host,
        port: config.client_port,
        path: "v1/${config.server}/${model}",
        queryParameters: queryParameters);
    var a = HttpRequest.request(uri.toString(), method: "GET", requestHeaders: {"content-type": "application/json", "Authorization": "bearer " + User.token});
    a.then((request) {
      loader = false;
    });
    return a;
  }

  Future post(Map form, [Map queryParameters = null]) {
    loader = true;
    Uri uri = new Uri(scheme: config.scheme,
        host: config.client_host,
        port: config.client_port,
        path: "v1/${config.server}/${model}",
        queryParameters: queryParameters);
    var a = HttpRequest.request(uri.toString(), method: "POST", requestHeaders: {"content-type": "application/json", "Authorization": "bearer " + User.token}, sendData: JSON.encode(form));
    a.then((request) {
      loader = false;
    });
    return a;
  }

  Future postGet(String id, Map form, [Map queryParameters = null]) {
    loader = true;
    Uri uri = new Uri(scheme: config.scheme,
        host: config.client_host,
        port: config.client_port,
        path: "v1/${config.server}/${model}/${id}",
        queryParameters: queryParameters);
    var a = HttpRequest.request(uri.toString(), method: "POST", requestHeaders: {"content-type": "application/json", "Authorization": "bearer " + User.token}, sendData: JSON.encode(form));
    a.then((request) {
      loader = false;
    });
    return a;
  }

  Future put(String id, Map form, [Map queryParameters = null]) {
    loader = true;
    Uri uri = new Uri(scheme: config.scheme,
        host: config.client_host,
        port: config.client_port,
        path: "v1/${config.server}/${model}/${id}",
        queryParameters: queryParameters);
    var a = HttpRequest.request(uri.toString(), method: "PUT", requestHeaders: {"content-type": "application/json", "Authorization": "bearer " + User.token}, sendData: JSON.encode(form));
    a.then((request) {
      loader = false;
    });
    return a;
  }

  Future deactivate(String id) {
    loader = true;
    Uri uri = new Uri(scheme: config.scheme, host: config.client_host, port: config.client_port, path: "v1/${config.server}/${model}/${id}");
    var a = HttpRequest.request(uri.toString(), method: "DELETE", requestHeaders: {"content-type": "application/json", "Authorization": "bearer " + User.token});
    a.then((request) {
      loader = false;
    });
    return a;
  }

  Future activate(String id) {
    loader = true;
    Uri uri = new Uri(scheme: config.scheme, host: config.client_host, port: config.client_port, path: "v1/${config.server}/activate/${model}/${id}");
    var a = HttpRequest.request(uri.toString(), method: "PUT", requestHeaders: {"content-type": "application/json", "Authorization": "bearer " + User.token});
    a.then((request) {
      loader = false;
    });
    return a;
  }

  Future getSub([Map queryParameters = null, String extend = '']) {
    loader = true;
    Uri uri = new Uri(scheme: config.scheme,
        host: config.client_host,
        port: config.client_port,
        path: 'v1/${config.server}/${model}${extend}/',
        queryParameters: queryParameters);
    var a = HttpRequest.request(uri.toString(), method: "GET", requestHeaders: {"content-type": "application/json", "Authorization": "bearer " + User.token});
    a.then((request) {
      loader = false;
    });
    return a;
  }

  Future excel([Map queryParameters = null, List<String> form = null]) {
    loader = true;
    Uri uri = new Uri(scheme: config.scheme,
        host: config.client_host,
        port: config.client_port,
        path: "v1/${config.server}/trips/generate",
        queryParameters: queryParameters);
    var a = HttpRequest.request(uri.toString(), method: "POST", requestHeaders: {"content-type": "application/json", "Authorization": "bearer " + User.token}, sendData: JSON.encode(form));
    a.then((request) {
      loader = false;
    });
    return a;
  }

}
