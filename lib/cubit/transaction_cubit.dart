import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_app/service/services.dart';

import '../model/models.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  Future<void> getTransactions() async {
    ApiReturnValue<List<Transaction>> result =
        await TransactionServices.getTransactions();

    if (result.value != null) {
      emit(TransactionLoaded(result.value!));
    } else {
      emit(TransactionLoadingFailed(result.message!));
    }
  }

  Future<void> submitTransactions(Transaction transaction) async {
    ApiReturnValue<List<Transaction>> result =
        await TransactionServices.submitTransactions(transaction);

    if (result.value != null) {
      emit(TransactionLoaded(result.value!));
    } else {
      emit(TransactionLoadingFailed(result.message!));
    }
  }
}
