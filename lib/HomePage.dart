import 'package:bmiapp/bmi_result.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  double val=120;
  bool isMale=true;
  var age=18;
  var wieght=40;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        children: [
         Expanded(
           child: Row(
             children: [
               Expanded(
                 child: Padding(
                   padding: const EdgeInsets.only(top: 20,bottom: 20,right: 10,left: 20),
                   child: GestureDetector(
                     onTap: (){
                       setState(() {
                         isMale=true;
                       });
                     },
                     child: Container(

                       decoration:BoxDecoration(
                         borderRadius: BorderRadius.circular(12.0),
                         color:isMale?Colors.blue:Colors.grey[300],
                       ),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Icon(
                             Icons.male_outlined,
                             size: 80.0,
                           ),
                           Text('MALE',
                           style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
                         ],
                       ),
                     ),
                   ),
                 ),
               ),
               Expanded(
                 child: Padding(
                   padding: const EdgeInsets.only(top: 20,bottom: 20,right: 20,left: 10),
                   child: GestureDetector(
                     onTap: (){
                       setState(() {
                         isMale=false;
                       });
                     },
                     child: Container(
                       decoration:BoxDecoration(
                         borderRadius: BorderRadius.circular(12.0),
                         color:!isMale?Colors.blue:Colors.grey[300],
                       ),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Icon(
                             Icons.female_outlined,
                             size: 80.0,
                           ),
                           Text('Female',
                             style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
                         ],
                       ),
                     ),
                   ),
                 ),
               ),
             ],
           ),
         ),
         Expanded(
           child: Padding(
             padding: const EdgeInsets.only(right: 20,left: 20),
             child: Container(
               width: double.infinity,
               decoration:BoxDecoration(
                 borderRadius: BorderRadius.circular(12.0),
                 color: Colors.grey[300],
               ),
               child: Column(

                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                    Text('HIGHT',style: TextStyle(
                       fontSize: 30,fontWeight: FontWeight.bold
                     ),),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.baseline,
                     textBaseline: TextBaseline.alphabetic,
                     children: [
                       Text('${val.round()}',style: TextStyle(
                         fontSize: 40,
                         fontWeight: FontWeight.w900,
                       ),),
                       Text('cm',style: TextStyle(
                         fontSize: 20,
                         fontWeight: FontWeight.w900,
                       ),),
                     ],
                   ),


                   Slider(
                      value: val,
                     onChanged: (value){
                     setState(() {
                       val=value;
                     });
                     },
                     max: 220.0,
                     min: 80.0,

                   ),


                 ],
               ),
             ),
           ),
         ),
         Expanded(
           child: Padding(
             padding: const EdgeInsets.all(0.0),
             child: Container(
                  width: double.infinity,

               child: Row(
                 children: [
                   Expanded(
                     child: Padding(
                       padding: const EdgeInsets.only(top: 20,bottom: 20,right: 10,left: 20),
                       child: Container(
                         decoration:BoxDecoration(
                           borderRadius: BorderRadius.circular(12.0),
                           color: Colors.grey[300],
                         ),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [

                             Text('AGE',style: TextStyle(
                                 fontSize: 30,fontWeight: FontWeight.bold
                             ),),
                             Text('$age',style: TextStyle(
                                 fontSize: 30,fontWeight: FontWeight.bold
                             ),),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [

                                 FloatingActionButton(
                                   onPressed: (){
                                     setState(() {
                                       --age;
                                     });
                                   },
                                   child: Icon(Icons.remove),
                                   mini: true,
                                 ),
                                 FloatingActionButton(onPressed: (){
                                   setState(() {
                                     ++age;
                                   });
                                 },
                                   child: Icon(Icons.add),
                                   mini: true,
                                 )
                               ],
                             )
                           ],
                         ),
                       ),
                     ),
                   ),
                   Expanded(
                     child: Padding(
                       padding: const EdgeInsets.only(top: 20,bottom: 20,right: 20,left: 10),
                       child: Container(
                         decoration:BoxDecoration(
                           borderRadius: BorderRadius.circular(12.0),
                           color: Colors.grey[300],
                         ),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Text('WIEGHT',style: TextStyle(
                                 fontSize: 30,fontWeight: FontWeight.bold
                             ),),
                             Text('$wieght',style: TextStyle(
                                 fontSize: 30,fontWeight: FontWeight.bold
                             ),),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [

                                 FloatingActionButton(onPressed: (){
                                   setState(() {
                                     --wieght;
                                   });
                                 },
                                 child: Icon(Icons.remove),
                                   mini: true,
                                 ),
                                 FloatingActionButton(onPressed: (){
                                   setState(() {
                                     ++wieght;
                                   });
                                 },
                                   child: Icon(Icons.add),
                                   mini: true,
                                 )
                               ],
                             )
                           ],
                         ),
                       ),
                     ),
                   ),
                 ],
               ),

             ),
           ),
         ),
         Container(
           width: double.infinity,
           child: MaterialButton(
             color: Colors.blue,

               onPressed: (){

                double result=wieght/ (val/100);
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context)=>BmiResult(
                          ismale: isMale?'Male':'Female',
                          age: age,
                          result: result.round(),
                        )
                    ),
                );
               },
             child: Text('Calculator',
               style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,
                 color: Colors.white
               ),
             ),
           ),
         )
        ],
      ),
    );
  }
}
