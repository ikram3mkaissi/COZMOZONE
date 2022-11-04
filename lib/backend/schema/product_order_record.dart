import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'product_order_record.g.dart';

abstract class ProductOrderRecord
    implements Built<ProductOrderRecord, ProductOrderRecordBuilder> {
  static Serializer<ProductOrderRecord> get serializer =>
      _$productOrderRecordSerializer;

  int? get num;

  double? get price;

  String? get productId;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(ProductOrderRecordBuilder builder) => builder
    ..num = 0
    ..price = 0.0
    ..productId = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('productOrder')
          : FirebaseFirestore.instance.collectionGroup('productOrder');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('productOrder').doc();

  static Stream<ProductOrderRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ProductOrderRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ProductOrderRecord._();
  factory ProductOrderRecord(
          [void Function(ProductOrderRecordBuilder) updates]) =
      _$ProductOrderRecord;

  static ProductOrderRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createProductOrderRecordData({
  int? num,
  double? price,
  String? productId,
}) {
  final firestoreData = serializers.toFirestore(
    ProductOrderRecord.serializer,
    ProductOrderRecord(
      (p) => p
        ..num = num
        ..price = price
        ..productId = productId,
    ),
  );

  return firestoreData;
}
