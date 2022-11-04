import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/list_skeleton_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderHistoryPageWidget extends StatefulWidget {
  const OrderHistoryPageWidget({Key? key}) : super(key: key);

  @override
  _OrderHistoryPageWidgetState createState() => _OrderHistoryPageWidgetState();
}

class _OrderHistoryPageWidgetState extends State<OrderHistoryPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 24,
          ),
          onPressed: () async {
            context.pushNamed('SettingPage');
          },
        ),
        title: Text(
          'Order History',
          style: FlutterFlowTheme.of(context).title2,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                    child: StreamBuilder<List<OrderRecord>>(
                      stream: queryOrderRecord(
                        queryBuilder: (orderRecord) => orderRecord
                            .where('customerRef',
                                isEqualTo: currentUserReference)
                            .orderBy('created_at', descending: true),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                            ),
                          );
                        }
                        List<OrderRecord> listViewOrderRecordList =
                            snapshot.data!;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewOrderRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewOrderRecord =
                                listViewOrderRecordList[listViewIndex];
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                StreamBuilder<List<ProductOrderRecord>>(
                                  stream: queryProductOrderRecord(
                                    parent: listViewOrderRecord.reference,
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
                                    List<ProductOrderRecord>
                                        columnProductOrderRecordList =
                                        snapshot.data!;
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: List.generate(
                                          columnProductOrderRecordList.length,
                                          (columnIndex) {
                                        final columnProductOrderRecord =
                                            columnProductOrderRecordList[
                                                columnIndex];
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(16, 8, 16, 8),
                                              child: StreamBuilder<
                                                  List<ProductsRecord>>(
                                                stream: queryProductsRecord(
                                                  queryBuilder: (productsRecord) =>
                                                      productsRecord.where('id',
                                                          isEqualTo:
                                                              columnProductOrderRecord
                                                                  .productId),
                                                  singleRecord: true,
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 40,
                                                        height: 40,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color:
                                                              Color(0x004B39EF),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<ProductsRecord>
                                                      containerProductsRecordList =
                                                      snapshot.data!;
                                                  // Return an empty Container when the document does not exist.
                                                  if (snapshot.data!.isEmpty) {
                                                    return Container();
                                                  }
                                                  final containerProductsRecord =
                                                      containerProductsRecordList
                                                              .isNotEmpty
                                                          ? containerProductsRecordList
                                                              .first
                                                          : null;
                                                  return InkWell(
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        'PastOrderDetailPage',
                                                        queryParams: {
                                                          'order':
                                                              serializeParam(
                                                            listViewOrderRecord
                                                                .id,
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 100,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 4,
                                                            color: Color(
                                                                0x520E151B),
                                                            offset:
                                                                Offset(0, 2),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8, 8, 8, 8),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Image.network(
                                                              valueOrDefault<
                                                                  String>(
                                                                containerProductsRecord!
                                                                    .imageResized,
                                                                'https://firebasestorage.googleapis.com/v0/b/cozmozone-1c8e1.appspot.com/o/image-unavailable-icon-simple-illustration-129166551.jpg?alt=media&token=6a69769e-54f9-4242-b18b-4176d9b370fe',
                                                              ),
                                                              width: 100,
                                                              height: 100,
                                                              fit: BoxFit.cover,
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    AutoSizeText(
                                                                      containerProductsRecord!
                                                                          .name!,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .subtitle1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            fontSize:
                                                                                15,
                                                                          ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              5,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        dateTimeFormat(
                                                                            'yMMMd',
                                                                            listViewOrderRecord.createdAt!),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText2,
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
                                                                          0,
                                                                          0,
                                                                          5,
                                                                          0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Text(
                                                                    formatNumber(
                                                                      columnProductOrderRecord
                                                                          .price!,
                                                                      formatType:
                                                                          FormatType
                                                                              .decimal,
                                                                      decimalType:
                                                                          DecimalType
                                                                              .periodDecimal,
                                                                      currency:
                                                                          '\$',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText2,
                                                                  ),
                                                                  SelectionArea(
                                                                      child:
                                                                          Text(
                                                                    'x${columnProductOrderRecord.num?.toString()}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1,
                                                                  )),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        );
                                      }),
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
