// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OrderRecord> _$orderRecordSerializer = new _$OrderRecordSerializer();

class _$OrderRecordSerializer implements StructuredSerializer<OrderRecord> {
  @override
  final Iterable<Type> types = const [OrderRecord, _$OrderRecord];
  @override
  final String wireName = 'OrderRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, OrderRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.professional;
    if (value != null) {
      result
        ..add('professional')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.total;
    if (value != null) {
      result
        ..add('total')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.tax;
    if (value != null) {
      result
        ..add('tax')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.state;
    if (value != null) {
      result
        ..add('state')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
    value = object.cutomserId;
    if (value != null) {
      result
        ..add('cutomserId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.shippingPrice;
    if (value != null) {
      result
        ..add('shippingPrice')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.subtotal;
    if (value != null) {
      result
        ..add('subtotal')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.customerRef;
    if (value != null) {
      result
        ..add('customerRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.orderRef;
    if (value != null) {
      result
        ..add('orderRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.paymentId;
    if (value != null) {
      result
        ..add('paymentId')
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
  OrderRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OrderRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'professional':
          result.professional = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'total':
          result.total = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'tax':
          result.tax = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'state':
          result.state = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'cutomserId':
          result.cutomserId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'shippingPrice':
          result.shippingPrice = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'subtotal':
          result.subtotal = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'customerRef':
          result.customerRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'orderRef':
          result.orderRef = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'paymentId':
          result.paymentId = serializers.deserialize(value,
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

class _$OrderRecord extends OrderRecord {
  @override
  final bool? professional;
  @override
  final double? total;
  @override
  final double? tax;
  @override
  final String? address;
  @override
  final String? state;
  @override
  final DateTime? createdAt;
  @override
  final String? id;
  @override
  final String? cutomserId;
  @override
  final double? shippingPrice;
  @override
  final double? subtotal;
  @override
  final DocumentReference<Object?>? customerRef;
  @override
  final String? orderRef;
  @override
  final String? paymentId;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$OrderRecord([void Function(OrderRecordBuilder)? updates]) =>
      (new OrderRecordBuilder()..update(updates))._build();

  _$OrderRecord._(
      {this.professional,
      this.total,
      this.tax,
      this.address,
      this.state,
      this.createdAt,
      this.id,
      this.cutomserId,
      this.shippingPrice,
      this.subtotal,
      this.customerRef,
      this.orderRef,
      this.paymentId,
      this.ffRef})
      : super._();

  @override
  OrderRecord rebuild(void Function(OrderRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrderRecordBuilder toBuilder() => new OrderRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrderRecord &&
        professional == other.professional &&
        total == other.total &&
        tax == other.tax &&
        address == other.address &&
        state == other.state &&
        createdAt == other.createdAt &&
        id == other.id &&
        cutomserId == other.cutomserId &&
        shippingPrice == other.shippingPrice &&
        subtotal == other.subtotal &&
        customerRef == other.customerRef &&
        orderRef == other.orderRef &&
        paymentId == other.paymentId &&
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
                                                            0,
                                                            professional
                                                                .hashCode),
                                                        total.hashCode),
                                                    tax.hashCode),
                                                address.hashCode),
                                            state.hashCode),
                                        createdAt.hashCode),
                                    id.hashCode),
                                cutomserId.hashCode),
                            shippingPrice.hashCode),
                        subtotal.hashCode),
                    customerRef.hashCode),
                orderRef.hashCode),
            paymentId.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OrderRecord')
          ..add('professional', professional)
          ..add('total', total)
          ..add('tax', tax)
          ..add('address', address)
          ..add('state', state)
          ..add('createdAt', createdAt)
          ..add('id', id)
          ..add('cutomserId', cutomserId)
          ..add('shippingPrice', shippingPrice)
          ..add('subtotal', subtotal)
          ..add('customerRef', customerRef)
          ..add('orderRef', orderRef)
          ..add('paymentId', paymentId)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class OrderRecordBuilder implements Builder<OrderRecord, OrderRecordBuilder> {
  _$OrderRecord? _$v;

  bool? _professional;
  bool? get professional => _$this._professional;
  set professional(bool? professional) => _$this._professional = professional;

  double? _total;
  double? get total => _$this._total;
  set total(double? total) => _$this._total = total;

  double? _tax;
  double? get tax => _$this._tax;
  set tax(double? tax) => _$this._tax = tax;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  String? _state;
  String? get state => _$this._state;
  set state(String? state) => _$this._state = state;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _cutomserId;
  String? get cutomserId => _$this._cutomserId;
  set cutomserId(String? cutomserId) => _$this._cutomserId = cutomserId;

  double? _shippingPrice;
  double? get shippingPrice => _$this._shippingPrice;
  set shippingPrice(double? shippingPrice) =>
      _$this._shippingPrice = shippingPrice;

  double? _subtotal;
  double? get subtotal => _$this._subtotal;
  set subtotal(double? subtotal) => _$this._subtotal = subtotal;

  DocumentReference<Object?>? _customerRef;
  DocumentReference<Object?>? get customerRef => _$this._customerRef;
  set customerRef(DocumentReference<Object?>? customerRef) =>
      _$this._customerRef = customerRef;

  String? _orderRef;
  String? get orderRef => _$this._orderRef;
  set orderRef(String? orderRef) => _$this._orderRef = orderRef;

  String? _paymentId;
  String? get paymentId => _$this._paymentId;
  set paymentId(String? paymentId) => _$this._paymentId = paymentId;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  OrderRecordBuilder() {
    OrderRecord._initializeBuilder(this);
  }

  OrderRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _professional = $v.professional;
      _total = $v.total;
      _tax = $v.tax;
      _address = $v.address;
      _state = $v.state;
      _createdAt = $v.createdAt;
      _id = $v.id;
      _cutomserId = $v.cutomserId;
      _shippingPrice = $v.shippingPrice;
      _subtotal = $v.subtotal;
      _customerRef = $v.customerRef;
      _orderRef = $v.orderRef;
      _paymentId = $v.paymentId;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrderRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OrderRecord;
  }

  @override
  void update(void Function(OrderRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OrderRecord build() => _build();

  _$OrderRecord _build() {
    final _$result = _$v ??
        new _$OrderRecord._(
            professional: professional,
            total: total,
            tax: tax,
            address: address,
            state: state,
            createdAt: createdAt,
            id: id,
            cutomserId: cutomserId,
            shippingPrice: shippingPrice,
            subtotal: subtotal,
            customerRef: customerRef,
            orderRef: orderRef,
            paymentId: paymentId,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
