// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_order_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProductOrderRecord> _$productOrderRecordSerializer =
    new _$ProductOrderRecordSerializer();

class _$ProductOrderRecordSerializer
    implements StructuredSerializer<ProductOrderRecord> {
  @override
  final Iterable<Type> types = const [ProductOrderRecord, _$ProductOrderRecord];
  @override
  final String wireName = 'ProductOrderRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ProductOrderRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.num;
    if (value != null) {
      result
        ..add('num')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.price;
    if (value != null) {
      result
        ..add('price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.productId;
    if (value != null) {
      result
        ..add('productId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  ProductOrderRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProductOrderRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'num':
          result.num = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'productId':
          result.productId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$ProductOrderRecord extends ProductOrderRecord {
  @override
  final int? num;
  @override
  final double? price;
  @override
  final String? productId;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ProductOrderRecord(
          [void Function(ProductOrderRecordBuilder)? updates]) =>
      (new ProductOrderRecordBuilder()..update(updates))._build();

  _$ProductOrderRecord._({this.num, this.price, this.productId, this.ffRef})
      : super._();

  @override
  ProductOrderRecord rebuild(
          void Function(ProductOrderRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductOrderRecordBuilder toBuilder() =>
      new ProductOrderRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductOrderRecord &&
        num == other.num &&
        price == other.price &&
        productId == other.productId &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, num.hashCode), price.hashCode), productId.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProductOrderRecord')
          ..add('num', num)
          ..add('price', price)
          ..add('productId', productId)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ProductOrderRecordBuilder
    implements Builder<ProductOrderRecord, ProductOrderRecordBuilder> {
  _$ProductOrderRecord? _$v;

  int? _num;
  int? get num => _$this._num;
  set num(int? num) => _$this._num = num;

  double? _price;
  double? get price => _$this._price;
  set price(double? price) => _$this._price = price;

  String? _productId;
  String? get productId => _$this._productId;
  set productId(String? productId) => _$this._productId = productId;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ProductOrderRecordBuilder() {
    ProductOrderRecord._initializeBuilder(this);
  }

  ProductOrderRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _num = $v.num;
      _price = $v.price;
      _productId = $v.productId;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductOrderRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProductOrderRecord;
  }

  @override
  void update(void Function(ProductOrderRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProductOrderRecord build() => _build();

  _$ProductOrderRecord _build() {
    final _$result = _$v ??
        new _$ProductOrderRecord._(
            num: num, price: price, productId: productId, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
