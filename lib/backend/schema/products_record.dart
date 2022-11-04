import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'products_record.g.dart';

abstract class ProductsRecord
    implements Built<ProductsRecord, ProductsRecordBuilder> {
  static Serializer<ProductsRecord> get serializer =>
      _$productsRecordSerializer;

  String? get brand;

  String? get name;

  @BuiltValueField(wireName: 'retail_price')
  double? get retailPrice;

  @BuiltValueField(wireName: 'wholesale_price')
  double? get wholesalePrice;

  String? get weight;

  String? get dimension;

  String? get size;

  String? get description;

  String? get details;

  String? get image;

  @BuiltValueField(wireName: 'type_product')
  BuiltList<String>? get typeProduct;

  @BuiltValueField(wireName: 'size_product')
  BuiltList<String>? get sizeProduct;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  String? get id;

  String? get imageResized;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ProductsRecordBuilder builder) => builder
    ..brand = ''
    ..name = ''
    ..retailPrice = 0.0
    ..wholesalePrice = 0.0
    ..weight = ''
    ..dimension = ''
    ..size = ''
    ..description = ''
    ..details = ''
    ..image = ''
    ..typeProduct = ListBuilder()
    ..sizeProduct = ListBuilder()
    ..id = ''
    ..imageResized = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('products');

  static Stream<ProductsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ProductsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static ProductsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      ProductsRecord(
        (c) => c
          ..brand = snapshot.data['brand']
          ..name = snapshot.data['name']
          ..retailPrice = snapshot.data['retail_price']?.toDouble()
          ..wholesalePrice = snapshot.data['wholesale_price']?.toDouble()
          ..weight = snapshot.data['weight']
          ..dimension = snapshot.data['dimension']
          ..size = snapshot.data['size']
          ..description = snapshot.data['description']
          ..details = snapshot.data['details']
          ..image = snapshot.data['image']
          ..typeProduct =
              safeGet(() => ListBuilder(snapshot.data['type_product']))
          ..sizeProduct =
              safeGet(() => ListBuilder(snapshot.data['size_product']))
          ..createdAt = safeGet(() =>
              DateTime.fromMillisecondsSinceEpoch(snapshot.data['created_at']))
          ..id = snapshot.data['id']
          ..imageResized = snapshot.data['imageResized']
          ..ffRef = ProductsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<ProductsRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'products',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  ProductsRecord._();
  factory ProductsRecord([void Function(ProductsRecordBuilder) updates]) =
      _$ProductsRecord;

  static ProductsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createProductsRecordData({
  String? brand,
  String? name,
  double? retailPrice,
  double? wholesalePrice,
  String? weight,
  String? dimension,
  String? size,
  String? description,
  String? details,
  String? image,
  DateTime? createdAt,
  String? id,
  String? imageResized,
}) {
  final firestoreData = serializers.toFirestore(
    ProductsRecord.serializer,
    ProductsRecord(
      (p) => p
        ..brand = brand
        ..name = name
        ..retailPrice = retailPrice
        ..wholesalePrice = wholesalePrice
        ..weight = weight
        ..dimension = dimension
        ..size = size
        ..description = description
        ..details = details
        ..image = image
        ..typeProduct = null
        ..sizeProduct = null
        ..createdAt = createdAt
        ..id = id
        ..imageResized = imageResized,
    ),
  );

  return firestoreData;
}
