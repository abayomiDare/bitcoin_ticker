import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = '64459657-10D3-454C-BB30-7C465B6A08CC';
const baseUrl = 'https://rest.coinapi.io/v1/exchangerate';

class ExchangeRate {
  ExchangeRate({required this.coin, required this.currency});
  String coin;
  String currency;

  Future getExchangeRate() async {
    Uri url = Uri.parse('$baseUrl/BTC/USD?apikey=$apiKey');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return response.statusCode;
    }
  }
}
