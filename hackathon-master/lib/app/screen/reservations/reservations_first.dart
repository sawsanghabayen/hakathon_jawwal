import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReservationsFirstScreen extends StatefulWidget {
  const ReservationsFirstScreen({Key? key}) : super(key: key);

  @override
  State<ReservationsFirstScreen> createState() => _State();
}

class _State extends State<ReservationsFirstScreen> {
  @override
  DateTime dateStart = DateTime(2022, 9, 12);
  DateTime dateEnd = DateTime(2022, 9, 12);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'اسم الفعالية ',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'أضف اسم الفعالية',
                ),
              ),
              Text(
                'الراعي الرسمي ',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'اضف اسم الراعي الرسمي',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                     'سعر التذكرة العادية',
                  ),
                ),
              ),

              Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                  'سعر التذكرة الخاصة',
                  ),
                ),
              ),

              //  '${date.year}/${date.month}/${date.day}'

              Row(
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: dateStart,
                            firstDate: DateTime(2022),
                            lastDate: DateTime(2023));
                        if (newDate == null) return;
                        setState(() {
                          dateStart = newDate;
                        });
                      },
                      child: Text('تاريخ البدء')),
                  SizedBox(
                    width: 30,
                  ),
                  Text('${dateStart.year}/${dateStart.month}/${dateStart.day}')
                ],
              ),

              Row(
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: dateEnd,
                            firstDate: DateTime(2022),
                            lastDate: DateTime(2023));
                        if (newDate == null) return;
                        setState(() {
                          dateEnd = newDate;
                        });
                      },
                      child: Text('تاريخ الانتهاء')),
                  SizedBox(
                    width: 30,
                  ),
                  Text('${dateEnd.year}/${dateEnd.month}/${dateEnd.day}')
                ],
              ),

              Text(
                'التحذيرات ',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'اكتب التحذيرات',
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
