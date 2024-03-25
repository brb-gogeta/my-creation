import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_members/empty_members_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'modal_add_members_model.dart';
export 'modal_add_members_model.dart';

class ModalAddMembersWidget extends StatefulWidget {
  const ModalAddMembersWidget({
    Key? key,
    this.projectRef,
  }) : super(key: key);

  final ProjectsRecord? projectRef;

  @override
  _ModalAddMembersWidgetState createState() => _ModalAddMembersWidgetState();
}

class _ModalAddMembersWidgetState extends State<ModalAddMembersWidget> {
  late ModalAddMembersModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModalAddMembersModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return ClipRRect(
      borderRadius: BorderRadius.circular(0),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 5,
          sigmaY: 6,
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).overlay,
          ),
          alignment: AlignmentDirectional(0, 0),
          child: Container(
            width: double.infinity,
            height: 800,
            constraints: BoxConstraints(
              maxWidth: 930,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: Color(0x33000000),
                  offset: Offset(0, 2),
                )
              ],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30,
                          buttonSize: 44,
                          icon: Icon(
                            Icons.arrow_back_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24,
                          ),
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 0, 24, 0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'qgce8yzt' /* Add Members to project */,
                          ),
                          style: FlutterFlowTheme.of(context).headlineMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'ncylrws1' /* Members in Project */,
                            ),
                            style: FlutterFlowTheme.of(context).bodySmall,
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 170,
                          decoration: BoxDecoration(),
                          child: Builder(
                            builder: (context) {
                              final members =
                                  widget.projectRef?.usersAssigned?.toList() ??
                                      [];
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: members.length,
                                itemBuilder: (context, membersIndex) {
                                  final membersItem = members[membersIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 12, 4, 12),
                                    child: StreamBuilder<UsersRecord>(
                                      stream:
                                          UsersRecord.getDocument(membersItem),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        final containerUsersRecord =
                                            snapshot.data!;
                                        return Container(
                                          width: 160,
                                          height: 110,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 4,
                                                color: Color(0x34090F13),
                                                offset: Offset(0, 2),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .lineColor,
                                              width: 2,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4, 4, 4, 4),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  child: CachedNetworkImage(
                                                    fadeInDuration: Duration(
                                                        milliseconds: 500),
                                                    fadeOutDuration: Duration(
                                                        milliseconds: 500),
                                                    imageUrl:
                                                        valueOrDefault<String>(
                                                      containerUsersRecord
                                                          .photoUrl,
                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/clone-kanban-app-jnvhvf/assets/xc10k3tgih2u/app_projects@1x.png',
                                                    ),
                                                    width: 60,
                                                    height: 60,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 8, 0, 0),
                                                  child: Text(
                                                    containerUsersRecord
                                                        .displayName,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                ),
                                                FFButtonWidget(
                                                  onPressed: () async {
                                                    await widget
                                                        .projectRef!.reference
                                                        .update({
                                                      'usersAssigned':
                                                          FieldValue
                                                              .arrayRemove([
                                                        containerUsersRecord
                                                            .reference
                                                      ]),
                                                    });
                                                    // We are creating an activity type here. The "otherUser" should always be the authenticated user whom is sending the notification, taking action.
                                                    // createActivity

                                                    var activityRecordReference =
                                                        ActivityRecord
                                                            .collection
                                                            .doc();
                                                    await activityRecordReference
                                                        .set({
                                                      ...createActivityRecordData(
                                                        activityName:
                                                            'Member Removed from Project',
                                                        activityTime:
                                                            getCurrentTimestamp,
                                                        activityType: widget
                                                            .projectRef
                                                            ?.projectName,
                                                        projectRef: widget
                                                            .projectRef
                                                            ?.reference,
                                                        otherUser:
                                                            currentUserReference,
                                                        activitySubText:
                                                            'A member has been removed from ',
                                                      ),
                                                      'targetUserRef': [
                                                        containerUsersRecord
                                                            .reference
                                                      ],
                                                      'unreadByUser': [
                                                        containerUsersRecord
                                                            .reference
                                                      ],
                                                    });
                                                    _model.activityCreated =
                                                        ActivityRecord
                                                            .getDocumentFromData({
                                                      ...createActivityRecordData(
                                                        activityName:
                                                            'Member Removed from Project',
                                                        activityTime:
                                                            getCurrentTimestamp,
                                                        activityType: widget
                                                            .projectRef
                                                            ?.projectName,
                                                        projectRef: widget
                                                            .projectRef
                                                            ?.reference,
                                                        otherUser:
                                                            currentUserReference,
                                                        activitySubText:
                                                            'A member has been removed from ',
                                                      ),
                                                      'targetUserRef': [
                                                        containerUsersRecord
                                                            .reference
                                                      ],
                                                      'unreadByUser': [
                                                        containerUsersRecord
                                                            .reference
                                                      ],
                                                    }, activityRecordReference);
                                                    Navigator.pop(context);
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'You have removed a member from the project.',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBtnText,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                      ),
                                                    );

                                                    setState(() {});
                                                  },
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'ddkg34qk' /* Remove */,
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: 130,
                                                    height: 32,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    textStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmall,
                                                    elevation: 0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'rxgjnrtl' /* Add Members */,
                            ),
                            style: FlutterFlowTheme.of(context).bodySmall,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 44),
                          child: FutureBuilder<List<UsersRecord>>(
                            future: (_model.firestoreRequestCompleter ??=
                                    Completer<List<UsersRecord>>()
                                      ..complete(queryUsersRecordOnce()))
                                .future,
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<UsersRecord> listViewUsersRecordList =
                                  snapshot.data!;
                              if (listViewUsersRecordList.isEmpty) {
                                return Center(
                                  child: Container(
                                    height: 300,
                                    child: EmptyMembersWidget(
                                      title: 'No Search Results',
                                      bodyText:
                                          'Find users by searching above.',
                                    ),
                                  ),
                                );
                              }
                              return RefreshIndicator(
                                onRefresh: () async {
                                  setState(() =>
                                      _model.firestoreRequestCompleter = null);
                                  await _model
                                      .waitForFirestoreRequestCompleted();
                                },
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewUsersRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewUsersRecord =
                                        listViewUsersRecordList[listViewIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 4, 16, 8),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'teamMemberDetails',
                                            queryParameters: {
                                              'userRef': serializeParam(
                                                listViewUsersRecord,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'userRef': listViewUsersRecord,
                                            },
                                          );
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 4,
                                                color: Color(0x32000000),
                                                offset: Offset(0, 2),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 0, 8, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(26),
                                                  child: CachedNetworkImage(
                                                    fadeInDuration: Duration(
                                                        milliseconds: 500),
                                                    fadeOutDuration: Duration(
                                                        milliseconds: 500),
                                                    imageUrl:
                                                        valueOrDefault<String>(
                                                      listViewUsersRecord
                                                          .photoUrl,
                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/clone-kanban-app-jnvhvf/assets/xc10k3tgih2u/app_projects@1x.png',
                                                    ),
                                                    width: 36,
                                                    height: 36,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                12, 0, 0, 0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          listViewUsersRecord
                                                              .displayName,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleSmall,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      4, 0, 0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                listViewUsersRecord
                                                                    .email,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                FFButtonWidget(
                                                  onPressed: () async {
                                                    await widget
                                                        .projectRef!.reference
                                                        .update({
                                                      'usersAssigned':
                                                          FieldValue
                                                              .arrayUnion([
                                                        listViewUsersRecord
                                                            .reference
                                                      ]),
                                                    });
                                                    // We are creating an activity type here. The "otherUser" should always be the authenticated user whom is sending the notification, taking action.
                                                    // createActivity

                                                    var activityRecordReference =
                                                        ActivityRecord
                                                            .collection
                                                            .doc();
                                                    await activityRecordReference
                                                        .set({
                                                      ...createActivityRecordData(
                                                        activityName:
                                                            'New Member in Project',
                                                        activityTime:
                                                            getCurrentTimestamp,
                                                        activityType: widget
                                                            .projectRef
                                                            ?.projectName,
                                                        projectRef: widget
                                                            .projectRef
                                                            ?.reference,
                                                        otherUser:
                                                            currentUserReference,
                                                        activitySubText:
                                                            '${listViewUsersRecord.displayName} has been added to ',
                                                      ),
                                                      'targetUserRef': [
                                                        listViewUsersRecord
                                                            .reference
                                                      ],
                                                      'unreadByUser': widget
                                                          .projectRef
                                                          ?.usersAssigned,
                                                    });
                                                    _model.newActivity =
                                                        ActivityRecord
                                                            .getDocumentFromData({
                                                      ...createActivityRecordData(
                                                        activityName:
                                                            'New Member in Project',
                                                        activityTime:
                                                            getCurrentTimestamp,
                                                        activityType: widget
                                                            .projectRef
                                                            ?.projectName,
                                                        projectRef: widget
                                                            .projectRef
                                                            ?.reference,
                                                        otherUser:
                                                            currentUserReference,
                                                        activitySubText:
                                                            '${listViewUsersRecord.displayName} has been added to ',
                                                      ),
                                                      'targetUserRef': [
                                                        listViewUsersRecord
                                                            .reference
                                                      ],
                                                      'unreadByUser': widget
                                                          .projectRef
                                                          ?.usersAssigned,
                                                    }, activityRecordReference);
                                                    Navigator.pop(context);
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'You have added a member to the project!',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBtnText,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                      ),
                                                    );

                                                    setState(() {});
                                                  },
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'c69xi1a4' /* Assign */,
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: 80,
                                                    height: 36,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: Colors.white,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily),
                                                        ),
                                                    elevation: 2,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
