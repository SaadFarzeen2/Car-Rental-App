class VehicalListModel {
  int? id;
  String? title;
  String? companyName;
  String? description;
  int? kilometer;
  String? capacity;
  int? rateperday;
  List<dynamic>? images;

  VehicalListModel({
    this.id,
    this.title,
    this.companyName,
    this.description,
    this.kilometer,
    this.capacity,
    this.rateperday,
    this.images,
  });

  factory VehicalListModel.fromMap(Map<String, dynamic> map) {
    return VehicalListModel(
      id: map['id'],
      title: map['title'],
      companyName: map['company_name'],
      description: map["description"],
      kilometer: map["kilometer"],
      capacity: map['capacity'].toString(),
      rateperday: map['price_per_day'],
      images: map['vehicle_images'],
    );
  }
}

class VehicleDetailModel {
  int? id;
  String? title;
  String? companyName;
  String? description;
  int? kilometer;
  int? capacity;
  int? rateperday;
  String? gearType;
  List<dynamic>? images;
  BranchModel? branch;

  VehicleDetailModel({
    this.id,
    this.title,
    this.companyName,
    this.description,
    this.kilometer,
    this.capacity,
    this.rateperday,
    this.gearType,
    this.images,
    this.branch,
  });

  factory VehicleDetailModel.fromMap(Map<String, dynamic> map) {
    return VehicleDetailModel(
      id: map['id'],
      title: map['title'],
      companyName: map['company_name'],
      description: map["description"],
      kilometer: map["kilometer"],
      capacity: map['capacity'],
      rateperday: map['price_per_day'],
      images: map['vehicle_images'],
      gearType: map['gear_type'],
      branch: BranchModel.fromMap(map['branch']),
    );
  }
}

class BranchModel {
  final int? id;
  final String? title;
  final String? contactNo;
  final double? lat;
  final double? long;
  final String? sundayStartTime;
  final String? sundayEndTime;
  final String? mondayStartTime;
  final String? mondayEndTime;
  final String? tuesdayStartTime;
  final String? tuesdayEndTime;
  final String? wednesdayStartTime;
  final String? wednesdayEndTime;
  final String? thursdayStartTime;
  final String? thursdayEndTime;
  final String? fridayStartTime;
  final String? fridayEndTime;
  final String? saturdayStartTime;
  final String? saturdayEndTime;

  BranchModel({
    this.id,
    this.title,
    this.contactNo,
    this.lat,
    this.long,
    this.sundayStartTime,
    this.sundayEndTime,
    this.mondayStartTime,
    this.mondayEndTime,
    this.tuesdayStartTime,
    this.tuesdayEndTime,
    this.wednesdayStartTime,
    this.wednesdayEndTime,
    this.thursdayStartTime,
    this.thursdayEndTime,
    this.fridayStartTime,
    this.fridayEndTime,
    this.saturdayStartTime,
    this.saturdayEndTime,
  });

  factory BranchModel.fromMap(Map<String, dynamic> map) {
    return BranchModel(
      id: map['id'],
      title: map['title'],
      contactNo: map['contact_no'],
      lat: map['latitude'].isNotEmpty ? double.parse(map['latitude']) : null,
      long: map['longitude'].isNotEmpty ? double.parse(map['longitude']) : null,
      sundayStartTime: map['sun_start_time'],
      sundayEndTime: map['sun_end_time'],
      mondayStartTime: map['mon_start_time'],
      mondayEndTime: map['mon_end_time'],
      tuesdayStartTime: map['tue_start_time'],
      tuesdayEndTime: map['tue_end_time'],
      wednesdayStartTime: map['wed_start_time'],
      wednesdayEndTime: map['wed_end_time'],
      thursdayStartTime: map['thu_start_time'],
      thursdayEndTime: map['thu_end_time'],
      fridayStartTime: map['fri_start_time'],
      fridayEndTime: map['fri_end_time'],
      saturdayStartTime: map['sat_start_time'],
      saturdayEndTime: map['sat_end_time'],
    );
  }
}
