// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class NameStruct extends FFFirebaseStruct {
  NameStruct({
    String? name,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  static NameStruct fromMap(Map<String, dynamic> data) => NameStruct(
        name: data['name'] as String?,
      );

  static NameStruct? maybeFromMap(dynamic data) =>
      data is Map ? NameStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
      }.withoutNulls;

  static NameStruct fromSerializableMap(Map<String, dynamic> data) =>
      NameStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'NameStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NameStruct && name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([name]);
}

NameStruct createNameStruct({
  String? name,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NameStruct(
      name: name,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

NameStruct? updateNameStruct(
  NameStruct? nameStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    nameStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addNameStructData(
  Map<String, dynamic> firestoreData,
  NameStruct? nameStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (nameStruct == null) {
    return;
  }
  if (nameStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && nameStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final nameStructData = getNameFirestoreData(nameStruct, forFieldValue);
  final nestedData = nameStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = nameStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getNameFirestoreData(
  NameStruct? nameStruct, [
  bool forFieldValue = false,
]) {
  if (nameStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(nameStruct.toMap());

  // Add any Firestore field values
  nameStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNameListFirestoreData(
  List<NameStruct>? nameStructs,
) =>
    nameStructs?.map((e) => getNameFirestoreData(e, true)).toList() ?? [];
