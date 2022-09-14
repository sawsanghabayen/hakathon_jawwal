import 'package:hackathon_project/model/EventChart.dart';

class FaliaModel {

  String id;
  String name;
  String companyName;
  String type;
  int ticketPrice;
  int numberOfTickets;
  String aboutCompany;
  String faliaDescrebtion;
  String location;


  late List<EventChart>? eventchart;
  late List<dynamic>? imagesUrl;

  FaliaModel({
    required this.name,
    required this.id,
    required this.companyName,
    required this.ticketPrice,
    required this.type,
    required this.numberOfTickets,
    required this.aboutCompany,
    required this.faliaDescrebtion,
    required this.location,
    required this.eventchart,
    required this.imagesUrl,
  });


}