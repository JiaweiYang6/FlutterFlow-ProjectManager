import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TasksRecord extends FirestoreRecord {
  TasksRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "task_title" field.
  String? _taskTitle;
  String get taskTitle => _taskTitle ?? '';
  bool hasTaskTitle() => _taskTitle != null;

  // "task_detail" field.
  String? _taskDetail;
  String get taskDetail => _taskDetail ?? '';
  bool hasTaskDetail() => _taskDetail != null;

  // "completed_flag" field.
  bool? _completedFlag;
  bool get completedFlag => _completedFlag ?? false;
  bool hasCompletedFlag() => _completedFlag != null;

  // "due_date" field.
  DateTime? _dueDate;
  DateTime? get dueDate => _dueDate;
  bool hasDueDate() => _dueDate != null;

  // "project_ref" field.
  DocumentReference? _projectRef;
  DocumentReference? get projectRef => _projectRef;
  bool hasProjectRef() => _projectRef != null;

  // "plan_ref" field.
  DocumentReference? _planRef;
  DocumentReference? get planRef => _planRef;
  bool hasPlanRef() => _planRef != null;

  // "task_assignee" field.
  DocumentReference? _taskAssignee;
  DocumentReference? get taskAssignee => _taskAssignee;
  bool hasTaskAssignee() => _taskAssignee != null;

  // "completed_date" field.
  DateTime? _completedDate;
  DateTime? get completedDate => _completedDate;
  bool hasCompletedDate() => _completedDate != null;

  void _initializeFields() {
    _taskTitle = snapshotData['task_title'] as String?;
    _taskDetail = snapshotData['task_detail'] as String?;
    _completedFlag = snapshotData['completed_flag'] as bool?;
    _dueDate = snapshotData['due_date'] as DateTime?;
    _projectRef = snapshotData['project_ref'] as DocumentReference?;
    _planRef = snapshotData['plan_ref'] as DocumentReference?;
    _taskAssignee = snapshotData['task_assignee'] as DocumentReference?;
    _completedDate = snapshotData['completed_date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tasks');

  static Stream<TasksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TasksRecord.fromSnapshot(s));

  static Future<TasksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TasksRecord.fromSnapshot(s));

  static TasksRecord fromSnapshot(DocumentSnapshot snapshot) => TasksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TasksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TasksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TasksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TasksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTasksRecordData({
  String? taskTitle,
  String? taskDetail,
  bool? completedFlag,
  DateTime? dueDate,
  DocumentReference? projectRef,
  DocumentReference? planRef,
  DocumentReference? taskAssignee,
  DateTime? completedDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'task_title': taskTitle,
      'task_detail': taskDetail,
      'completed_flag': completedFlag,
      'due_date': dueDate,
      'project_ref': projectRef,
      'plan_ref': planRef,
      'task_assignee': taskAssignee,
      'completed_date': completedDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class TasksRecordDocumentEquality implements Equality<TasksRecord> {
  const TasksRecordDocumentEquality();

  @override
  bool equals(TasksRecord? e1, TasksRecord? e2) {
    return e1?.taskTitle == e2?.taskTitle &&
        e1?.taskDetail == e2?.taskDetail &&
        e1?.completedFlag == e2?.completedFlag &&
        e1?.dueDate == e2?.dueDate &&
        e1?.projectRef == e2?.projectRef &&
        e1?.planRef == e2?.planRef &&
        e1?.taskAssignee == e2?.taskAssignee &&
        e1?.completedDate == e2?.completedDate;
  }

  @override
  int hash(TasksRecord? e) => const ListEquality().hash([
        e?.taskTitle,
        e?.taskDetail,
        e?.completedFlag,
        e?.dueDate,
        e?.projectRef,
        e?.planRef,
        e?.taskAssignee,
        e?.completedDate
      ]);

  @override
  bool isValidKey(Object? o) => o is TasksRecord;
}
