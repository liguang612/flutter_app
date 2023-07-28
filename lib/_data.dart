class MyData {
  int? total;
  int? pageSize;
  int? page;
  List<Data>? data;

  MyData({total, this.pageSize, this.page, this.data});

  MyData.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    pageSize = json['pageSize'];
    page = json['page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['total'] = total;
    data['pageSize'] = pageSize;
    data['page'] = page;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? name;
  String? description;
  String? tagColor;
  String? tagAvatar;
  String? createdDate;
  String? lastUpdatedDate;
  int? numberOfCustomers;

  Data({
    this.id,
    this.name,
    this.description,
    this.tagColor,
    this.tagAvatar,
    this.createdDate,
    this.lastUpdatedDate,
    this.numberOfCustomers,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    tagColor = json['tagColor'];
    tagAvatar = json['tagAvatar'];
    createdDate = json['createdDate'];
    lastUpdatedDate = json['lastUpdatedDate'];
    numberOfCustomers = json['numberOfCustomers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['tagColor'] = tagColor;
    data['tagAvatar'] = tagAvatar;
    data['createdDate'] = createdDate;
    data['lastUpdatedDate'] = lastUpdatedDate;
    data['numberOfCustomers'] = numberOfCustomers;
    return data;
  }
}
