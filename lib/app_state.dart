import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/lat_lng.dart';
import 'dart:convert';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _likedProducts = prefs
            .getStringList('ff_likedProducts')
            ?.map((path) => path.ref)
            .toList() ??
        _likedProducts;
  }

  late SharedPreferences prefs;

  List<String> brands = [];

  List<String> types = [];

  bool showFilter = false;

  String searchValue = '';

  int orderBy = 0;

  List<DocumentReference> _likedProducts = [];
  List<DocumentReference> get likedProducts => _likedProducts;
  set likedProducts(List<DocumentReference> _value) {
    _likedProducts = _value;
    prefs.setStringList('ff_likedProducts', _value.map((x) => x.path).toList());
  }

  void addToLikedProducts(DocumentReference _value) {
    _likedProducts.add(_value);
    prefs.setStringList(
        'ff_likedProducts', _likedProducts.map((x) => x.path).toList());
  }

  void removeFromLikedProducts(DocumentReference _value) {
    _likedProducts.remove(_value);
    prefs.setStringList(
        'ff_likedProducts', _likedProducts.map((x) => x.path).toList());
  }

  List<dynamic> Cart = [];

  int paymentOption = 0;

  double totalToPay = 0.0;
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
