import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'order_record.g.dart';

abstract class OrderRecord implements Built<OrderRecord, OrderRecordBuilder> {
  static Serializer<OrderRecord> get serializer => _$orderRecordSerializer;

  bool? get professional;

  double? get total;

  double? get tax;

  String? get address;

  String? get state;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  String? get id;

  String? get cutomserId;

  double? get shippingPrice;

  double? get subtotal;

  DocumentReference? get customerRef;

  String? get orderRef;

  String? get paymentId;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(OrderRecordBuilder builder) => builder
    ..professional = false
    ..total = 0.0
    ..tax = 0.0
    ..address = ''
    ..state = ''
    ..id = ''
    ..cutomserId = ''
    ..shippingPrice = 0.0
    ..subtotal = 0.0
    ..orderRef = ''
    ..paymentId = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('order');

  static Stream<OrderRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<OrderRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  OrderRecord._();
  factory OrderRecord([void Function(OrderRecordBuilder) updates]) =
      _$OrderRecord;

  static OrderRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createOrderRecordData({
  bool? professional,
  double? total,
  double? tax,
  String? address,
  String? state,
  DateTime? createdAt,
  String? id,
  String? cutomserId,
  double? shippingPrice,
  double? subtotal,
  DocumentReference? customerRef,
  String? orderRef,
  String? paymentId,
}) {
  final firestoreData = serializers.toFirestore(
    OrderRecord.serializer,
    OrderRecord(
      (o) => o
        ..professional = professional
        ..total = total
        ..tax = tax
        ..address = address
        ..state = state
        ..createdAt = createdAt
        ..id = id
        ..cutomserId = cutomserId
        ..shippingPrice = shippingPrice
        ..subtotal = subtotal
        ..customerRef = customerRef
        ..orderRef = orderRef
        ..paymentId = paymentId,
    ),
  );

  return firestoreData;
}
