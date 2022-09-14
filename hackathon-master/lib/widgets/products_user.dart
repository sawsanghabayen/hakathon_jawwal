import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class prodect_card extends StatefulWidget {
    prodect_card({
    Key? key,
    required this.imageName,
    required this.title,
    required this.Reservation,
    required this.ticket_available,
      this.tralingicon,
    required this.data,
   }) : super(key: key);
  final String imageName;
  final String title;
  final String Reservation;
  final String ticket_available;
   final IconData? tralingicon;
  final String data;
    bool? obscureText;

  @override
  State<prodect_card> createState() => _prodect_cardState();
}

class _prodect_cardState extends State<prodect_card> {
  bool _notifications = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [

          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            height: 110,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 350, maxHeight: 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bGVuc3xlbnwwfHwwfHw%3D&w=1000&q=80"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 15.sp,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            " حجز ",
                            style:  Theme.of(context).textTheme.headline6?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                              fontSize: 12.sp,
                            ),
                          ),
                          Text(
                            widget.Reservation,
                            style: Theme.of(context).textTheme.headline6?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.blue,
                              fontSize: 13.sp,
                            ),
                          ),
                          Text(
                            " | ",
                            style: Theme.of(context).textTheme.headline6?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                              fontSize: 13.sp,
                            ),
                          ),
                          Text(
                            " تذكرة متبقية ",
                            style:Theme.of(context).textTheme.headline6?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                              fontSize: 12.sp,
                            ),
                          ),
                          Text(
                            widget.ticket_available,
                            style: Theme.of(context).textTheme.headline6?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.red,
                              fontSize: 13.sp,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "تاريخ الفعاليات : " + widget.data,
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                          fontSize: 13.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 60.w,
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [

                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        color: Theme.of(context).cardColor,
                        icon: Icon(
                          Icons.edit,
                        ),
                      ),


                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
