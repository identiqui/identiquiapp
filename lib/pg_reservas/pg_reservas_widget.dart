import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pg_principal/pg_principal_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pg_reservas_model.dart';
export 'pg_reservas_model.dart';

class PgReservasWidget extends StatefulWidget {
  const PgReservasWidget({
    Key? key,
    this.dadosMorador,
  }) : super(key: key);

  final dynamic dadosMorador;

  @override
  _PgReservasWidgetState createState() => _PgReservasWidgetState();
}

class _PgReservasWidgetState extends State<PgReservasWidget> {
  late PgReservasModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PgReservasModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: AppBar(
            backgroundColor: Color(0xFFE57149),
            automaticallyImplyLeading: false,
            leading: InkWell(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PgPrincipalWidget(
                      dadosMorador: widget.dadosMorador,
                    ),
                  ),
                );
              },
              child: Icon(
                Icons.navigate_before,
                color: FlutterFlowTheme.of(context).primaryBtnText,
                size: 24.0,
              ),
            ),
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              title: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(60.0, 30.0, 0.0, 35.0),
                child: Text(
                  'Reservas',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 22.0,
                      ),
                ),
              ),
              centerTitle: false,
              expandedTitleScale: 1.0,
            ),
            elevation: 2.0,
          ),
        ),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [],
          ),
        ),
      ),
    );
  }
}
