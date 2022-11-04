import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'states_record.g.dart';

abstract class StatesRecord
    implements Built<StatesRecord, StatesRecordBuilder> {
  static Serializer<StatesRecord> get serializer => _$statesRecordSerializer;

  String? get name;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(StatesRecordBuilder builder) =>
      builder..name = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('states');

  static Stream<StatesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<StatesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  StatesRecord._();
  factory StatesRecord([void Function(StatesRecordBuilder) updates]) =
      _$StatesRecord;

  static StatesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createStatesRecordData({
  String? name,
}) {
  final firestoreData = serializers.toFirestore(
    StatesRecord.serializer,
    StatesRecord(
      (s) => s..name = name,
    ),
  );

  return firestoreData;
}
