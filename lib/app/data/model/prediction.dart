// To parse this JSON data, do
//
//     final predictModel = predictModelFromJson(jsonString);

import 'dart:convert';

PredictModel predictModelFromJson(String str) =>
    PredictModel.fromJson(json.decode(str));

String predictModelToJson(PredictModel data) => json.encode(data.toJson());

class PredictModel {
  List<List<dynamic>>? categoryResultsList;
  List<String>? finalDecisions;

  PredictModel({
    this.categoryResultsList,
    this.finalDecisions,
  });

  factory PredictModel.fromJson(Map<String, dynamic> json) => PredictModel(
        categoryResultsList: json["category_results_list"] == null
            ? []
            : List<List<dynamic>>.from(json["category_results_list"]!
                .map((x) => List<dynamic>.from(x.map((x) => x)))),
        finalDecisions: json["final_decisions"] == null
            ? []
            : List<String>.from(json["final_decisions"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "category_results_list": categoryResultsList == null
            ? []
            : List<dynamic>.from(categoryResultsList!
                .map((x) => List<dynamic>.from(x.map((x) => x)))),
        "final_decisions": finalDecisions == null
            ? []
            : List<dynamic>.from(finalDecisions!.map((x) => x)),
      };
}
