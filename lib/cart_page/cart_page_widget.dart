import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/checkout_widget.dart';
import '../components/empty_widget_widget.dart';
import '../components/list_skeleton_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class CartPageWidget extends StatefulWidget {
  const CartPageWidget({Key? key}) : super(key: key);

  @override
  _CartPageWidgetState createState() => _CartPageWidgetState();
}

class _CartPageWidgetState extends State<CartPageWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
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
          begin: Offset(0, 70),
          end: Offset(0, 0),
        ),
      ],
    ),
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: Color(0x00FFFFFF),
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          buttonSize: 46,
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 24,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Text(
          'Cart',
          style: FlutterFlowTheme.of(context).title2,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0x00FFFFFF),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                      child: Builder(
                        builder: (context) {
                          final cartItems =
                              FFAppState().Cart.map((e) => e).toList();
                          if (cartItems.isEmpty) {
                            return EmptyWidgetWidget();
                          }
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: cartItems.length,
                            itemBuilder: (context, cartItemsIndex) {
                              final cartItemsItem = cartItems[cartItemsIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 8, 16, 12),
                                child: StreamBuilder<List<ProductsRecord>>(
                                  stream: queryProductsRecord(
                                    queryBuilder: (productsRecord) =>
                                        productsRecord.where('id',
                                            isEqualTo: getJsonField(
                                              cartItemsItem,
                                              r'''$.productRef''',
                                            ).toString()),
                                    singleRecord: true,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              1,
                                          child: ListSkeletonWidget(),
                                        ),
                                      );
                                    }
                                    List<ProductsRecord>
                                        carDetailsProductsRecordList =
                                        snapshot.data!;
                                    // Return an empty Container when the document does not exist.
                                    if (snapshot.data!.isEmpty) {
                                      return Container();
                                    }
                                    final carDetailsProductsRecord =
                                        carDetailsProductsRecordList.isNotEmpty
                                            ? carDetailsProductsRecordList.first
                                            : null;
                                    return InkWell(
                                      onTap: () async {
                                        context.pushNamed(
                                          'ProductDetailPage',
                                          queryParams: {
                                            'productDetail': serializeParam(
                                              carDetailsProductsRecord!
                                                  .reference,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );

                                        await Future.delayed(
                                            const Duration(milliseconds: 2000));
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 140,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4,
                                              color: Color(0x9A6F9488),
                                              offset: Offset(0, 2),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 10, 0, 10),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(15, 0, 5, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      width: 140,
                                                      height: 120,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0x00FFFFFF),
                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0),
                                                        child: Image.network(
                                                          valueOrDefault<
                                                              String>(
                                                            carDetailsProductsRecord!
                                                                .imageResized,
                                                            'https://firebasestorage.googleapis.com/v0/b/cozmozone-1c8e1.appspot.com/o/image-unavailable-icon-simple-illustration-129166551.jpg?alt=media&token=6a69769e-54f9-4242-b18b-4176d9b370fe',
                                                          ),
                                                          width: 160,
                                                          height: 100,
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        height: 120,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .stretch,
                                                          children: [
                                                            Expanded(
                                                              child:
                                                                  AutoSizeText(
                                                                carDetailsProductsRecord!
                                                                    .name!,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: Color(
                                                                          0xFF101213),
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      lineHeight:
                                                                          1.2,
                                                                    ),
                                                              ),
                                                            ),
                                                            Text(
                                                              carDetailsProductsRecord!
                                                                  .brand!,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText2
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                            Stack(
                                                              children: [
                                                                if (!valueOrDefault<
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
                                                                        '\$${carDetailsProductsRecord!.retailPrice?.toString()}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'Montserrat',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              fontSize: 15,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                    ),
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
                                                                        '\$${carDetailsProductsRecord!.wholesalePrice?.toString()}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'Montserrat',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              fontSize: 15,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                            Container(
                                                              width: 50,
                                                              height: 30,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      if (functions.productExistInCart(
                                                                              getJsonField(
                                                                                cartItemsItem,
                                                                                r'''$.productRef''',
                                                                              ).toString(),
                                                                              FFAppState().Cart.toList()) !=
                                                                          1) {
                                                                        setState(() => FFAppState().Cart = functions
                                                                            .decrementItemInCartCopy(
                                                                                FFAppState().Cart.toList(),
                                                                                getJsonField(
                                                                                  cartItemsItem,
                                                                                  r'''$.productRef''',
                                                                                ).toString())
                                                                            .toList());
                                                                        return;
                                                                      } else {
                                                                        setState(() => FFAppState()
                                                                            .Cart
                                                                            .remove(cartItemsItem));
                                                                        return;
                                                                      }
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .remove_outlined,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size: 24,
                                                                    ),
                                                                  ),
                                                                  AutoSizeText(
                                                                    getJsonField(
                                                                      cartItemsItem,
                                                                      r'''$.num''',
                                                                    ).toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                  InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      setState(() => FFAppState().Cart = functions
                                                                          .incrementItemInCart(
                                                                              FFAppState().Cart.toList(),
                                                                              getJsonField(
                                                                                cartItemsItem,
                                                                                r'''$.productRef''',
                                                                              ).toString())
                                                                          .toList());
                                                                    },
                                                                    child: Icon(
                                                                      Icons.add,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                      size: 24,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5, 0, 5, 0),
                                                      child: Container(
                                                        height: 120,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Stack(
                                                              children: [
                                                                InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    setState(() =>
                                                                        FFAppState()
                                                                            .Cart
                                                                            .remove(cartItemsItem));
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .close_outlined,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 24,
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
                                    ).animateOnPageLoad(animationsMap[
                                        'containerOnPageLoadAnimation']!);
                                  },
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (FFAppState().Cart.length != 0)
            Material(
              color: Colors.transparent,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                      child: FFButtonWidget(
                        onPressed: () async {
                          setState(() => FFAppState().totalToPay =
                              functions.sumOrder(FFAppState().Cart.toList()));
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Color(0x00F1F4F8),
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.5,
                                  child: CheckoutWidget(
                                    total: functions
                                        .sumOrder(FFAppState().Cart.toList()),
                                  ),
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));
                        },
                        text: 'Checkout',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 50,
                          color: FlutterFlowTheme.of(context).primaryColor,
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                  ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
