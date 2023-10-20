// To parse this JSON data, do
//
//     final languageModel = languageModelFromJson(jsonString);

import 'dart:convert';

List<LanguageModel> languageModelFromJson(String str) => List<LanguageModel>.from(json.decode(str).map((x) => LanguageModel.fromJson(x)));

String languageModelToJson(List<LanguageModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LanguageModel {
    String? iso6391;
    String? englishName;
    String? name;

    LanguageModel({
        this.iso6391,
        this.englishName,
        this.name,
    });

    factory LanguageModel.fromJson(Map<String, dynamic> json) => LanguageModel(
        iso6391: json["iso_639_1"],
        englishName: json["english_name"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "iso_639_1": iso6391,
        "english_name": englishName,
        "name": name,
    };
}
