import '../auth/auth_util.dart';
import '../backend/stripe/payment_manager.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckoutWidget extends StatefulWidget {
  const CheckoutWidget({
    Key? key,
    this.total,
  }) : super(key: key);

  final double? total;

  @override
  _CheckoutWidgetState createState() => _CheckoutWidgetState();
}

class _CheckoutWidgetState extends State<CheckoutWidget> {
  String? orderId;
  String? paymentId;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1,
              decoration: BoxDecoration(
                color: Color(0x00FFFFFF),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 20, 16, 0),
                child: SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            width: double.infinity,
                            color: Color(0x00FFFFFF),
                            child: ExpandableNotifier(
                              initialExpanded: false,
                              child: ExpandablePanel(
                                header: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 12, 0),
                                        child: Icon(
                                          Icons.local_shipping_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24,
                                        ),
                                      ),
                                      Text(
                                        'Shipping Address',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                    ],
                                  ),
                                ),
                                collapsed: Container(),
                                expanded: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 5),
                                      child: AuthUserStreamWidget(
                                        child: Text(
                                          valueOrDefault(
                                              currentUserDocument?.address, ''),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: AuthUserStreamWidget(
                                        child: Text(
                                          valueOrDefault(
                                              currentUserDocument?.state, ''),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                theme: ExpandableThemeData(
                                  tapHeaderToExpand: true,
                                  tapBodyToExpand: false,
                                  tapBodyToCollapse: false,
                                  headerAlignment:
                                      ExpandablePanelHeaderAlignment.center,
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Container(
                          width: double.infinity,
                          height: 180,
                          decoration: BoxDecoration(
                            color: Color(0x00FFFFFF),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24, 16, 24, 4),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Order Summary',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24, 4, 24, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Subtotal',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontWeight: FontWeight.w300,
                                          ),
                                    ),
                                    Text(
                                      '\$${widget.total?.toString()}',
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Inter',
                                            color: Color(0xFF14181B),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24, 4, 24, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AuthUserStreamWidget(
                                      child: Text(
                                        'Taxes ${valueOrDefault(currentUserDocument?.state, '') == 'Florida' ? '6%' : '0%'}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontWeight: FontWeight.w300,
                                            ),
                                      ),
                                    ),
                                    AuthUserStreamWidget(
                                      child: Text(
                                        valueOrDefault(
                                                    currentUserDocument?.state,
                                                    '') ==
                                                'Florida'
                                            ? formatNumber(
                                                functions.pricePercentage(
                                                    6, widget.total!),
                                                formatType: FormatType.decimal,
                                                decimalType:
                                                    DecimalType.periodDecimal,
                                                currency: '\$',
                                              )
                                            : '\$0.0',
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Inter',
                                              color: Color(0xFF14181B),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24, 4, 24, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AuthUserStreamWidget(
                                      child: Text(
                                        'Shipping ${valueOrDefault(currentUserDocument?.state, '') != 'Florida' ? '6%' : ' '}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontWeight: FontWeight.w300,
                                            ),
                                      ),
                                    ),
                                    AuthUserStreamWidget(
                                      child: Text(
                                        valueOrDefault(
                                                    currentUserDocument?.state,
                                                    '') ==
                                                'Florida'
                                            ? 'FREE'
                                            : formatNumber(
                                                functions.pricePercentage(
                                                    6, widget.total!),
                                                formatType: FormatType.decimal,
                                                decimalType:
                                                    DecimalType.periodDecimal,
                                                currency: '\$',
                                              ),
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Inter',
                                              color: Color(0xFF14181B),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24, 4, 24, 24),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Total',
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1
                                              .override(
                                                fontFamily: 'Inter',
                                                color: Color(0xFF57636C),
                                                fontSize: 18,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      formatNumber(
                                        functions.sum(
                                            widget.total!,
                                            functions.pricePercentage(
                                                6, widget.total!)),
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.periodDecimal,
                                        currency: '\$',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .title1
                                          .override(
                                            fontFamily: 'Inter',
                                            color: Color(0xFF14181B),
                                            fontSize: 34,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ],
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
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
            child: FFButtonWidget(
              onPressed: () async {
                final paymentResponse = await processStripePayment(
                  context,
                  amount: functions.uSDtoCent(FFAppState().totalToPay).round(),
                  currency: 'USD',
                  customerEmail: currentUserEmail,
                  description: 'COZMOZONE Purchase',
                  allowGooglePay: false,
                  allowApplePay: false,
                  buttonColor: FlutterFlowTheme.of(context).primaryColor,
                  buttonTextColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                );
                if (paymentResponse.paymentId == null) {
                  if (paymentResponse.errorMessage != null) {
                    showSnackbar(
                      context,
                      'Error: ${paymentResponse.errorMessage}',
                    );
                  }
                  return;
                }
                paymentId = paymentResponse.paymentId!;

                orderId = await actions.createOrder(
                  currentUserReference!,
                  valueOrDefault<bool>(
                      currentUserDocument?.professional, false),
                  FFAppState().Cart.toList(),
                  functions.sum(widget.total!,
                      functions.pricePercentage(6, widget.total!)),
                  valueOrDefault(currentUserDocument?.state, '') == 'Florida'
                      ? functions.pricePercentage(6, widget.total!)
                      : 0.0,
                  valueOrDefault(currentUserDocument?.address, ''),
                  valueOrDefault(currentUserDocument?.state, ''),
                  valueOrDefault(currentUserDocument?.state, '') == 'Florida'
                      ? 0.0
                      : functions.pricePercentage(6, widget.total!),
                  widget.total!,
                  paymentId!,
                );
                Navigator.pop(context);

                context.pushNamed(
                  'PastOrderDetailPage',
                  queryParams: {
                    'order': serializeParam(
                      orderId,
                      ParamType.String,
                    ),
                  }.withoutNulls,
                );

                setState(() => FFAppState().Cart = []);

                setState(() {});
              },
              text: 'Proceed To Payment',
              options: FFButtonOptions(
                width: double.infinity,
                height: 50,
                color: FlutterFlowTheme.of(context).primaryColor,
                textStyle: FlutterFlowTheme.of(context).subtitle2.override(
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
    );
  }
}
