
// Model classes for nested structures
class Carrier {
  final String? name;
  final String? mcc;
  final String? mnc;

  Carrier({this.name, this.mcc, this.mnc});

  factory Carrier.fromJson(Map<String, dynamic> json) {
    return Carrier(
      name: json['name'],
      mcc: json['mcc'],
      mnc: json['mnc'],
    );
  }
}

class Company {
  final String domain;
  final String name;
  final String type;

  Company({required this.domain, required this.name, required this.type});

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      domain: json['domain'],
      name: json['name'],
      type: json['type'],
    );
  }
}

class Connection {
  final int asn;
  final String domain;
  final String organization;
  final String route;
  final String type;

  Connection({required this.asn, required this.domain, required this.organization, required this.route, required this.type});

  factory Connection.fromJson(Map<String, dynamic> json) {
    return Connection(
      asn: json['asn'],
      domain: json['domain'],
      organization: json['organization'],
      route: json['route'],
      type: json['type'],
    );
  }
}

class Currency {
  final String code;
  final String name;
  final String nameNative;
  final String plural;
  final String pluralNative;
  final String symbol;
  final String symbolNative;
  final Format format;

  Currency({
    required this.code,
    required this.name,
    required this.nameNative,
    required this.plural,
    required this.pluralNative,
    required this.symbol,
    required this.symbolNative,
    required this.format,
  });

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      code: json['code'],
      name: json['name'],
      nameNative: json['name_native'],
      plural: json['plural'],
      pluralNative: json['plural_native'],
      symbol: json['symbol'],
      symbolNative: json['symbol_native'],
      format: Format.fromJson(json['format']),
    );
  }
}

class Format {
  final String decimalSeparator;
  final String groupSeparator;
  final Negative negative;
  final Positive positive;

  Format({
    required this.decimalSeparator,
    required this.groupSeparator,
    required this.negative,
    required this.positive,
  });

  factory Format.fromJson(Map<String, dynamic> json) {
    return Format(
      decimalSeparator: json['decimal_separator'],
      groupSeparator: json['group_separator'],
      negative: Negative.fromJson(json['negative']),
      positive: Positive.fromJson(json['positive']),
    );
  }
}

class Negative {
  final String prefix;
  final String suffix;

  Negative({required this.prefix, required this.suffix});

  factory Negative.fromJson(Map<String, dynamic> json) {
    return Negative(
      prefix: json['prefix'],
      suffix: json['suffix'],
    );
  }
}

class Positive {
  final String prefix;
  final String suffix;

  Positive({required this.prefix, required this.suffix});

  factory Positive.fromJson(Map<String, dynamic> json) {
    return Positive(
      prefix: json['prefix'],
      suffix: json['suffix'],
    );
  }
}

class Location {
  final String continentCode;
  final String continentName;
  // final Country country;
  // final Region region;
  final String city;
  final String postal;
  final double latitude;
  final double longitude;

  Location({
    required this.continentCode,
    required this.continentName,
    // required this.country,
    // required this.region,
    required this.city,
    required this.postal,
    required this.latitude,
    required this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      continentCode: json['continent']['code'],
      continentName: json['continent']['name'],
      // country: Country.fromJson(json['country']),
      // region: Region.fromJson(json['region']),
      city: json['city'],
      postal: json['postal'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}

class Country {
  final String area;
  final List<String> borders;
  final String callingCode;
  final String capital;
  final String code;
  final String name;
  final int population;
  final double populationDensity;
  final Flag flag;
  final List<Language> languages;
  final String tld;

  Country({
    required this.area,
    required this.borders,
    required this.callingCode,
    required this.capital,
    required this.code,
    required this.name,
    required this.population,
    required this.populationDensity,
    required this.flag,
    required this.languages,
    required this.tld,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      area: json['area'],
      borders: List<String>.from(json['borders']),
      callingCode: json['calling_code'],
      capital: json['capital'],
      code: json['code'],
      name: json['name'],
      population: json['population'],
      populationDensity: json['population_density'],
      flag: Flag.fromJson(json['flag']),
      languages: List<Language>.from(json['languages'].map((x) => Language.fromJson(x))),
      tld: json['tld'],
    );
  }
}

class Flag {
  final String emoji;
  final String emojiUnicode;
  final String emojitwo;
  final String noto;
  final String twemoji;
  final String wikimedia;

  Flag({
    required this.emoji,
    required this.emojiUnicode,
    required this.emojitwo,
    required this.noto,
    required this.twemoji,
    required this.wikimedia,
  });

  factory Flag.fromJson(Map<String, dynamic> json) {
    return Flag(
      emoji: json['emoji'],
      emojiUnicode: json['emoji_unicode'],
      emojitwo: json['emojitwo'],
      noto: json['noto'],
      twemoji: json['twemoji'],
      wikimedia: json['wikimedia'],
    );
  }
}

class Language {
  final String code;
  final String name;
  final String native;

  Language({required this.code, required this.name, required this.native});

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      code: json['code'],
      name: json['name'],
      native: json['native'],
    );
  }
}

class Region {
  final String code;
  final String name;

  Region({required this.code, required this.name});

  factory Region.fromJson(Map<String, dynamic> json) {
    return Region(
      code: json['code'],
      name: json['name'],
    );
  }
}

class Security {
  final bool isAbuser;
  final bool isAttacker;
  final bool isBogon;
  final bool isCloudProvider;
  final bool isProxy;
  final bool isRelay;
  final bool isTor;
  final bool isTorExit;
  final bool isVpn;
  final bool isAnonymous;
  final bool isThreat;

  Security({
    required this.isAbuser,
    required this.isAttacker,
    required this.isBogon,
    required this.isCloudProvider,
    required this.isProxy,
    required this.isRelay,
    required this.isTor,
    required this.isTorExit,
    required this.isVpn,
    required this.isAnonymous,
    required this.isThreat,
  });

  factory Security.fromJson(Map<String, dynamic> json) {
    return Security(
      isAbuser: json['is_abuser'],
      isAttacker: json['is_attacker'],
      isBogon: json['is_bogon'],
      isCloudProvider: json['is_cloud_provider'],
      isProxy: json['is_proxy'],
      isRelay: json['is_relay'],
      isTor: json['is_tor'],
      isTorExit: json['is_tor_exit'],
      isVpn: json['is_vpn'],
      isAnonymous: json['is_anonymous'],
      isThreat: json['is_threat'],
    );
  }
}

class TimeZone {
  final String id;
  final String abbreviation;
  final String currentTime;
  final String name;
  final int offset;
  final bool inDaylightSaving;

  TimeZone({
    required this.id,
    required this.abbreviation,
    required this.currentTime,
    required this.name,
    required this.offset,
    required this.inDaylightSaving,
  });

  factory TimeZone.fromJson(Map<String, dynamic> json) {
    return TimeZone(
      id: json['id'],
      abbreviation: json['abbreviation'],
      currentTime: json['current_time'],
      name: json['name'],
      offset: json['offset'],
      inDaylightSaving: json['in_daylight_saving'],
    );
  }
}

