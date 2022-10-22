class AccommodationModel {
  String? location;
  String? buildingNo;
  String? flatNo;
  String? careTakerName;
  String? careTakerContactNo;
  String? empCapacity;

  AccommodationModel(
      {this.location,
        this.buildingNo,
        this.flatNo,
        this.careTakerName,
        this.careTakerContactNo,
        this.empCapacity});

  AccommodationModel.fromJson(Map<String, dynamic> json) {
    location = json['location'];
    buildingNo = json['building_no'];
    flatNo = json['flat_no'];
    careTakerName = json['care_taker_name'];
    careTakerContactNo = json['care_taker_contact_no'];
    empCapacity = json['emp_capacity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['location'] = this.location;
    data['building_no'] = this.buildingNo;
    data['flat_no'] = this.flatNo;
    data['care_taker_name'] = this.careTakerName;
    data['care_taker_contact_no'] = this.careTakerContactNo;
    data['emp_capacity'] = this.empCapacity;
    return data;
  }
}
