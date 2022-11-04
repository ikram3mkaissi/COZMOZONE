// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
Future<String> createOrder(
  DocumentReference customerId,
  bool professional,
  List<dynamic> cart,
  double total,
  double tax,
  String address,
  String state,
  double shippingPrice,
  double subtotal,
  String paymentId,
) async {
  print('order creation');
  // Add your function code here!
  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('MMdd');
  final String formatted = formatter.format(now);
  print('date is ');
  print(formatted);
  final int num = await FirebaseFirestore.instance
          .collection('order')
          .get()
          .then((value) => value.size) *
      1000;
  print('length');
  print(num);
  final String ref =
      "PO" + formatted + num.toString().split('').reversed.join();
  print('order ref is ');
  print(ref);
  String id = '';

  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('order');
  await _collectionRef.add({
    'created_at': DateTime.now(),
  }).then((value) async {
    id = value.id;
    print('added order colelciton');

    for (var item in cart) {
      print('item');

      await FirebaseFirestore.instance
          .collection("order")
          .doc(value.id)
          .collection("productOrder")
          .add({
        'productId': item['productRef'],
        'num': item['num'],
        'price': item['price'],
      }).catchError((e) => print(e));
    }
    await FirebaseFirestore.instance.collection("order").doc(value.id).set({
      'id': value.id,
      'created_at': DateTime.now(),
      'customerRef': customerId,
      'professional': professional,
      'total': total,
      'tax': tax,
      'orderRef': ref,
      'paymentId': paymentId,
      'address': address,
      'state': state,
      'shippingPrice': shippingPrice,
      'subtotal': subtotal
    });
  }).catchError((e) => print(e));
  print('order Id is');
  print(id);
  return id;
}
