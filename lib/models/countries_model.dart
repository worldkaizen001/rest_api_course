

class Countries {
  Countries({
    required this.name,
    required this.tld,
    required this.cca2,
    required this.ccn3,
    required this.cca3,
    required this.cioc,
    required this.independent,
    required this.status,
    required this.unMember,
    required this.currencies,
    required this.idd,
    required this.capital,
    required this.altSpellings,
    required this.region,
    required this.subregion,
    required this.languages,
    required this.translations,
    required this.latlng,
    required this.landlocked,
    required this.area,
    required this.flag,
    required this.demonyms,
  });

  final Name name;
  final List<String> tld;
  final String cca2;
  final String ccn3;
  final String cca3;
  final String cioc;
  final bool independent;
  final String status;
  final bool unMember;
  final Currencies currencies;
  final Idd idd;
  final List<String> capital;
  final List<String> altSpellings;
  final String region;
  final String subregion;
  final Languages languages;
  final Map<String, Translation> translations;
  final List<int> latlng;
  final bool landlocked;
  final int area;
  final String flag;
  final Demonyms demonyms;

  factory Countries.fromJson(dynamic  json) => Countries(
    name: Name.fromJson(json["name"]),
    tld: List<String>.from(json["tld"].map((x) => x)),
    cca2: json["cca2"],
    ccn3: json["ccn3"],
    cca3: json["cca3"],
    cioc: json["cioc"],
    independent: json["independent"],
    status: json["status"],
    unMember: json["unMember"],
    currencies: Currencies.fromJson(json["currencies"]),
    idd: Idd.fromJson(json["idd"]),
    capital: List<String>.from(json["capital"].map((x) => x)),
    altSpellings: List<String>.from(json["altSpellings"].map((x) => x)),
    region: json["region"],
    subregion: json["subregion"],
    languages: Languages.fromJson(json["languages"]),
    translations: Map.from(json["translations"]).map((k, v) => MapEntry<String, Translation>(k, Translation.fromJson(v))),
    latlng: List<int>.from(json["latlng"].map((x) => x)),
    landlocked: json["landlocked"],
    area: json["area"],
    flag: json["flag"],
    demonyms: Demonyms.fromJson(json["demonyms"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name.toJson(),
    "tld": List<dynamic>.from(tld.map((x) => x)),
    "cca2": cca2,
    "ccn3": ccn3,
    "cca3": cca3,
    "cioc": cioc,
    "independent": independent,
    "status": status,
    "unMember": unMember,
    "currencies": currencies.toJson(),
    "idd": idd.toJson(),
    "capital": List<dynamic>.from(capital.map((x) => x)),
    "altSpellings": List<dynamic>.from(altSpellings.map((x) => x)),
    "region": region,
    "subregion": subregion,
    "languages": languages.toJson(),
    "translations": Map.from(translations).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    "latlng": List<dynamic>.from(latlng.map((x) => x)),
    "landlocked": landlocked,
    "area": area,
    "flag": flag,
    "demonyms": demonyms.toJson(),
  };
}

class Currencies {
  Currencies({
    required this.jpy,
  });

  final Jpy jpy;

  factory Currencies.fromJson(Map<String, dynamic> json) => Currencies(
    jpy: Jpy.fromJson(json["JPY"]),
  );

  Map<String, dynamic> toJson() => {
    "JPY": jpy.toJson(),
  };
}

class Jpy {
  Jpy({
    required this.name,
    required this.symbol,
  });

  final String name;
  final String symbol;

  factory Jpy.fromJson(Map<String, dynamic> json) => Jpy(
    name: json["name"],
    symbol: json["symbol"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "symbol": symbol,
  };
}

class Demonyms {
  Demonyms({
    required this.eng,
    required this.fra,
  });

  final Eng eng;
  final Eng fra;

  factory Demonyms.fromJson(Map<String, dynamic> json) => Demonyms(
    eng: Eng.fromJson(json["eng"]),
    fra: Eng.fromJson(json["fra"]),
  );

  Map<String, dynamic> toJson() => {
    "eng": eng.toJson(),
    "fra": fra.toJson(),
  };
}

class Eng {
  Eng({
    required this.f,
    required this.m,
  });

  final String f;
  final String m;

  factory Eng.fromJson(Map<String, dynamic> json) => Eng(
    f: json["f"],
    m: json["m"],
  );

  Map<String, dynamic> toJson() => {
    "f": f,
    "m": m,
  };
}

class Idd {
  Idd({
    required this.root,
    required this.suffixes,
  });

  final String root;
  final List<String> suffixes;

  factory Idd.fromJson(Map<String, dynamic> json) => Idd(
    root: json["root"],
    suffixes: List<String>.from(json["suffixes"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "root": root,
    "suffixes": List<dynamic>.from(suffixes.map((x) => x)),
  };
}

class Languages {
  Languages({
    required this.jpn,
  });

  final String jpn;

  factory Languages.fromJson(Map<String, dynamic> json) => Languages(
    jpn: json["jpn"],
  );

  Map<String, dynamic> toJson() => {
    "jpn": jpn,
  };
}

class Name {
  Name({
    required this.common,
    required this.official,
    required this.nativeName,
  });

  final String common;
  final String official;
  final NativeName nativeName;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
    common: json["common"],
    official: json["official"],
    nativeName: NativeName.fromJson(json["nativeName"]),
  );

  Map<String, dynamic> toJson() => {
    "common": common,
    "official": official,
    "nativeName": nativeName.toJson(),
  };
}

class NativeName {
  NativeName({
    required this.jpn,
  });

  final Translation jpn;

  factory NativeName.fromJson(Map<String, dynamic> json) => NativeName(
    jpn: Translation.fromJson(json["jpn"]),
  );

  Map<String, dynamic> toJson() => {
    "jpn": jpn.toJson(),
  };
}

class Translation {
  Translation({
    required this.official,
    required this.common,
  });

  final String official;
  final String common;

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
    official: json["official"],
    common: json["common"],
  );

  Map<String, dynamic> toJson() => {
    "official": official,
    "common": common,
  };
}
