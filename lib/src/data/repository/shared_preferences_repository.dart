import 'package:cme_flutter_assessment/src/data/manager/shared_preferences_data_manager.dart';
import 'package:cme_flutter_assessment/src/data/model/graph.dart';

class SharedPreferencesRepository {
  final SharedPreferencesDataManager _sharedPreferencesDataManager =
      SharedPreferencesDataManager();

  Future<void> saveGraphAction(String node, int target, Graph graph) async =>
      await _sharedPreferencesDataManager.saveGraphAction(node, target, graph);
  Future<Graph> getGraphActions() async =>
      await _sharedPreferencesDataManager.getGraphActions();
}
