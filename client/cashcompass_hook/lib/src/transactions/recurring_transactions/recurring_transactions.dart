import 'package:cashcompass_hook/src/accounts/bookable.dart';
import 'package:cashcompass_hook/src/connector/entity_paths.dart';
import 'package:cashcompass_hook/src/currency/currency.dart';
import 'package:cashcompass_hook/src/data_storage/database_object.dart';
import 'package:cashcompass_hook/src/intervals/interval.dart';
import 'package:cashcompass_hook/src/transactions/recurring_transactions/recurring_transactions_factory.dart';
import 'package:cashcompass_hook/src/transactions/recurring_transactions/recurring_transactions_serializer.dart';
import 'package:cashcompass_hook/src/transactions/recurring_transactions/recurring_transactions_updater.dart';

class RecurringTransactions
    with
        DatabaseObject<RecurringTransactions, RecurringTransactionsSerializer,
            RecurringTransactionsFactory, RecurringTransactionsUpdater> {
  late double _amount;
  late DateTime _startDate, _endDate;
  late Interval _interval;
  late Bookable _sollAccount;
  late Bookable _habenAccount;

  Currency get amount => _amount;
  DateTime get startDate => _startDate;
  DateTime get endDate => _endDate;
  Bookable get soll => _sollAccount;
  Bookable get haben => _habenAccount;
  Interval get interval => _interval;
  RecurringTransactions(
      {required amount,
      required DateTime startDate,
      required DateTime endDate,
      required Interval interval,
      required Bookable soll,
      required Bookable haben}) {
    _amount = amount;
    _startDate = startDate;
    _endDate = endDate;
    _sollAccount = soll;
    _habenAccount = haben;
    _interval = interval;
  }

  @override
  RecurringTransactionsSerializer getSerialiser() {
    return RecurringTransactionsSerializer(this);
  }

  @override
  String getPath() {
    return EntityPaths.recurringtransations.path;
  }
}
