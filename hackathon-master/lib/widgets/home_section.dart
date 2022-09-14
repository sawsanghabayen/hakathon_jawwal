import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({
    required this.title,
    required this.onPressed,

    Key? key,
  }) : super(key: key);
 final String title;
 final void Function() onPressed;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline3
        ),
        Spacer(),
        TextButton(
           // onPressed: () {},
            onPressed: onPressed,
            child: Text(
             'See All',
              style: Theme.of(context).textTheme.bodyText2,
            ))
      ],
    );
  }
}
