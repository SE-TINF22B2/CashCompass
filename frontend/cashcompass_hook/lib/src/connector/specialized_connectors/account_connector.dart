import 'package:cashcompass_hook/src/connector/specialized_connectors/connector_spez.dart';
import 'package:cashcompass_hook/src/dtos/account_dto.dart';

mixin AccountConnector implements ConnectorSpez {
  Future<String> changeCategoryColor(AccountDTO account, String colorCode);
  Future<String> changeAccountName(AccountDTO account, String newName);
}