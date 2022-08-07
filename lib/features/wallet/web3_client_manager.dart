import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

class Web3ClientManager {
  static final shared = Web3ClientManager._();

  late Web3Client ethClient;
  late Client _httpClient;

  Web3ClientManager._() {
    _httpClient = Client();
    ethClient = Web3Client(
        "https://mainnet.infura.io/v3/e1a75bc3fdca41a694189e380da53bee",
        _httpClient);
  }
}
