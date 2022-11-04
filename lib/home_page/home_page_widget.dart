import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/list_skeleton_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
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
          duration: 400.ms,
          begin: Offset(70, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
  };
  List<String>? choiceChipsValues1;
  List<String>? choiceChipsValues2;
  TextEditingController? textController;
  String? dropDownValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() => FFAppState().brands = []);
      setState(() => FFAppState().types = []);
      setState(() => FFAppState().showFilter = false);
      setState(() => FFAppState().searchValue = '');
      setState(() => FFAppState().orderBy = 0);
    });

    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductsRecord>>(
      future: queryProductsRecordOnce(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        List<ProductsRecord> homePageProductsRecordList = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            title: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: Text(
                'cozmozone',
                style: FlutterFlowTheme.of(context).title1,
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 24, 0),
                child: Badge(
                  badgeContent: Text(
                    FFAppState().Cart.length.toString(),
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontSize: 13,
                        ),
                  ),
                  showBadge: true,
                  shape: BadgeShape.circle,
                  badgeColor: FlutterFlowTheme.of(context).primaryColor,
                  elevation: 4,
                  padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                  position: BadgePosition.topEnd(),
                  animationType: BadgeAnimationType.scale,
                  toAnimate: true,
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 48,
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.black,
                      size: 25,
                    ),
                    onPressed: () async {
                      context.pushNamed('CartPage');
                    },
                  ),
                ),
              ),
            ],
            centerTitle: false,
            elevation: 0,
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 1,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Color(0x00FFFFFF),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 16, 0),
                                    child: TextFormField(
                                      controller: textController,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        'textController',
                                        Duration(milliseconds: 2000),
                                        () async {
                                          setState(() =>
                                              FFAppState().searchValue =
                                                  textController!.text);
                                        },
                                      ),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        hintText: 'Search here',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .lineColor,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .lineColor,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        suffixIcon: Icon(
                                          Icons.search,
                                          color: Color(0xFF757575),
                                          size: 23,
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ),
                                ),
                                Stack(
                                  children: [
                                    if (FFAppState().showFilter)
                                      InkWell(
                                        onTap: () async {
                                          setState(() =>
                                              FFAppState().showFilter =
                                                  !FFAppState().showFilter);
                                        },
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              width: 2,
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.filter_list_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            size: 24,
                                          ),
                                        ),
                                      ),
                                    if (!FFAppState().showFilter)
                                      InkWell(
                                        onTap: () async {
                                          setState(() =>
                                              FFAppState().showFilter =
                                                  !FFAppState().showFilter);
                                        },
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .lineColor,
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.filter_list_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (FFAppState().showFilter)
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 16, 16),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 0, 0, 0),
                                        child: Text(
                                          'Filters',
                                          style: FlutterFlowTheme.of(context)
                                              .title2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 12, 0, 8),
                                          child: Text(
                                            'Brands',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16, 0, 16, 0),
                                            child: FlutterFlowChoiceChips(
                                              initiallySelected:
                                                  FFAppState().brands,
                                              options: functions
                                                  .getBrands(
                                                      homePageProductsRecordList
                                                          .toList())
                                                  .map((label) =>
                                                      ChipData(label))
                                                  .toList(),
                                              onChanged: (val) async {
                                                setState(() =>
                                                    choiceChipsValues1 = val);
                                                setState(() => FFAppState()
                                                        .brands =
                                                    choiceChipsValues1!
                                                        .where(
                                                            (e) => e != 'All')
                                                        .toList());
                                              },
                                              selectedChipStyle: ChipStyle(
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.white,
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                iconColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                iconSize: 18,
                                                elevation: 0,
                                              ),
                                              unselectedChipStyle: ChipStyle(
                                                backgroundColor:
                                                    Color(0x1C4B39EF),
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText2
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                iconColor: Color(0xFF323B45),
                                                iconSize: 18,
                                                elevation: 0,
                                              ),
                                              chipSpacing: 8,
                                              multiselect: true,
                                              initialized:
                                                  choiceChipsValues1 != null,
                                              alignment: WrapAlignment.start,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16, 16, 0, 8),
                                            child: Text(
                                              'Categories',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(16, 0, 16, 8),
                                              child: FlutterFlowChoiceChips(
                                                initiallySelected:
                                                    FFAppState().types,
                                                options: functions
                                                    .getCategories(
                                                        homePageProductsRecordList
                                                            .toList())
                                                    .map((label) =>
                                                        ChipData(label))
                                                    .toList(),
                                                onChanged: (val) async {
                                                  setState(() =>
                                                      choiceChipsValues2 = val);
                                                  setState(() =>
                                                      FFAppState().types =
                                                          choiceChipsValues2!
                                                              .toList());
                                                },
                                                selectedChipStyle: ChipStyle(
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryColor,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            color: Colors.white,
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                  iconColor: Colors.white,
                                                  iconSize: 18,
                                                  elevation: 0,
                                                ),
                                                unselectedChipStyle: ChipStyle(
                                                  backgroundColor:
                                                      Color(0x1C4B39EF),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                  iconColor: Color(0x164B39EF),
                                                  iconSize: 18,
                                                  elevation: 0,
                                                ),
                                                chipSpacing: 8,
                                                multiselect: true,
                                                initialized:
                                                    choiceChipsValues2 != null,
                                                alignment: WrapAlignment.start,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ).animateOnPageLoad(
                                animationsMap['columnOnPageLoadAnimation']!),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                                child: FlutterFlowDropDown(
                                  options: [
                                    'Newest',
                                    'High to Low Price',
                                    'Low to High Price'
                                  ],
                                  onChanged: (val) async {
                                    setState(() => dropDownValue = val);
                                    setState(() => FFAppState().orderBy = () {
                                          if (dropDownValue ==
                                              'High to Low Price') {
                                            return 1;
                                          } else if (dropDownValue ==
                                              'Low to High Price') {
                                            return 2;
                                          } else {
                                            return 0;
                                          }
                                        }());
                                  },
                                  width: 170,
                                  height: 50,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 15,
                                      ),
                                  hintText: 'Sort By',
                                  fillColor: Colors.white,
                                  elevation: 0,
                                  borderColor: Colors.transparent,
                                  borderWidth: 0,
                                  borderRadius: 10,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      12, 4, 12, 4),
                                  hidesUnderline: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Stack(
                          children: [
                            if (FFAppState().orderBy == 0)
                              FutureBuilder<List<ProductsRecord>>(
                                future: queryProductsRecordOnce(
                                  queryBuilder: (productsRecord) =>
                                      productsRecord.orderBy('created_at'),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: ListSkeletonWidget(),
                                    );
                                  }
                                  List<ProductsRecord>
                                      listViewProductsRecordList =
                                      snapshot.data!;
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        listViewProductsRecordList.length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewProductsRecord =
                                          listViewProductsRecordList[
                                              listViewIndex];
                                      return Visibility(
                                        visible: functions.doShowProduct(
                                            listViewProductsRecord,
                                            FFAppState().brands.toList(),
                                            FFAppState().types.toList(),
                                            FFAppState().searchValue),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 8, 16, 12),
                                          child: InkWell(
                                            onTap: () async {
                                              context.pushNamed(
                                                'ProductDetailPage',
                                                queryParams: {
                                                  'productDetail':
                                                      serializeParam(
                                                    listViewProductsRecord
                                                        .reference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                              );

                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 2000));
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              height: 160,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 8,
                                                    color: Color(0x596F9488),
                                                    offset: Offset(2, 2),
                                                    spreadRadius: 2,
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                border: Border.all(
                                                  color: Color(0x00BEA9AF),
                                                  width: 0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 10, 0, 10),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  15, 0, 5, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Container(
                                                              height: 130,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .stretch,
                                                                children: [
                                                                  Text(
                                                                    listViewProductsRecord
                                                                        .name!,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .subtitle1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              Color(0xFF101213),
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          lineHeight:
                                                                              1.2,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    listViewProductsRecord
                                                                        .brand!,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText2
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                  Stack(
                                                                    children: [
                                                                      if (valueOrDefault<
                                                                              bool>(
                                                                          currentUserDocument
                                                                              ?.professional,
                                                                          false))
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              2,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              AuthUserStreamWidget(
                                                                            child:
                                                                                Text(
                                                                              '\$${listViewProductsRecord.retailPrice?.toString()}',
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    fontSize: 13,
                                                                                    fontWeight: FontWeight.w300,
                                                                                    decoration: TextDecoration.lineThrough,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      if (!valueOrDefault<bool>(
                                                                              currentUserDocument
                                                                                  ?.professional,
                                                                              false) &&
                                                                          !functions.isProfessionalProduct(listViewProductsRecord
                                                                              .typeProduct!
                                                                              .toList()))
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              2,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              AuthUserStreamWidget(
                                                                            child:
                                                                                Text(
                                                                              '\$${listViewProductsRecord.retailPrice?.toString()}',
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    fontSize: 18,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                  if (valueOrDefault<
                                                                          bool>(
                                                                      currentUserDocument
                                                                          ?.professional,
                                                                      false))
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              2,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          AuthUserStreamWidget(
                                                                        child:
                                                                            Text(
                                                                          '\$${listViewProductsRecord.wholesalePrice?.toString()}',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Montserrat',
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                fontSize: 18,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 140,
                                                            height: 130,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0),
                                                              child:
                                                                  CachedNetworkImage(
                                                                imageUrl:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  listViewProductsRecord
                                                                      .imageResized,
                                                                  'https://firebasestorage.googleapis.com/v0/b/cozmozone-1c8e1.appspot.com/o/image-unavailable-icon-simple-illustration-129166551.jpg?alt=media&token=6a69769e-54f9-4242-b18b-4176d9b370fe',
                                                                ),
                                                                width: 160,
                                                                height: 70,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5,
                                                                        0,
                                                                        5,
                                                                        0),
                                                            child: Container(
                                                              height: 130,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Stack(
                                                                    children: [
                                                                      if (FFAppState()
                                                                          .likedProducts
                                                                          .contains(
                                                                              listViewProductsRecord.reference))
                                                                        InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            setState(() =>
                                                                                FFAppState().removeFromLikedProducts(listViewProductsRecord.reference));
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.favorite,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            size:
                                                                                30,
                                                                          ),
                                                                        ),
                                                                      if (!FFAppState()
                                                                          .likedProducts
                                                                          .contains(
                                                                              listViewProductsRecord.reference))
                                                                        InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            setState(() =>
                                                                                FFAppState().addToLikedProducts(listViewProductsRecord.reference));
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.favorite_border,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryColor,
                                                                            size:
                                                                                30,
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            if (FFAppState().orderBy == 1)
                              FutureBuilder<List<ProductsRecord>>(
                                future: queryProductsRecordOnce(
                                  queryBuilder: (productsRecord) =>
                                      productsRecord.orderBy('wholesale_price'),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: ListSkeletonWidget(),
                                    );
                                  }
                                  List<ProductsRecord>
                                      listViewProductsRecordList =
                                      snapshot.data!;
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        listViewProductsRecordList.length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewProductsRecord =
                                          listViewProductsRecordList[
                                              listViewIndex];
                                      return Visibility(
                                        visible: functions.doShowProduct(
                                            listViewProductsRecord,
                                            FFAppState().brands.toList(),
                                            FFAppState().types.toList(),
                                            FFAppState().searchValue),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 8, 16, 12),
                                          child: InkWell(
                                            onTap: () async {
                                              context.pushNamed(
                                                'ProductDetailPage',
                                                queryParams: {
                                                  'productDetail':
                                                      serializeParam(
                                                    listViewProductsRecord
                                                        .reference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                              );

                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 2000));
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              height: 160,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 8,
                                                    color: Color(0x596F9488),
                                                    offset: Offset(2, 2),
                                                    spreadRadius: 2,
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                border: Border.all(
                                                  color: Color(0x00BEA9AF),
                                                  width: 0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 10, 0, 10),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  15, 0, 5, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Container(
                                                              height: 130,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .stretch,
                                                                children: [
                                                                  Text(
                                                                    listViewProductsRecord
                                                                        .name!,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .subtitle1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              Color(0xFF101213),
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          lineHeight:
                                                                              1.2,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    listViewProductsRecord
                                                                        .brand!,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText2
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                  Stack(
                                                                    children: [
                                                                      if (valueOrDefault<
                                                                              bool>(
                                                                          currentUserDocument
                                                                              ?.professional,
                                                                          false))
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              2,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              AuthUserStreamWidget(
                                                                            child:
                                                                                Text(
                                                                              '\$${listViewProductsRecord.retailPrice?.toString()}',
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    fontSize: 13,
                                                                                    fontWeight: FontWeight.w300,
                                                                                    decoration: TextDecoration.lineThrough,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      if (!valueOrDefault<bool>(
                                                                              currentUserDocument
                                                                                  ?.professional,
                                                                              false) &&
                                                                          !functions.isProfessionalProduct(listViewProductsRecord
                                                                              .typeProduct!
                                                                              .toList()))
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              2,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              AuthUserStreamWidget(
                                                                            child:
                                                                                Text(
                                                                              '\$${listViewProductsRecord.retailPrice?.toString()}',
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    fontSize: 18,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                  if (valueOrDefault<
                                                                          bool>(
                                                                      currentUserDocument
                                                                          ?.professional,
                                                                      false))
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              2,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          AuthUserStreamWidget(
                                                                        child:
                                                                            Text(
                                                                          '\$${listViewProductsRecord.wholesalePrice?.toString()}',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Montserrat',
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                fontSize: 18,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 140,
                                                            height: 130,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0),
                                                              child:
                                                                  CachedNetworkImage(
                                                                imageUrl:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  listViewProductsRecord
                                                                      .imageResized,
                                                                  'https://firebasestorage.googleapis.com/v0/b/cozmozone-1c8e1.appspot.com/o/image-unavailable-icon-simple-illustration-129166551.jpg?alt=media&token=6a69769e-54f9-4242-b18b-4176d9b370fe',
                                                                ),
                                                                width: 160,
                                                                height: 70,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5,
                                                                        0,
                                                                        5,
                                                                        0),
                                                            child: Container(
                                                              height: 130,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Stack(
                                                                    children: [
                                                                      if (FFAppState()
                                                                          .likedProducts
                                                                          .contains(
                                                                              listViewProductsRecord.reference))
                                                                        InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            setState(() =>
                                                                                FFAppState().removeFromLikedProducts(listViewProductsRecord.reference));
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.favorite,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            size:
                                                                                30,
                                                                          ),
                                                                        ),
                                                                      if (!FFAppState()
                                                                          .likedProducts
                                                                          .contains(
                                                                              listViewProductsRecord.reference))
                                                                        InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            setState(() =>
                                                                                FFAppState().addToLikedProducts(listViewProductsRecord.reference));
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.favorite_border,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryColor,
                                                                            size:
                                                                                30,
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            if (FFAppState().orderBy == 2)
                              FutureBuilder<List<ProductsRecord>>(
                                future: queryProductsRecordOnce(
                                  queryBuilder: (productsRecord) =>
                                      productsRecord.orderBy('wholesale_price'),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: ListSkeletonWidget(),
                                    );
                                  }
                                  List<ProductsRecord>
                                      listViewProductsRecordList =
                                      snapshot.data!;
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        listViewProductsRecordList.length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewProductsRecord =
                                          listViewProductsRecordList[
                                              listViewIndex];
                                      return Visibility(
                                        visible: functions.doShowProduct(
                                            listViewProductsRecord,
                                            FFAppState().brands.toList(),
                                            FFAppState().types.toList(),
                                            FFAppState().searchValue),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 8, 16, 12),
                                          child: InkWell(
                                            onTap: () async {
                                              context.pushNamed(
                                                'ProductDetailPage',
                                                queryParams: {
                                                  'productDetail':
                                                      serializeParam(
                                                    listViewProductsRecord
                                                        .reference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                              );

                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 2000));
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              height: 160,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 8,
                                                    color: Color(0x596F9488),
                                                    offset: Offset(2, 2),
                                                    spreadRadius: 2,
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                border: Border.all(
                                                  color: Color(0x00BEA9AF),
                                                  width: 0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 10, 0, 10),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  15, 0, 5, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Container(
                                                              height: 130,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .stretch,
                                                                children: [
                                                                  Text(
                                                                    listViewProductsRecord
                                                                        .name!,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .subtitle1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              Color(0xFF101213),
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          lineHeight:
                                                                              1.2,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    listViewProductsRecord
                                                                        .brand!,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText2
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                  Stack(
                                                                    children: [
                                                                      if (valueOrDefault<
                                                                              bool>(
                                                                          currentUserDocument
                                                                              ?.professional,
                                                                          false))
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              2,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              AuthUserStreamWidget(
                                                                            child:
                                                                                Text(
                                                                              '\$${listViewProductsRecord.retailPrice?.toString()}',
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    fontSize: 13,
                                                                                    fontWeight: FontWeight.w300,
                                                                                    decoration: TextDecoration.lineThrough,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      if (!valueOrDefault<bool>(
                                                                              currentUserDocument
                                                                                  ?.professional,
                                                                              false) &&
                                                                          !functions.isProfessionalProduct(listViewProductsRecord
                                                                              .typeProduct!
                                                                              .toList()))
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              2,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              AuthUserStreamWidget(
                                                                            child:
                                                                                Text(
                                                                              '\$${listViewProductsRecord.retailPrice?.toString()}',
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    fontSize: 18,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                  if (valueOrDefault<
                                                                          bool>(
                                                                      currentUserDocument
                                                                          ?.professional,
                                                                      false))
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              2,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          AuthUserStreamWidget(
                                                                        child:
                                                                            Text(
                                                                          '\$${listViewProductsRecord.wholesalePrice?.toString()}',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Montserrat',
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                fontSize: 18,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 140,
                                                            height: 130,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0),
                                                              child:
                                                                  CachedNetworkImage(
                                                                imageUrl:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  listViewProductsRecord
                                                                      .imageResized,
                                                                  'https://firebasestorage.googleapis.com/v0/b/cozmozone-1c8e1.appspot.com/o/image-unavailable-icon-simple-illustration-129166551.jpg?alt=media&token=6a69769e-54f9-4242-b18b-4176d9b370fe',
                                                                ),
                                                                width: 160,
                                                                height: 70,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5,
                                                                        0,
                                                                        5,
                                                                        0),
                                                            child: Container(
                                                              height: 130,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Stack(
                                                                    children: [
                                                                      if (FFAppState()
                                                                          .likedProducts
                                                                          .contains(
                                                                              listViewProductsRecord.reference))
                                                                        InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            setState(() =>
                                                                                FFAppState().removeFromLikedProducts(listViewProductsRecord.reference));
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.favorite,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            size:
                                                                                30,
                                                                          ),
                                                                        ),
                                                                      if (!FFAppState()
                                                                          .likedProducts
                                                                          .contains(
                                                                              listViewProductsRecord.reference))
                                                                        InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            setState(() =>
                                                                                FFAppState().addToLikedProducts(listViewProductsRecord.reference));
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.favorite_border,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryColor,
                                                                            size:
                                                                                30,
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
