
import 'package:equatable/equatable.dart';

class University extends Equatable {
  University({
    this.name,
    this.country,
    this.webPages,
    this.alphaTwoCode,
    this.stateProvince,
    this.domains,
  });

  String? name;
  String? country;
  List<String>? webPages;
  String? alphaTwoCode;
  dynamic stateProvince;
  List<String>? domains;

  factory University.fromJson(Map<String, dynamic> json) => University(
    name: json["name"],
    country: json["country"],
    webPages: List<String>.from(json["web_pages"].map((x) => x)),
    alphaTwoCode: json["alpha_two_code"],
    stateProvince: json["state-province"],
    domains: List<String>.from(json["domains"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "country": country,
    "web_pages": List<dynamic>.from(webPages!.map((x) => x)),
    "alpha_two_code": alphaTwoCode,
    "state-province": stateProvince,
    "domains": List<dynamic>.from(domains!.map((x) => x)),
  };

  @override
  // TODO: implement props
  List<Object?> get props => [
    name,
    country,
    webPages,
    alphaTwoCode,
    stateProvince,
    domains,
  ];
}
