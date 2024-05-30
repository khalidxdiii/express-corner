class OpeningHours {
  bool? openNow;

  OpeningHours({this.openNow});

  factory OpeningHours.fromJson(Map<String, dynamic> json) => OpeningHours(
        openNow: json['open_now'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'open_now': openNow,
      };
}
