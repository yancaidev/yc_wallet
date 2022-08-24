import 'dart:typed_data';

import 'package:web3dart/credentials.dart';
import 'package:web3dart/crypto.dart';

extension WalletExtension on Wallet {
  String get hexKey {
    Uint8List bytes = unsignedIntToBytes(privateKey.privateKeyInt);
    return bytesToHex(bytes);
  }

  String get hexAddress => privateKey.address.hex;
}
