import 'package:flutter/material.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _dadosMorador = prefs.getStringList('ff_dadosMorador')?.map((x) {
          try {
            return jsonDecode(x);
          } catch (e) {
            print("Can't decode persisted json. Error: $e.");
            return {};
          }
        }).toList() ??
        _dadosMorador;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _cpf = '';
  String get cpf => _cpf;
  set cpf(String _value) {
    _cpf = _value;
  }

  String _senha = '';
  String get senha => _senha;
  set senha(String _value) {
    _senha = _value;
  }

  dynamic _apiLoginResultado;
  dynamic get apiLoginResultado => _apiLoginResultado;
  set apiLoginResultado(dynamic _value) {
    _apiLoginResultado = _value;
  }

  List<dynamic> _listaUsuario = [];
  List<dynamic> get listaUsuario => _listaUsuario;
  set listaUsuario(List<dynamic> _value) {
    _listaUsuario = _value;
  }

  void addToListaUsuario(dynamic _value) {
    _listaUsuario.add(_value);
  }

  void removeFromListaUsuario(dynamic _value) {
    _listaUsuario.remove(_value);
  }

  void removeAtIndexFromListaUsuario(int _index) {
    _listaUsuario.removeAt(_index);
  }

  List<dynamic> _dadosMorador = [];
  List<dynamic> get dadosMorador => _dadosMorador;
  set dadosMorador(List<dynamic> _value) {
    _dadosMorador = _value;
    prefs.setStringList(
        'ff_dadosMorador', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToDadosMorador(dynamic _value) {
    _dadosMorador.add(_value);
    prefs.setStringList(
        'ff_dadosMorador', _dadosMorador.map((x) => jsonEncode(x)).toList());
  }

  void removeFromDadosMorador(dynamic _value) {
    _dadosMorador.remove(_value);
    prefs.setStringList(
        'ff_dadosMorador', _dadosMorador.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromDadosMorador(int _index) {
    _dadosMorador.removeAt(_index);
    prefs.setStringList(
        'ff_dadosMorador', _dadosMorador.map((x) => jsonEncode(x)).toList());
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
