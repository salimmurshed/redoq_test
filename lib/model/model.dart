class Model {
  List<ModelData>? data;

  Model({this.data});

  Model.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ModelData>[];
      json['data'].forEach((v) {
        data!.add(ModelData.fromJson(v));
      });
    }
  }
}

class ModelData {
  int? id;
  String? name;
  int? age;
  List<ModelData>? data;

  ModelData({this.id, this.name, this.age, this.data});

  ModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    age = json['age'];
    if (json['data'] != null) {
      data = <ModelData>[];
      json['data'].forEach((v) {
        data!.add(ModelData.fromJson(v));
      });
    }
  }
}
