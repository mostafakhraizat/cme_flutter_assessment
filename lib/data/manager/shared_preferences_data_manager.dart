import 'dart:convert';
import 'package:cme_flutter_assessment/core/utils/helper/shared_preferences_helper.dart';
import 'package:cme_flutter_assessment/core/utils/mixin/logger_mixin.dart';
import 'package:cme_flutter_assessment/data/model/graph.dart';

class SharedPreferencesDataManager with LoggerMixin {
  final SharedPreferencesHelper _preferencesHelper = SharedPreferencesHelper();

  Future<void> saveGraphAction(String node, int target, Graph graph) async {
    graph.addEdge(node, target);
    await _preferencesHelper.saveString(
        "sort_actions_graph", jsonEncode(graph.getAllNodesData()));
  }

  Future<Graph> getGraphActions() async {
    String? graphString = _preferencesHelper.getString("sort_actions_graph");
    logInfo(graphString ?? "");
    if (graphString == null) {
      return Graph({});
    }
    return Graph.graphMap(graphString);
    // await _preferencesHelper.saveString("sort_actions_graph", graph);
  }
}
