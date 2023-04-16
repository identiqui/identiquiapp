import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class APILoginCall {
  static Future<ApiCallResponse> call({
    String? cpf = '',
    String? senha = '',
    dynamic? apiLoginResultadoJson,
  }) {
    final apiLoginResultado = _serializeJson(apiLoginResultadoJson);

    return ApiManager.instance.makeApiCall(
      callName: 'APILogin',
      apiUrl: 'https://condobio.com.br/auth-app-moradores/${cpf}/${senha}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic 259ed248c1e9778036d70cc1458eeb580d60b799ba59d92b0fc50298076f',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
    );
  }

  static dynamic apiLoginResultado(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
