import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BmiResult extends StatelessWidget {


   final int age;
   final String ismale ;
   final int result;

   BmiResult({
     required this.age,required this.ismale,required this.result
});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: GestureDetector(
        onTap: (){

        },
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text('Gender : ',
              style: TextStyle(
                fontSize: 25.0,fontWeight: FontWeight.bold
              ),
              ),

              Text('Result : $result',
                style: TextStyle(
                    fontSize: 25.0,fontWeight: FontWeight.bold
                ),
              ),
              Text('Age : $age',
                style: TextStyle(
                    fontSize: 25.0,fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
