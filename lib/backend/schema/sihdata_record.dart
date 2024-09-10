import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SihdataRecord extends FirestoreRecord {
  SihdataRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "usertype" field.
  String? _usertype;
  String get usertype => _usertype ?? '';
  bool hasUsertype() => _usertype != null;

  // "Aadhar_number" field.
  double? _aadharNumber;
  double get aadharNumber => _aadharNumber ?? 0.0;
  bool hasAadharNumber() => _aadharNumber != null;

  // "pass" field.
  String? _pass;
  String get pass => _pass ?? '';
  bool hasPass() => _pass != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  void _initializeFields() {
    _usertype = snapshotData['usertype'] as String?;
    _aadharNumber = castToType<double>(snapshotData['Aadhar_number']);
    _pass = snapshotData['pass'] as String?;
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sihdata');

  static Stream<SihdataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SihdataRecord.fromSnapshot(s));

  static Future<SihdataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SihdataRecord.fromSnapshot(s));

  static SihdataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SihdataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SihdataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SihdataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SihdataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SihdataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSihdataRecordData({
  String? usertype,
  double? aadharNumber,
  String? pass,
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'usertype': usertype,
      'Aadhar_number': aadharNumber,
      'pass': pass,
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class SihdataRecordDocumentEquality implements Equality<SihdataRecord> {
  const SihdataRecordDocumentEquality();

  @override
  bool equals(SihdataRecord? e1, SihdataRecord? e2) {
    return e1?.usertype == e2?.usertype &&
        e1?.aadharNumber == e2?.aadharNumber &&
        e1?.pass == e2?.pass &&
        e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber;
  }

  @override
  int hash(SihdataRecord? e) => const ListEquality().hash([
        e?.usertype,
        e?.aadharNumber,
        e?.pass,
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber
      ]);

  @override
  bool isValidKey(Object? o) => o is SihdataRecord;
}
