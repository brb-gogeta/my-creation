import '/backend/backend.dart';
import '/components/drawer_nav/drawer_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

import 'main_projects_model.dart';
export 'main_projects_model.dart';

class MainProjectsWidget extends StatefulWidget {
  const MainProjectsWidget({Key? key}) : super(key: key);

  @override
  _MainProjectsWidgetState createState() => _MainProjectsWidgetState();
}

class _MainProjectsWidgetState extends State<MainProjectsWidget>
    with TickerProviderStateMixin {
  late MainProjectsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(30, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(30, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainProjectsModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            context.pushNamed(
              'createProject',
              extra: <String, dynamic>{
                kTransitionInfoKey: TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.bottomToTop,
                  duration: Duration(milliseconds: 250),
                ),
              },
            );
          },
          backgroundColor: FlutterFlowTheme.of(context).primary,
          elevation: 8,
          child: Icon(
            Icons.create_new_folder,
            color: Colors.white,
            size: 32,
          ),
        ),
        drawer: Drawer(
          elevation: 16,
          child: wrapWithModel(
            model: _model.drawerNavModel,
            updateCallback: () => setState(() {}),
            child: DrawerNavWidget(),
          ),
        ),
        body: SafeArea(
          top: true,
          child: Wrap(
            spacing: 0,
            runSpacing: 0,
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            runAlignment: WrapAlignment.start,
            verticalDirection: VerticalDirection.down,
            clipBehavior: Clip.none,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (responsiveVisibility(
                    context: context,
                    tabletLandscape: false,
                    desktop: false,
                  ))
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                      child: StreamBuilder<List<ProjectsRecord>>(
                        stream: queryProjectsRecord(
                          queryBuilder: (projectsRecord) => projectsRecord
                              .orderBy('lastEdited', descending: true),
                        ),
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
                          List<ProjectsRecord> listViewProjectsRecordList =
                              snapshot.data!;
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewProjectsRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewProjectsRecord =
                                  listViewProjectsRecordList[listViewIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 8, 12, 8),
                                child: Container(
                                  width: 230,
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
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'projectDetailsPage',
                                        queryParameters: {
                                          'projectRef': serializeParam(
                                            listViewProjectsRecord,
                                            ParamType.Document,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'projectRef': listViewProjectsRecord,
                                        },
                                      );
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0),
                                              bottomRight: Radius.circular(0),
                                              topLeft: Radius.circular(12),
                                              topRight: Radius.circular(12),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 12, 12, 12),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  listViewProjectsRecord
                                                      .projectName,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmallFamily,
                                                        color: Colors.white,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmallFamily),
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 12, 0, 0),
                                                  child: Text(
                                                    '${listViewProjectsRecord.numberTasks.toString()} tasks',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 12, 12, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Builder(
                                                builder: (context) {
                                                  final members =
                                                      listViewProjectsRecord
                                                          .usersAssigned
                                                          .toList();
                                                  return Container(
                                                    width: 150,
                                                    child: Stack(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1, 0),
                                                      children: List.generate(
                                                          members.length,
                                                          (membersIndex) {
                                                        final membersItem =
                                                            members[
                                                                membersIndex];
                                                        return StreamBuilder<
                                                            UsersRecord>(
                                                          stream: UsersRecord
                                                              .getDocument(
                                                                  membersItem),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50,
                                                                  height: 50,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            final containerUsersRecord =
                                                                snapshot.data!;
                                                            return Container(
                                                              width: 40,
                                                              height: 40,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFFEEEEEE),
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0, 0),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0, 0),
                                                                child:
                                                                    Container(
                                                                  width: 36,
                                                                  height: 36,
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Image
                                                                      .network(
                                                                    containerUsersRecord
                                                                        .photoUrl,
                                                                    fit: BoxFit
                                                                        .fitWidth,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      }),
                                                    ),
                                                  );
                                                },
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 8, 0),
                                                child: Text(
                                                  dateTimeFormat(
                                                    'relative',
                                                    listViewProjectsRecord
                                                        .lastEdited!,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 12, 12, 16),
                                          child: LinearPercentIndicator(
                                            percent: valueOrDefault<double>(
                                              functions.progressBarValue(
                                                  valueOrDefault<int>(
                                                    listViewProjectsRecord
                                                        .numberTasks,
                                                    0,
                                                  ),
                                                  valueOrDefault<int>(
                                                    listViewProjectsRecord
                                                        .completedTasks,
                                                    0,
                                                  )),
                                              0.0,
                                            ),
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.88,
                                            lineHeight: 16,
                                            animation: true,
                                            progressColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .lineColor,
                                            barRadius: Radius.circular(12),
                                            padding: EdgeInsets.zero,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation1']!),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                  ))
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                      child: StreamBuilder<List<ProjectsRecord>>(
                        stream: queryProjectsRecord(
                          queryBuilder: (projectsRecord) => projectsRecord
                              .orderBy('lastEdited', descending: true),
                        ),
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
                          List<ProjectsRecord> gridViewProjectsRecordList =
                              snapshot.data!;
                          return GridView.builder(
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 2.7,
                            ),
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: gridViewProjectsRecordList.length,
                            itemBuilder: (context, gridViewIndex) {
                              final gridViewProjectsRecord =
                                  gridViewProjectsRecordList[gridViewIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 8, 12, 8),
                                child: Container(
                                  width: 230,
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
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'projectDetailsPage',
                                        queryParameters: {
                                          'projectRef': serializeParam(
                                            gridViewProjectsRecord,
                                            ParamType.Document,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'projectRef': gridViewProjectsRecord,
                                        },
                                      );
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0),
                                              bottomRight: Radius.circular(0),
                                              topLeft: Radius.circular(12),
                                              topRight: Radius.circular(12),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 12, 12, 12),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  gridViewProjectsRecord
                                                      .projectName,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmallFamily,
                                                        color: Colors.white,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmallFamily),
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 12, 0, 0),
                                                  child: Text(
                                                    '${gridViewProjectsRecord.numberTasks.toString()} tasks',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 12, 12, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Builder(
                                                builder: (context) {
                                                  final members =
                                                      gridViewProjectsRecord
                                                          .usersAssigned
                                                          .toList();
                                                  return Container(
                                                    width: 150,
                                                    child: Stack(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1, 0),
                                                      children: List.generate(
                                                          members.length,
                                                          (membersIndex) {
                                                        final membersItem =
                                                            members[
                                                                membersIndex];
                                                        return StreamBuilder<
                                                            UsersRecord>(
                                                          stream: UsersRecord
                                                              .getDocument(
                                                                  membersItem),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50,
                                                                  height: 50,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            final containerUsersRecord =
                                                                snapshot.data!;
                                                            return Container(
                                                              width: 40,
                                                              height: 40,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFFEEEEEE),
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0, 0),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0, 0),
                                                                child:
                                                                    Container(
                                                                  width: 36,
                                                                  height: 36,
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Image
                                                                      .network(
                                                                    containerUsersRecord
                                                                        .photoUrl,
                                                                    fit: BoxFit
                                                                        .fitWidth,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      }),
                                                    ),
                                                  );
                                                },
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 8, 0),
                                                child: Text(
                                                  dateTimeFormat(
                                                    'relative',
                                                    gridViewProjectsRecord
                                                        .lastEdited!,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 12, 12, 16),
                                          child: LinearPercentIndicator(
                                            percent: 0.3,
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.44,
                                            lineHeight: 16,
                                            animation: true,
                                            progressColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .lineColor,
                                            barRadius: Radius.circular(12),
                                            padding: EdgeInsets.zero,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation2']!),
                              );
                            },
                          );
                        },
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
