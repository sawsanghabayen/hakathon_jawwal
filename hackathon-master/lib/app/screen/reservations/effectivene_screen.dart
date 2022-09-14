/*
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/app_text_field.dart';

class EffectivenessScreen extends StatefulWidget {
  const EffectivenessScreen({Key? key}) : super(key: key);

  @override
  State<EffectivenessScreen> createState() => _EffectivenessScreenState();
}

class _EffectivenessScreenState extends State<EffectivenessScreen> {
  late TextEditingController _forgotEditingController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _forgotEditingController = TextEditingController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _forgotEditingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('اضافة فعالية '),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 81),

         child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
            children: [

            Text(
              'اسم الفعالية ',
              style: GoogleFonts.cairo(),
            ),

            AppTextField(
              hint: '  اسم الفعالية ',
              keyboardType: TextInputType.number,
              controller: _forgotEditingController ,
              focusedBorderColor: Colors.grey,   ),

            Row(
              children: [
                AppTextField(
                  hint: '  اسم الفعالية ',
                  keyboardType: TextInputType.number,
                  controller: _forgotEditingController ,
                  focusedBorderColor: Colors.grey,   ),

                Icon(Icons.add),
              ],
            ),
            Text(
              'اسم الفعالية ',
              style: GoogleFonts.cairo(),
            ),

            Row(
              children: [
                Text('سعر التذكرة '),
                Spacer(),
                Icon(Icons.add),
                Text('10'),
                Icon(Icons.remove),
              ],
            )

          ],
        ),
      ),
    );
  }
}
*/
