import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

bool doShowProduct(
  ProductsRecord? product,
  List<String>? brands,
  List<String>? types,
  String? searchValue,
) {
  // Add your function code here!

  if ((product!.brand!.toLowerCase().contains(searchValue!.toLowerCase()) ||
          product!.name!.toLowerCase().contains(searchValue!.toLowerCase())
      /* ||
        product!.description!
              .toLowerCase()
              .contains(searchValue!.toLowerCase())*/
      ) &&
      (types!.length == 0 ||
          types!.contains('All') ||
          product!.typeProduct!.any((item) => types!.contains(item))) &&
      (brands!.length == 0 ||
          brands!.contains('All') ||
          brands!.contains(product!.brand))) {
    // Lists have at least one common element
    return true;
  }

  return false;
}

List<String> getBrands(List<ProductsRecord>? products) {
  List<String> l = [];

  for (var p in products!) {
    if (!l.contains(p.brand!.trim())) {
      l.add(p.brand!.trim());
    }
  }

  return l;
  // Add your function code here!
}

List<String> getCategories(List<ProductsRecord>? products) {
  List<String> l = [];

  for (var p in products!) {
    for (var cat in p.typeProduct!) {
      if (!l.contains(cat.trim()) && cat.trim() != '') {
        l.add(cat.trim());
      }
    }
  }

  return l;
  // Add your function code here!
}

dynamic productToJson(
  String productRef,
  int num,
  double price,
) {
  // Add your function code here!
  print(productRef);
  print('adding product');
  return {'productRef': productRef, 'num': num, 'price': price};
  print('finished adding product');
}

int productExistInCart(
  String productRef,
  List<dynamic> cart,
) {
  // Add your function code here!
  for (var item in cart) {
    if (item['productRef'] == productRef) return item['num'];
  }

  return 0;
}

List<dynamic> removeItemFromCart(
  List<dynamic> cart,
  String productRef,
) {
  // Add your function code here!

  cart.removeWhere((item) => item['productRef'] == productRef);

  return cart;
}

List<dynamic> updateItemInCart(
  List<dynamic> cart,
  String productRef,
  int num,
) {
  // Add your function code here!
  print('updating item');
  print('before');
  print(cart);

  cart[cart.indexWhere((item) => item['productRef'] == productRef)]['num'] =
      num;
  print('after');
  print(cart);
  return cart;
}

List<dynamic> incrementItemInCart(
  List<dynamic> cart,
  String productRef,
) {
  // Add your function code here!
  print('updating item');
  print('before');
  print(cart);

  cart[cart.indexWhere((item) => item['productRef'] == productRef)]['num']++;
  print('after');
  print(cart);
  return cart;
}

List<dynamic> decrementItemInCartCopy(
  List<dynamic> cart,
  String productRef,
) {
  // Add your function code here!
  print('updating item');
  print('before');
  print(cart);

  cart[cart.indexWhere((item) => item['productRef'] == productRef)]['num']--;
  print('after');
  print(cart);
  return cart;
}

String jsonToRef(dynamic json) {
  // Add your function code here!
  return json['productRef'];
}

double sumOrder(List<dynamic> productsJson) {
  // Add your function code here!
  double S = 0;
  for (var item in productsJson) {
    S += item['price'] * item['num'];
  }

  return double.parse(S.toStringAsFixed(2));
}

double pricePercentage(
  int value,
  double price,
) {
  // Add your function code here!

  return price * value / 100;
}

double sum(
  double value1,
  double value2,
) {
  // Add your function code here!
  return value1 + value2;
}

bool isProfessionalProduct(List<String> types) {
  // Add your function code here!
  return types.contains('Professional');
}

double uSDtoCent(double amount) {
  // Add your function code here!
  return amount * 100;
}
