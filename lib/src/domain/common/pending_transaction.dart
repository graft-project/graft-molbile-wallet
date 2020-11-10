import 'package:flutter/foundation.dart';
import 'package:oxen_coin/transaction_history.dart' as transaction_history;
import 'package:oxen_coin/structs/pending_transaction.dart';
import 'package:oxen_wallet/src/domain/oxen/oxen_amount_format.dart';

class PendingTransaction {
  PendingTransaction(
      {@required this.amount, @required this.fee, @required this.hash});

  PendingTransaction.fromTransactionDescription(
      PendingTransactionDescription transactionDescription)
      : amount = oxenAmountToString(amount: transactionDescription.amount),
        fee = oxenAmountToString(amount: transactionDescription.fee),
        hash = transactionDescription.hash,
        _pointerAddress = transactionDescription.pointerAddress;

  final String amount;
  final String fee;
  final String hash;

  int _pointerAddress;

  Future<void> commit() async => transaction_history
      .commitTransactionFromPointerAddress(address: _pointerAddress);
}
