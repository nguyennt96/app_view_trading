import 'package:app_view_trading/view/home/model/crypto.dart';

abstract class ICryptoDataSource {
  const ICryptoDataSource();
  Future<List<Crypto>> fetchData();
}
