import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pg_principal/pg_principal_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pg_liberacoes_model.dart';
export 'pg_liberacoes_model.dart';

class PgLiberacoesWidget extends StatefulWidget {
  const PgLiberacoesWidget({
    Key? key,
    this.dadosMorador,
  }) : super(key: key);

  final dynamic dadosMorador;

  @override
  _PgLiberacoesWidgetState createState() => _PgLiberacoesWidgetState();
}

class _PgLiberacoesWidgetState extends State<PgLiberacoesWidget> {
  late PgLiberacoesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PgLiberacoesModel());
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
                padding: EdgeInsetsDirectional.fromSTEB(60.0, 0.0, 0.0, 35.0),
                child: Text(
                  'Liberações',
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
