import 'dart:convert';
import 'package:cme_flutter_assessment/core/utils/helper/shared_preferences_helper.dart';
import 'package:cme_flutter_assessment/core/utils/mixin/logger_mixin.dart';
import 'package:cme_flutter_assessment/src/data/model/graph.dart';

class SharedPreferencesDataManager with LoggerMixin {
  final SharedPreferencesHelper _preferencesHelper = SharedPreferencesHelper();

  Future<void> saveGraphAction(String node, int target, Graph graph) async {
    graph.addEdge(node, target);
    logInfo("Current graph ${graph.getAllNodesData()}");
    String? oldData = _preferencesHelper.getString("sort_actions_graph");
    Map<String, dynamic> updatedGraph = {};
    if (oldData != null) {
      updatedGraph = jsonDecode(oldData.toString());
    }
    logInfo("Old graph $oldData");

    //update entries sequentially
    for (var node in graph.getAllNodesData().entries) {
      if (updatedGraph.containsKey(node.key)) {
        updatedGraph.remove(node.key);
      }
      updatedGraph[node.key] = node.value;
    }
    logInfo("Latest graph $updatedGraph");

    await _preferencesHelper.saveString(
        "sort_actions_graph", jsonEncode(updatedGraph));
  }

  Future<Graph> getGraphActions() async {
    String? graphString = _preferencesHelper.getString("sort_actions_graph");
    logInfo(graphString ?? "");
    if (graphString == null) {
      return Graph({});
    }
    return Graph.graphMap(graphString);
  }
}
