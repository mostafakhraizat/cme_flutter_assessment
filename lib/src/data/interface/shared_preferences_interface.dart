import 'package:cme_flutter_assessment/src/data/model/graph.dart';

abstract interface class SharedPreferencesInterface {
  Future<void> saveGraphAction(String node, int target, Graph graph);
  Future<Graph> getGraphActions();
}
