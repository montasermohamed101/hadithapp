import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({Key? key}) : super(key: key);

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}
double angle = 0;
int number = 0;
String text ='سبحان الله';
class _SebhaScreenState extends State<SebhaScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              InkWell(
                  onTap: (){
                    setState(() {
                      angle += 5;
                      number++;
                      // text = 'سبحان الله';
                      if (number % 33 == 0) {
                        if (text == 'سبحان الله') {
                          text = 'الحمد لله';
                        } else if (text == 'الحمد لله') {
                          text = 'الله اكبر';
                        } else {
                          text = 'سبحان الله';
                        }
                        number = 0; // Reset the tap count to 0 after each transition
                      }
                    });
                  },
                  child: Transform.rotate(
                      angle: angle * (3.14 / 100),
                      child: Image.asset('assets/sebha.png'))),
              Text('عدد التسبيحات',style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),),
              Container(
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Text('${number}',style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
              ),
              const SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(30)
                ),
                child: Text(text,style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

