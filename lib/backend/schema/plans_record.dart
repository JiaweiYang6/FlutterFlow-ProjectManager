import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlansRecord extends FirestoreRecord {
  PlansRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "detail" field.
  String? _detail;
  String get detail => _detail ?? '';
  bool hasDetail() => _detail != null;

  // "due_date" field.
  DateTime? _dueDate;
  DateTime? get dueDate => _dueDate;
  bool hasDueDate() => _dueDate != null;

  // "project_ref" field.
  DocumentReference? _projectRef;
  DocumentReference? get projectRef => _projectRef;
  bool hasProjectRef() => _projectRef != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _detail = snapshotData['detail'] as String?;
    _dueDate = snapshotData['due_date'] as DateTime?;
    _projectRef = snapshotData['project_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('plans');

  static Stream<PlansRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PlansRecord.fromSnapshot(s));

  static Future<PlansRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PlansRecord.fromSnapshot(s));

  static PlansRecord fromSnapshot(DocumentSnapshot snapshot) => PlansRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PlansRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PlansRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PlansRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PlansRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPlansRecordData({
  String? title,
  String? detail,
  DateTime? dueDate,
  DocumentReference? projectRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'detail': detail,
      'due_date': dueDate,
      'project_ref': projectRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class PlansRecordDocumentEquality implements Equality<PlansRecord> {
  const PlansRecordDocumentEquality();

  @override
  bool equals(PlansRecord? e1, PlansRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.detail == e2?.detail &&
        e1?.dueDate == e2?.dueDate &&
        e1?.projectRef == e2?.projectRef;
  }

  @override
  int hash(PlansRecord? e) => const ListEquality()
      .hash([e?.title, e?.detail, e?.dueDate, e?.projectRef]);

  @override
  bool isValidKey(Object? o) => o is PlansRecord;
}
