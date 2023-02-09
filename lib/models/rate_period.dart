
// To parse this JSON data, do
//
//     final ratePeriod = ratePeriodFromJson(jsonString);

class RatePeriod {
  RatePeriod({
    required this.periodId,
    required this.lengthSeconds,
    required this.lengthMonths,
    required this.unitCount,
    required this.unitName,
    required this.displayName,
  });

  final String periodId;
  final int lengthSeconds;
  final int lengthMonths;
  final int unitCount;
  final String unitName;
  final String displayName;

  factory RatePeriod.fromJson(dynamic json) => RatePeriod(
    periodId: json["period_id"],
    lengthSeconds: json["length_seconds"],
    lengthMonths: json["length_months"],
    unitCount: json["unit_count"],
    unitName: json["unit_name"],
    displayName: json["display_name"],
  );

  Map<String, dynamic> toJson() => {
    "period_id": periodId,
    "length_seconds": lengthSeconds,
    "length_months": lengthMonths,
    "unit_count": unitCount,
    "unit_name": unitName,
    "display_name": displayName,
  };
}
