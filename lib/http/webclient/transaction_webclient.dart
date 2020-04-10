import 'dart:convert';
import 'package:bytebank/http/webclient.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:http/http.dart';

class TransactionWebClient {
  Future<Transaction> save(Transaction transaction, String password) async {
    final String transactionJson = jsonEncode(transaction.toJson());

    await Future.delayed(Duration(seconds: 2));

    final Response response = await httpClientWithInterceptor.post(baseUr,
        headers: {
          'Content-type': 'application/json',
          'password': password,
        },
        body: transactionJson);

    if (response.statusCode == 200) {
      return Transaction.fromJson(jsonDecode(response.body));
    }

    throw HttpException(_statusCodeResponses[response.statusCode]);
  }

  static final Map<int, String> _statusCodeResponses = {
    400: 'There was an error submitting transaction',
    401: 'Authentication failed',
    409 : 'Transaction already exists'
  };

  Future<List<Transaction>> findAll() async {
    final Response response = await httpClientWithInterceptor.get(baseUr);

    final List<dynamic> decodedJson = jsonDecode(response.body);

    return decodedJson
        .map((dynamic json) => Transaction.fromJson(json))
        .toList();
  }
}

class HttpException implements Exception {
  final String message;

  HttpException(this.message);
}
