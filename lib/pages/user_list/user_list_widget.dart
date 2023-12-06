import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'user_list_model.dart';
export 'user_list_model.dart';

class UserListWidget extends StatefulWidget {
  const UserListWidget({
    Key? key,
    required this.projectRef,
  }) : super(key: key);

  final DocumentReference? projectRef;

  @override
  _UserListWidgetState createState() => _UserListWidgetState();
}

class _UserListWidgetState extends State<UserListWidget> {
  late UserListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserListModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500.0,
      constraints: BoxConstraints(
        maxWidth: 570.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(1.00, 0.00),
                  child: FlutterFlowIconButton(
                    borderColor: Color(0x00FFFFFF),
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).primaryBtnText,
                    icon: Icon(
                      Icons.cancel_outlined,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 40.0,
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.00, 0.00),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.00, 0.00),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 30.0),
                            child: Text(
                              'Add or Remove Project Members',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ),
                        StreamBuilder<List<UsersRecord>>(
                          stream: queryUsersRecord(),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<UsersRecord> listViewUsersRecordList = snapshot
                                .data!
                                .where((u) => u.uid != currentUserUid)
                                .toList();
                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewUsersRecordList.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 15.0),
                              itemBuilder: (context, listViewIndex) {
                                final listViewUsersRecord =
                                    listViewUsersRecordList[listViewIndex];
                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      listViewUsersRecord.displayName,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                    Builder(
                                      builder: (context) {
                                        if (listViewUsersRecord.projects
                                            .contains(widget.projectRef)) {
                                          return FlutterFlowIconButton(
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            borderRadius: 20.0,
                                            borderWidth: 1.0,
                                            buttonSize: 25.0,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            icon: FaIcon(
                                              FontAwesomeIcons.minus,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 9.0,
                                            ),
                                            onPressed: () async {
                                              await widget.projectRef!.update({
                                                ...mapToFirestore(
                                                  {
                                                    'project_team':
                                                        FieldValue.arrayRemove([
                                                      listViewUsersRecord
                                                          .reference
                                                    ]),
                                                  },
                                                ),
                                              });

                                              await listViewUsersRecord
                                                  .reference
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'projects':
                                                        FieldValue.arrayRemove([
                                                      widget.projectRef
                                                    ]),
                                                  },
                                                ),
                                              });
                                            },
                                          );
                                        } else {
                                          return FlutterFlowIconButton(
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            borderRadius: 20.0,
                                            borderWidth: 1.0,
                                            buttonSize: 25.0,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            icon: Icon(
                                              Icons.add,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 9.0,
                                            ),
                                            onPressed: () async {
                                              await widget.projectRef!.update({
                                                ...mapToFirestore(
                                                  {
                                                    'project_team':
                                                        FieldValue.arrayUnion([
                                                      listViewUsersRecord
                                                          .reference
                                                    ]),
                                                  },
                                                ),
                                              });

                                              await listViewUsersRecord
                                                  .reference
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'projects':
                                                        FieldValue.arrayUnion([
                                                      widget.projectRef
                                                    ]),
                                                  },
                                                ),
                                              });
                                            },
                                          );
                                        }
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ].divide(SizedBox(height: 4.0)).addToEnd(SizedBox(height: 12.0)),
        ),
      ),
    );
  }
}
