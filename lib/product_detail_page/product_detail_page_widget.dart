import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class ProductDetailPageWidget extends StatefulWidget {
  const ProductDetailPageWidget({
    Key? key,
    this.productDetail,
  }) : super(key: key);

  final DocumentReference? productDetail;

  @override
  _ProductDetailPageWidgetState createState() =>
      _ProductDetailPageWidgetState();
}

class _ProductDetailPageWidgetState extends State<ProductDetailPageWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'columnOnPageLoadAnimation': AnimationInfo(
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
          begin: Offset(0, 40),
          end: Offset(0, 0),
        ),
      ],
    ),
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ProductsRecord>(
      stream: ProductsRecord.getDocument(widget.productDetail!),
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
        final productDetailPageProductsRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: Color(0x00C0CEDA),
            automaticallyImplyLeading: false,
            leading: InkWell(
              onTap: () async {
                context.pop();
              },
              child: Icon(
                Icons.arrow_back_rounded,
                color: Colors.black,
                size: 24,
              ),
            ),
            title: Text(
              ' ',
              style: FlutterFlowTheme.of(context).subtitle2.override(
                    fontFamily: 'Lexend Deca',
                    color: Color(0xFF151B1E),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
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
                    buttonSize: 48,
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.black,
                      size: 25,
                    ),
                    onPressed: () async {
                      context.pushNamed('CartPage');

                      await Future.delayed(const Duration(milliseconds: 2000));
                    },
                  ),
                ),
              ),
            ],
            centerTitle: false,
            elevation: 0,
          ),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(30, 20, 30, 20),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 70,
                                  color: Color(0x65C0CEDA),
                                  offset: Offset(0, 2),
                                  spreadRadius: 3,
                                )
                              ],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 16, 16, 16),
                                child: InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        child: FlutterFlowExpandedImageView(
                                          image: Image.network(
                                            productDetailPageProductsRecord
                                                .image!,
                                            fit: BoxFit.contain,
                                          ),
                                          allowRotation: false,
                                          tag: productDetailPageProductsRecord
                                              .image!,
                                          useHeroAnimation: true,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: productDetailPageProductsRecord.image!,
                                    transitionOnUserGestures: true,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.network(
                                        productDetailPageProductsRecord.image!,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 16, 0),
                                      child: AutoSizeText(
                                        productDetailPageProductsRecord.name!,
                                        style: FlutterFlowTheme.of(context)
                                            .title1
                                            .override(
                                              fontFamily: 'joane',
                                              fontSize: 30,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Stack(
                                    children: [
                                      if (FFAppState().likedProducts.contains(
                                          productDetailPageProductsRecord
                                              .reference))
                                        InkWell(
                                          onTap: () async {
                                            setState(() => FFAppState()
                                                .removeFromLikedProducts(
                                                    productDetailPageProductsRecord
                                                        .reference));
                                          },
                                          child: Icon(
                                            Icons.favorite,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            size: 30,
                                          ),
                                        ),
                                      if (!FFAppState().likedProducts.contains(
                                          productDetailPageProductsRecord
                                              .reference))
                                        InkWell(
                                          onTap: () async {
                                            setState(() => FFAppState()
                                                .addToLikedProducts(
                                                    productDetailPageProductsRecord
                                                        .reference));
                                          },
                                          child: Icon(
                                            Icons.favorite_border,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            size: 30,
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 4, 0, 4),
                              child: Text(
                                productDetailPageProductsRecord.brand!,
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0x00FFFFFF),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  color: Color(0x00FFFFFF),
                                  child: ExpandableNotifier(
                                    initialExpanded: false,
                                    child: ExpandablePanel(
                                      header: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 12, 0),
                                            child: Icon(
                                              Icons.sticky_note_2_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24,
                                            ),
                                          ),
                                          Text(
                                            'Description',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                        ],
                                      ),
                                      collapsed: Container(),
                                      expanded: Text(
                                        productDetailPageProductsRecord
                                            .description!,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                      ),
                                      theme: ExpandableThemeData(
                                        tapHeaderToExpand: true,
                                        tapBodyToExpand: false,
                                        tapBodyToCollapse: false,
                                        headerAlignment:
                                            ExpandablePanelHeaderAlignment
                                                .center,
                                        hasIcon: true,
                                        expandIcon: Icons.chevron_right_rounded,
                                        collapseIcon:
                                            Icons.keyboard_arrow_down_rounded,
                                        iconSize: 24,
                                        iconColor: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0x00FFFFFF),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  color: Color(0x00FFFFFF),
                                  child: ExpandableNotifier(
                                    initialExpanded: false,
                                    child: ExpandablePanel(
                                      header: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 12, 0),
                                            child: Icon(
                                              Icons.info_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24,
                                            ),
                                          ),
                                          Text(
                                            'Details',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                        ],
                                      ),
                                      collapsed: Container(),
                                      expanded: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 5, 0, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Size',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 5, 0, 0),
                                              child: Text(
                                                productDetailPageProductsRecord
                                                    .size!,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2,
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 10, 0, 0),
                                                  child: Text(
                                                    'Dimension',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 5, 0, 0),
                                                  child: Text(
                                                    productDetailPageProductsRecord
                                                        .dimension!,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText2,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 10, 0, 0),
                                                  child: Text(
                                                    'Weight',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 5, 0, 0),
                                                  child: Text(
                                                    productDetailPageProductsRecord
                                                        .weight!,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText2,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      theme: ExpandableThemeData(
                                        tapHeaderToExpand: true,
                                        tapBodyToExpand: false,
                                        tapBodyToCollapse: false,
                                        headerAlignment:
                                            ExpandablePanelHeaderAlignment
                                                .center,
                                        hasIcon: true,
                                        expandIcon: Icons.chevron_right_rounded,
                                        collapseIcon:
                                            Icons.keyboard_arrow_down_rounded,
                                        iconSize: 24,
                                        iconColor: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ).animateOnPageLoad(
                          animationsMap['columnOnPageLoadAnimation']!),
                    ],
                  ),
                ),
              ),
              if (valueOrDefault<bool>(
                      currentUserDocument?.professional, false) ||
                  (!valueOrDefault<bool>(
                          currentUserDocument?.professional, false) &&
                      !functions.isProfessionalProduct(
                          productDetailPageProductsRecord.typeProduct!
                              .toList())))
                AuthUserStreamWidget(
                  child: Material(
                    color: Colors.transparent,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).lineColor,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 10, 16, 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 0, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 5),
                                        child: Text(
                                          'Price',
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1,
                                        ),
                                      ),
                                      Stack(
                                        children: [
                                          if (!valueOrDefault<bool>(
                                              currentUserDocument?.professional,
                                              false))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 4, 0, 0),
                                              child: Text(
                                                '\$${productDetailPageProductsRecord.retailPrice?.toString()}',
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 25,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                          if (valueOrDefault<bool>(
                                              currentUserDocument?.professional,
                                              false))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 4, 0, 0),
                                              child: Text(
                                                '\$${productDetailPageProductsRecord.wholesalePrice?.toString()}',
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 25,
                                                        ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                if (valueOrDefault<bool>(
                                        currentUserDocument?.professional,
                                        false) ||
                                    (!valueOrDefault<bool>(
                                            currentUserDocument?.professional,
                                            false) &&
                                        !functions.isProfessionalProduct(
                                            productDetailPageProductsRecord
                                                .typeProduct!
                                                .toList())))
                                  Stack(
                                    children: [
                                      if (functions
                                              .productExistInCart(
                                                  productDetailPageProductsRecord
                                                      .id!,
                                                  FFAppState().Cart.toList())
                                              .toString() ==
                                          '0')
                                        FFButtonWidget(
                                          onPressed: () async {
                                            if (valueOrDefault<bool>(
                                                currentUserDocument
                                                    ?.professional,
                                                false)) {
                                              setState(() => FFAppState()
                                                  .Cart
                                                  .add(functions.productToJson(
                                                      productDetailPageProductsRecord
                                                          .id!,
                                                      1,
                                                      productDetailPageProductsRecord
                                                          .wholesalePrice!)));
                                              return;
                                            } else {
                                              setState(() => FFAppState()
                                                  .Cart
                                                  .add(functions.productToJson(
                                                      productDetailPageProductsRecord
                                                          .id!,
                                                      1,
                                                      productDetailPageProductsRecord
                                                          .retailPrice!)));
                                              return;
                                            }
                                          },
                                          text: 'Add to Cart',
                                          icon: Icon(
                                            Icons.add_shopping_cart,
                                            size: 15,
                                          ),
                                          options: FFButtonOptions(
                                            width: 160,
                                            height: 50,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .subtitle2
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.white,
                                                    ),
                                            elevation: 0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                          ),
                                        ),
                                      if (functions
                                              .productExistInCart(
                                                  productDetailPageProductsRecord
                                                      .id!,
                                                  FFAppState().Cart.toList())
                                              .toString() !=
                                          '0')
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 20, 0),
                                          child: Container(
                                            width: 150,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                InkWell(
                                                  onTap: () async {
                                                    if (functions
                                                            .productExistInCart(
                                                                productDetailPageProductsRecord
                                                                    .id!,
                                                                FFAppState()
                                                                    .Cart
                                                                    .toList())
                                                            .toString() !=
                                                        '1') {
                                                      setState(() => FFAppState()
                                                              .Cart =
                                                          functions
                                                              .decrementItemInCartCopy(
                                                                  FFAppState()
                                                                      .Cart
                                                                      .toList(),
                                                                  productDetailPageProductsRecord
                                                                      .id!)
                                                              .toList());
                                                      return;
                                                    } else {
                                                      setState(() => FFAppState()
                                                              .Cart =
                                                          functions
                                                              .removeItemFromCart(
                                                                  FFAppState()
                                                                      .Cart
                                                                      .toList(),
                                                                  productDetailPageProductsRecord
                                                                      .id!)
                                                              .toList());
                                                      return;
                                                    }
                                                  },
                                                  child: Icon(
                                                    Icons.remove_outlined,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 26,
                                                  ),
                                                ),
                                                AutoSizeText(
                                                  functions
                                                      .productExistInCart(
                                                          productDetailPageProductsRecord
                                                              .id!,
                                                          FFAppState()
                                                              .Cart
                                                              .toList())
                                                      .toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                                InkWell(
                                                  onTap: () async {
                                                    setState(() => FFAppState()
                                                            .Cart =
                                                        functions
                                                            .incrementItemInCart(
                                                                FFAppState()
                                                                    .Cart
                                                                    .toList(),
                                                                productDetailPageProductsRecord
                                                                    .id!)
                                                            .toList());
                                                  },
                                                  child: Icon(
                                                    Icons.add,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    size: 26,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
