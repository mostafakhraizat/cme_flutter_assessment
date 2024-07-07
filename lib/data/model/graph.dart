import 'dart:convert';

class Graph {
  final Map<dynamic, dynamic> _graph;
  Graph(this._graph);

  void addNode(dynamic nodeId) {
    if (!_graph.containsKey(nodeId)) {
      _graph[nodeId] = -1;
    }
  }

  void addEdge(dynamic fromNode, dynamic toNode) {
    if (!_graph.containsKey(fromNode)) {
      addNode(fromNode);
    }
    //node only connected to one other node,
    //I don't need to keep track of all reorder actions,
    //only last destination needed
    _graph[fromNode] = toNode;
  }

  Map<dynamic, dynamic> getAllNodesData() {
    return _graph;
  }

  factory Graph.graphMap(String data) => Graph(jsonDecode(data));
}
