
class CoinData {
  CoinData({
    required this.time,
    required this.assetIdBase,
    required this.assetIdQuote,
    required this.rate,
  });

  DateTime time;
  String assetIdBase;
  String assetIdQuote;
  double rate;

  factory CoinData.fromJson(Map<String, dynamic> json) => CoinData(
    time: DateTime.parse(json["time"]),
    assetIdBase: json["asset_id_base"],
    assetIdQuote: json["asset_id_quote"],
    rate: json["rate"]?.toDouble(),
  );
}
