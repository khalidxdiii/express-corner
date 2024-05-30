class Open {
  String? date;
  int? day;
  String? time;
  bool? truncated;

  Open({this.date, this.day, this.time, this.truncated});

  factory Open.fromJson(Map<String, dynamic> json) => Open(
        date: json['date'] as String?,
        day: json['day'] as int?,
        time: json['time'] as String?,
        truncated: json['truncated'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'date': date,
        'day': day,
        'time': time,
        'truncated': truncated,
      };
}
