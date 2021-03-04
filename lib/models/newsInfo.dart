// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.casesTimeSeries,
    this.statewise,
    this.tested,
  });

  List<CasesTimeSery> casesTimeSeries;
  List<Statewise> statewise;
  List<Tested> tested;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        casesTimeSeries: List<CasesTimeSery>.from(
            json["cases_time_series"].map((x) => CasesTimeSery.fromJson(x))),
        statewise: List<Statewise>.from(
            json["statewise"].map((x) => Statewise.fromJson(x))),
        tested:
            List<Tested>.from(json["tested"].map((x) => Tested.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "cases_time_series":
            List<dynamic>.from(casesTimeSeries.map((x) => x.toJson())),
        "statewise": List<dynamic>.from(statewise.map((x) => x.toJson())),
        "tested": List<dynamic>.from(tested.map((x) => x.toJson())),
      };
}

class CasesTimeSery {
  CasesTimeSery({
    this.dailyconfirmed,
    this.dailydeceased,
    this.dailyrecovered,
    this.date,
    this.dateymd,
    this.totalconfirmed,
    this.totaldeceased,
    this.totalrecovered,
  });

  String dailyconfirmed;
  String dailydeceased;
  String dailyrecovered;
  String date;
  DateTime dateymd;
  String totalconfirmed;
  String totaldeceased;
  String totalrecovered;

  factory CasesTimeSery.fromJson(Map<String, dynamic> json) => CasesTimeSery(
        dailyconfirmed: json["dailyconfirmed"],
        dailydeceased: json["dailydeceased"],
        dailyrecovered: json["dailyrecovered"],
        date: json["date"],
        dateymd: DateTime.parse(json["dateymd"]),
        totalconfirmed: json["totalconfirmed"],
        totaldeceased: json["totaldeceased"],
        totalrecovered: json["totalrecovered"],
      );

  Map<String, dynamic> toJson() => {
        "dailyconfirmed": dailyconfirmed,
        "dailydeceased": dailydeceased,
        "dailyrecovered": dailyrecovered,
        "date": date,
        "dateymd":
            "${dateymd.year.toString().padLeft(4, '0')}-${dateymd.month.toString().padLeft(2, '0')}-${dateymd.day.toString().padLeft(2, '0')}",
        "totalconfirmed": totalconfirmed,
        "totaldeceased": totaldeceased,
        "totalrecovered": totalrecovered,
      };
}

class Statewise {
  Statewise({
    this.active,
    this.confirmed,
    this.deaths,
    this.deltaconfirmed,
    this.deltadeaths,
    this.deltarecovered,
    this.lastupdatedtime,
    this.migratedother,
    this.recovered,
    this.state,
    this.statecode,
    this.statenotes,
  });

  String active;
  String confirmed;
  String deaths;
  String deltaconfirmed;
  String deltadeaths;
  String deltarecovered;
  String lastupdatedtime;
  String migratedother;
  String recovered;
  String state;
  String statecode;
  String statenotes;

  factory Statewise.fromJson(Map<String, dynamic> json) => Statewise(
        active: json["active"],
        confirmed: json["confirmed"],
        deaths: json["deaths"],
        deltaconfirmed: json["deltaconfirmed"],
        deltadeaths: json["deltadeaths"],
        deltarecovered: json["deltarecovered"],
        lastupdatedtime: json["lastupdatedtime"],
        migratedother: json["migratedother"],
        recovered: json["recovered"],
        state: json["state"],
        statecode: json["statecode"],
        statenotes: json["statenotes"],
      );

  Map<String, dynamic> toJson() => {
        "active": active,
        "confirmed": confirmed,
        "deaths": deaths,
        "deltaconfirmed": deltaconfirmed,
        "deltadeaths": deltadeaths,
        "deltarecovered": deltarecovered,
        "lastupdatedtime": lastupdatedtime,
        "migratedother": migratedother,
        "recovered": recovered,
        "state": state,
        "statecode": statecode,
        "statenotes": statenotes,
      };
}

class Tested {
  Tested({
    this.dailyrtpcrsamplescollectedicmrapplication,
    this.individualstestedperconfirmedcase,
    this.positivecasesfromsamplesreported,
    this.samplereportedtoday,
    this.source,
    this.source1,
    this.source3,
    this.testedasof,
    this.testpositivitylast7Days,
    this.testpositivityrate,
    this.testsconductedbyprivatelabs,
    this.testsperconfirmedcase,
    this.testspermillion,
    this.totalindividualstested,
    this.totalpositivecases,
    this.totalrtpcrsamplescollectedicmrapplication,
    this.totalsamplestested,
    this.updatetimestamp,
  });

  String dailyrtpcrsamplescollectedicmrapplication;
  String individualstestedperconfirmedcase;
  String positivecasesfromsamplesreported;
  String samplereportedtoday;
  String source;
  String source1;
  String source3;
  String testedasof;
  String testpositivitylast7Days;
  String testpositivityrate;
  String testsconductedbyprivatelabs;
  String testsperconfirmedcase;
  String testspermillion;
  String totalindividualstested;
  String totalpositivecases;
  String totalrtpcrsamplescollectedicmrapplication;
  String totalsamplestested;
  String updatetimestamp;

  factory Tested.fromJson(Map<String, dynamic> json) => Tested(
        dailyrtpcrsamplescollectedicmrapplication:
            json["dailyrtpcrsamplescollectedicmrapplication"],
        individualstestedperconfirmedcase:
            json["individualstestedperconfirmedcase"],
        positivecasesfromsamplesreported:
            json["positivecasesfromsamplesreported"],
        samplereportedtoday: json["samplereportedtoday"],
        source: json["source"],
        source1: json["source1"],
        source3: json["source3"],
        testedasof: json["testedasof"],
        testpositivitylast7Days: json["testpositivitylast7days"],
        testpositivityrate: json["testpositivityrate"],
        testsconductedbyprivatelabs: json["testsconductedbyprivatelabs"],
        testsperconfirmedcase: json["testsperconfirmedcase"],
        testspermillion: json["testspermillion"],
        totalindividualstested: json["totalindividualstested"],
        totalpositivecases: json["totalpositivecases"],
        totalrtpcrsamplescollectedicmrapplication:
            json["totalrtpcrsamplescollectedicmrapplication"],
        totalsamplestested: json["totalsamplestested"],
        updatetimestamp: json["updatetimestamp"],
      );

  Map<String, dynamic> toJson() => {
        "dailyrtpcrsamplescollectedicmrapplication":
            dailyrtpcrsamplescollectedicmrapplication,
        "individualstestedperconfirmedcase": individualstestedperconfirmedcase,
        "positivecasesfromsamplesreported": positivecasesfromsamplesreported,
        "samplereportedtoday": samplereportedtoday,
        "source": source,
        "source1": source1,
        "source3": source3,
        "testedasof": testedasof,
        "testpositivitylast7days": testpositivitylast7Days,
        "testpositivityrate": testpositivityrate,
        "testsconductedbyprivatelabs": testsconductedbyprivatelabs,
        "testsperconfirmedcase": testsperconfirmedcase,
        "testspermillion": testspermillion,
        "totalindividualstested": totalindividualstested,
        "totalpositivecases": totalpositivecases,
        "totalrtpcrsamplescollectedicmrapplication":
            totalrtpcrsamplescollectedicmrapplication,
        "totalsamplestested": totalsamplestested,
        "updatetimestamp": updatetimestamp,
      };
}
