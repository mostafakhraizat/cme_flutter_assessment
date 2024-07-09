import 'dart:convert';

import 'package:cme_flutter_assessment/core/utils/mixin/logger_mixin.dart';

class Graph with LoggerMixin {
  final Map<String, dynamic> _graph;
  Graph(this._graph);

  void addEdge(String fromNode, dynamic toNode) {
    //record all actions in sequence
    //i dont wanna update, i wanna keep correct sequence,
    // remove the existing action, and add to the end
    if (_graph.containsKey(fromNode)) {
      _graph.remove(fromNode);
    }
    _graph.addAll({fromNode: toNode});
  }

  Map<String, dynamic> getAllNodesData() {
    return _graph;
  }

  factory Graph.graphMap(String data) => Graph(jsonDecode(data));
}
