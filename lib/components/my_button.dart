import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
final Color? color;
final void Function()? onTap;
final String? message;
const MyButton({super.key, required this.message , required this.color, required this.onTap});


//This requires 3 parameters namely message to be displayed, color , and OnTap() function of the button
@override
Widget build(BuildContext context) 
{
  return GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(8)
      ), // BoxDecoration
    padding: const EdgeInsets.all(25),
    child:  Center(child: Text(message!)),
    ), 
  );
}
}

/* sample:
ThemeToggleButton(
  message: Tap this Button,
  color: Theme.of(context).colorScheme.secondary,
  onTap: () {
    Provider.of<ThemeProvider>(context,listen: false).toggleTheme();
    }
  }
)
                                    */