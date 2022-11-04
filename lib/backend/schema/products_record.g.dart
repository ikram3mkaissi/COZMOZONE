// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProductsRecord> _$productsRecordSerializer =
    new _$ProductsRecordSerializer();

class _$ProductsRecordSerializer
    implements StructuredSerializer<ProductsRecord> {
  @override
  final Iterable<Type> types = const [ProductsRecord, _$ProductsRecord];
  @override
  final String wireName = 'ProductsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ProductsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.brand;
    if (value != null) {
      result
        ..add('brand')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.retailPrice;
    if (value != null) {
      result
        ..add('retail_price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.wholesalePrice;
    if (value != null) {
      result
        ..add('wholesale_price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.weight;
    if (value != null) {
      result
        ..add('weight')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dimension;
    if (value != null) {
      result
        ..add('dimension')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.size;
    if (value != null) {
      result
        ..add('size')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.details;
    if (value != null) {
      result
        ..add('details')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.typeProduct;
    if (value != null) {
      result
        ..add('type_product')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.sizeProduct;
    if (value != null) {
      result
        ..add('size_product')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.imageResized;
    if (value != null) {
      result
        ..add('imageResized')
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
  ProductsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProductsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'brand':
          result.brand = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'retail_price':
          result.retailPrice = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'wholesale_price':
          result.wholesalePrice = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'weight':
          result.weight = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'dimension':
          result.dimension = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'size':
          result.size = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'details':
          result.details = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'type_product':
          result.typeProduct.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'size_product':
          result.sizeProduct.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'imageResized':
          result.imageResized = serializers.deserialize(value,
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

class _$ProductsRecord extends ProductsRecord {
  @override
  final String? brand;
  @override
  final String? name;
  @override
  final double? retailPrice;
  @override
  final double? wholesalePrice;
  @override
  final String? weight;
  @override
  final String? dimension;
  @override
  final String? size;
  @override
  final String? description;
  @override
  final String? details;
  @override
  final String? image;
  @override
  final BuiltList<String>? typeProduct;
  @override
  final BuiltList<String>? sizeProduct;
  @override
  final DateTime? createdAt;
  @override
  final String? id;
  @override
  final String? imageResized;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ProductsRecord([void Function(ProductsRecordBuilder)? updates]) =>
      (new ProductsRecordBuilder()..update(updates))._build();

  _$ProductsRecord._(
      {this.brand,
      this.name,
      this.retailPrice,
      this.wholesalePrice,
      this.weight,
      this.dimension,
      this.size,
      this.description,
      this.details,
      this.image,
      this.typeProduct,
      this.sizeProduct,
      this.createdAt,
      this.id,
      this.imageResized,
      this.ffRef})
      : super._();

  @override
  ProductsRecord rebuild(void Function(ProductsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductsRecordBuilder toBuilder() =>
      new ProductsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductsRecord &&
        brand == other.brand &&
        name == other.name &&
        retailPrice == other.retailPrice &&
        wholesalePrice == other.wholesalePrice &&
        weight == other.weight &&
        dimension == other.dimension &&
        size == other.size &&
        description == other.description &&
        details == other.details &&
        image == other.image &&
        typeProduct == other.typeProduct &&
        sizeProduct == other.sizeProduct &&
        createdAt == other.createdAt &&
        id == other.id &&
        imageResized == other.imageResized &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    0,
                                                                    brand
                                                                        .hashCode),
                                                                name.hashCode),
                                                            retailPrice
                                                                .hashCode),
                                                        wholesalePrice
                                                            .hashCode),
                                                    weight.hashCode),
                                                dimension.hashCode),
                                            size.hashCode),
                                        description.hashCode),
                                    details.hashCode),
                                image.hashCode),
                            typeProduct.hashCode),
                        sizeProduct.hashCode),
                    createdAt.hashCode),
                id.hashCode),
            imageResized.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProductsRecord')
          ..add('brand', brand)
          ..add('name', name)
          ..add('retailPrice', retailPrice)
          ..add('wholesalePrice', wholesalePrice)
          ..add('weight', weight)
          ..add('dimension', dimension)
          ..add('size', size)
          ..add('description', description)
          ..add('details', details)
          ..add('image', image)
          ..add('typeProduct', typeProduct)
          ..add('sizeProduct', sizeProduct)
          ..add('createdAt', createdAt)
          ..add('id', id)
          ..add('imageResized', imageResized)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ProductsRecordBuilder
    implements Builder<ProductsRecord, ProductsRecordBuilder> {
  _$ProductsRecord? _$v;

  String? _brand;
  String? get brand => _$this._brand;
  set brand(String? brand) => _$this._brand = brand;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  double? _retailPrice;
  double? get retailPrice => _$this._retailPrice;
  set retailPrice(double? retailPrice) => _$this._retailPrice = retailPrice;

  double? _wholesalePrice;
  double? get wholesalePrice => _$this._wholesalePrice;
  set wholesalePrice(double? wholesalePrice) =>
      _$this._wholesalePrice = wholesalePrice;

  String? _weight;
  String? get weight => _$this._weight;
  set weight(String? weight) => _$this._weight = weight;

  String? _dimension;
  String? get dimension => _$this._dimension;
  set dimension(String? dimension) => _$this._dimension = dimension;

  String? _size;
  String? get size => _$this._size;
  set size(String? size) => _$this._size = size;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _details;
  String? get details => _$this._details;
  set details(String? details) => _$this._details = details;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  ListBuilder<String>? _typeProduct;
  ListBuilder<String> get typeProduct =>
      _$this._typeProduct ??= new ListBuilder<String>();
  set typeProduct(ListBuilder<String>? typeProduct) =>
      _$this._typeProduct = typeProduct;

  ListBuilder<String>? _sizeProduct;
  ListBuilder<String> get sizeProduct =>
      _$this._sizeProduct ??= new ListBuilder<String>();
  set sizeProduct(ListBuilder<String>? sizeProduct) =>
      _$this._sizeProduct = sizeProduct;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _imageResized;
  String? get imageResized => _$this._imageResized;
  set imageResized(String? imageResized) => _$this._imageResized = imageResized;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ProductsRecordBuilder() {
    ProductsRecord._initializeBuilder(this);
  }

  ProductsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _brand = $v.brand;
      _name = $v.name;
      _retailPrice = $v.retailPrice;
      _wholesalePrice = $v.wholesalePrice;
      _weight = $v.weight;
      _dimension = $v.dimension;
      _size = $v.size;
      _description = $v.description;
      _details = $v.details;
      _image = $v.image;
      _typeProduct = $v.typeProduct?.toBuilder();
      _sizeProduct = $v.sizeProduct?.toBuilder();
      _createdAt = $v.createdAt;
      _id = $v.id;
      _imageResized = $v.imageResized;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProductsRecord;
  }

  @override
  void update(void Function(ProductsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProductsRecord build() => _build();

  _$ProductsRecord _build() {
    _$ProductsRecord _$result;
    try {
      _$result = _$v ??
          new _$ProductsRecord._(
              brand: brand,
              name: name,
              retailPrice: retailPrice,
              wholesalePrice: wholesalePrice,
              weight: weight,
              dimension: dimension,
              size: size,
              description: description,
              details: details,
              image: image,
              typeProduct: _typeProduct?.build(),
              sizeProduct: _sizeProduct?.build(),
              createdAt: createdAt,
              id: id,
              imageResized: imageResized,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'typeProduct';
        _typeProduct?.build();
        _$failedField = 'sizeProduct';
        _sizeProduct?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ProductsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
