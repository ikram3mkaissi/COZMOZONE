import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/list_skeleton_small_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingPageWidget extends StatefulWidget {
  const SettingPageWidget({Key? key}) : super(key: key);

  @override
  _SettingPageWidgetState createState() => _SettingPageWidgetState();
}

class _SettingPageWidgetState extends State<SettingPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
          child: SelectionArea(
              child: Text(
            'Profile',
            style: FlutterFlowTheme.of(context).title1,
          )),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              FutureBuilder<List<UsersRecord>>(
                future: queryUsersRecordOnce(
                  queryBuilder: (usersRecord) =>
                      usersRecord.where('isSupport', isEqualTo: true),
                  singleRecord: true,
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 1,
                        child: ListSkeletonSmallWidget(),
                      ),
                    );
                  }
                  List<UsersRecord> containerUsersRecordList = snapshot.data!;
                  final containerUsersRecord =
                      containerUsersRecordList.isNotEmpty
                          ? containerUsersRecordList.first
                          : null;
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 1,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 16, 0, 5),
                              child: Text(
                                'General',
                                style: FlutterFlowTheme.of(context).subtitle1,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 12, 16, 0),
                              child: InkWell(
                                onTap: () async {
                                  context.pushNamed(
                                    'WishListPage',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType:
                                            PageTransitionType.rightToLeft,
                                      ),
                                    },
                                  );
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Color(0x00FFFFFF),
                                    borderRadius: BorderRadius.circular(12),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                        child: Icon(
                                          Icons.favorite_border,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 0, 0, 0),
                                        child: Text(
                                          'Wish List',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText2
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.9, 0),
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 18,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 12, 16, 0),
                              child: InkWell(
                                onTap: () async {
                                  context.pushNamed(
                                    'CartPage',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType:
                                            PageTransitionType.rightToLeft,
                                      ),
                                    },
                                  );
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Color(0x00FFFFFF),
                                    borderRadius: BorderRadius.circular(12),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                        child: Icon(
                                          Icons.shopping_cart_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 0, 0, 0),
                                        child: Text(
                                          'Cart',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText2
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.9, 0),
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 18,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 12, 16, 0),
                              child: InkWell(
                                onTap: () async {
                                  context.pushNamed(
                                    'OrderHistoryPage',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType:
                                            PageTransitionType.rightToLeft,
                                      ),
                                    },
                                  );
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Color(0x00FFFFFF),
                                    borderRadius: BorderRadius.circular(12),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                        child: Icon(
                                          Icons.list_alt_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 0, 0, 0),
                                        child: Text(
                                          'Order History',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText2
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.9, 0),
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 18,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 12, 16, 0),
                              child: InkWell(
                                onTap: () async {
                                  context.pushNamed(
                                    'ChangeAddress',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType:
                                            PageTransitionType.rightToLeft,
                                      ),
                                    },
                                  );
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Color(0x00FFFFFF),
                                    borderRadius: BorderRadius.circular(12),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                        child: Icon(
                                          Icons.local_shipping_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 0, 0, 0),
                                        child: Text(
                                          'Shipping address',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText2
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.9, 0),
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 18,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 16, 0, 0),
                              child: Text(
                                'Account',
                                style: FlutterFlowTheme.of(context).subtitle1,
                              ),
                            ),
                            SingleChildScrollView(
                              primary: false,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      child: ExpandableNotifier(
                                        initialExpanded: false,
                                        child: ExpandablePanel(
                                          header: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 10, 10, 10),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                  ),
                                                  child: Icon(
                                                    Icons
                                                        .alternate_email_outlined,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 24,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(12, 0, 0, 0),
                                                  child: Text(
                                                    'Email',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText2
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Stack(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.9, 0),
                                                        child: Icon(
                                                          Icons
                                                              .arrow_forward_ios,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 18,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          collapsed: Container(),
                                          expanded: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 8, 0, 0),
                                            child: SelectionArea(
                                                child: Text(
                                              currentUserEmail,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2,
                                            )),
                                          ),
                                          theme: ExpandableThemeData(
                                            tapHeaderToExpand: true,
                                            tapBodyToExpand: false,
                                            tapBodyToCollapse: false,
                                            headerAlignment:
                                                ExpandablePanelHeaderAlignment
                                                    .center,
                                            hasIcon: false,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 12, 16, 0),
                              child: InkWell(
                                onTap: () async {
                                  context.pushNamed(
                                    'ForgotPassPage',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType:
                                            PageTransitionType.rightToLeft,
                                      ),
                                    },
                                  );
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Color(0x00FFFFFF),
                                    borderRadius: BorderRadius.circular(12),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                        child: Icon(
                                          Icons.account_circle_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 0, 0, 0),
                                        child: Text(
                                          'Change Password',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText2
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.9, 0),
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 18,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 12, 16, 0),
                              child: InkWell(
                                onTap: () async {
                                  context.pushNamed(
                                    'CustomerSupport',
                                    queryParams: {
                                      'chatUser': serializeParam(
                                        containerUsersRecord,
                                        ParamType.Document,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      'chatUser': containerUsersRecord,
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType:
                                            PageTransitionType.rightToLeft,
                                      ),
                                    },
                                  );
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Color(0x00FFFFFF),
                                    borderRadius: BorderRadius.circular(12),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                        child: Icon(
                                          Icons.help_outline_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 0, 0, 0),
                                        child: Text(
                                          'Support',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText2
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.9, 0),
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 18,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 12, 16, 0),
                              child: Container(
                                width: double.infinity,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Color(0x00FFFFFF),
                                  borderRadius: BorderRadius.circular(12),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                      child: Icon(
                                        Icons.privacy_tip_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 0, 0, 0),
                                      child: Text(
                                        'Terms of Service',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: AlignmentDirectional(0.9, 0),
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 18,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 12, 16, 0),
                              child: InkWell(
                                onTap: () async {
                                  GoRouter.of(context).prepareAuthEvent();
                                  await signOut();

                                  context.goNamedAuth('WelcomPage', mounted);
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Color(0x00FFFFFF),
                                    borderRadius: BorderRadius.circular(12),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                        child: Icon(
                                          Icons.logout,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 0, 0, 0),
                                        child: Text(
                                          'Logout',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText2
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.9, 0),
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 18,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
