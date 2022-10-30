class ScheduleModel {
  String? stadium;
  String? area;
  String? date;
  String? program;
  String? startTime;
  String? endTime;

  ScheduleModel(
      {this.stadium,
        this.area,
        this.date,
        this.program,
        this.startTime,
        this.endTime});

  ScheduleModel.fromJson(Map<String, dynamic> json) {
    stadium = json['stadium'];
    area = json['area'];
    date = json['date'];
    program = json['program'];
    startTime = json['start_time'];
    endTime = json['end_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stadium'] = this.stadium;
    data['area'] = this.area;
    data['date'] = this.date;
    data['program'] = this.program;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    return data;
  }
}
