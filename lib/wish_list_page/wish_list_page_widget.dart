import '../backend/backend.dart';
import '../components/empty_widget_copy_widget.dart';
import '../components/list_skeleton_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WishListPageWidget extends StatefulWidget {
  const WishListPageWidget({Key? key}) : super(key: key);

  @override
  _WishListPageWidgetState createState() => _WishListPageWidgetState();
}

class _WishListPageWidgetState extends State<WishListPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
          child: Text(
            'Wish List',
            style: FlutterFlowTheme.of(context).title1,
          ),
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                child: Builder(
                  builder: (context) {
                    final product = FFAppState().likedProducts.toList();
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(product.length, (productIndex) {
                          final productItem = product[productIndex];
                          return Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                            child: StreamBuilder<ProductsRecord>(
                              stream: ProductsRecord.getDocument(productItem),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              1,
                                      child: ListSkeletonWidget(),
                                    ),
                                  );
                                }
                                final containerProductsRecord = snapshot.data!;
                                return InkWell(
                                  onTap: () async {
                                    context.pushNamed(
                                      'ProductDetailPage',
                                      queryParams: {
                                        'productDetail': serializeParam(
                                          productItem,
                                          ParamType.DocumentReference,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4,
                                          color: Color(0x520E151B),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 8, 8, 8),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Image.network(
                                            containerProductsRecord
                                                .imageResized!,
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.cover,
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 0, 0, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  AutoSizeText(
                                                    containerProductsRecord
                                                        .name!,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 1,
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
                                );
                              },
                            ),
                          );
                        }),
                      ),
                    );
                  },
                ),
              ),
              if (FFAppState().likedProducts.length == 0)
                EmptyWidgetCopyWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
