import 'package:cashcompass_hook/src/accounts/active_account/active_account_factory.dart';
import 'package:cashcompass_hook/src/accounts/active_account/active_account_serializer.dart';
import 'package:cashcompass_hook/src/accounts/active_account/active_account_updater.dart';
import 'package:cashcompass_hook/src/accounts/bookable.dart';
import 'package:cashcompass_hook/src/connector/entity_paths.dart';
import 'package:cashcompass_hook/src/currency/currency.dart';

class ActiveAccount extends RemoteBookable<ActiveAccount,
    ActiveAccountSerializer, ActiveAccountFactory, ActiveAccountUpdater> {
  ActiveAccount(String name, int accountNumber) {
    this.accountNumber = accountNumber;
    this.name = name;
  }

  @override
  Currency close() {
    return getSollAmount() - getHabenAmount();
  }

  @override
  ActiveAccountSerializer getSerialiser() {
    return ActiveAccountSerializer(this);
  }

  @override
  String getPath() {
    return EntityPaths.activeaccount.path;
  }
}
