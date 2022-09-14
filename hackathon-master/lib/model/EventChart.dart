class EventChart {
  late var day;
  late var date;
  late List<EvintData>? evintsDate;

  EventChart({
    required this.date,
    required this.day,
    required this.evintsDate,
  });


}

class EvintData {
  var time;
  var describtion;
  EvintData({
    required this.time,
    required this.describtion,
   });
}
