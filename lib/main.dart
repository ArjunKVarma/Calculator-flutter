import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main(){
  runApp(
    MaterialApp(
      home: HomeScreen(),
    )
  );
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
      String sum="0",res="0",exp1="";
      double fontsize1=35,fontsize2=80;
  @override
  Widget build(BuildContext context) {
    double h=MediaQuery.of(context).size.height,
        w=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Column(

        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(sum,style: TextStyle(color: Colors.blue,fontSize: fontsize1),),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(res,style: TextStyle(color: Colors.blue,fontSize: fontsize2),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              botton("AC", Colors.white, Color.fromRGBO(145, 25, 25, 0.6),w*0.2),
              botton("%", Colors.black, Color.fromRGBO(250, 244, 244, 0.6),w*0.2),
              botton("÷", Colors.black, Color.fromRGBO(250, 244, 244, 0.6),w*0.2),
              botton("⌫", Colors.white, Color.fromRGBO(199, 146, 32, 0.6),w*0.2),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              botton("7", Colors.black, Color.fromRGBO(250, 244, 244, 0.6),w*0.2),
              botton("8", Colors.black, Color.fromRGBO(250, 244, 244, 0.6),w*0.2),
              botton("9", Colors.black, Color.fromRGBO(250, 244, 244, 0.6),w*0.2),
              botton("+", Colors.white, Color.fromRGBO(199, 146, 32, 0.6),w*0.2),
            ],
          ),Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              botton("4", Colors.black, Color.fromRGBO(250, 244, 244, 0.6),w*0.2),
              botton("5", Colors.black, Color.fromRGBO(250, 244, 244, 0.6),w*0.2),
              botton("6", Colors.black, Color.fromRGBO(250, 244, 244, 0.6),w*0.2),
              botton("-", Colors.white, Color.fromRGBO(199, 146, 32, 0.6),w*0.2),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              botton("1", Colors.black, Color.fromRGBO(250, 244, 244, 0.6),w*0.2),
              botton("2", Colors.black, Color.fromRGBO(250, 244, 244, 0.6),w*0.2),
              botton("3", Colors.black, Color.fromRGBO(250, 244, 244, 0.6),w*0.2),
              botton("×", Colors.white, Color.fromRGBO(199, 146, 32, 0.6),w*0.2),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              botton(".", Colors.black, Color.fromRGBO(250, 244, 244, 0.6),w*0.2),
              botton("0", Colors.black, Color.fromRGBO(250, 244, 244, 0.6),w*0.2),
              botton("=", Colors.white, Color.fromRGBO(199, 146, 32, 1),w*0.45),
            ],
          ),
        ],
      ),
    );
  }
Widget botton(String text,Color fontcolor,Color _color,double w1){
    double h=MediaQuery.of(context).size.height,
    w=MediaQuery.of(context).size.width;
    return InkWell(
      onTap: (){
        if(text=="="){
          try{
            exp1=sum;
              exp1=exp1.replaceAll("×", "*");
              exp1=exp1.replaceAll("÷", "/");
              Parser P=Parser();
              Expression exp2=P.parse(exp1);
              ContextModel con=ContextModel();
              res="${exp2.evaluate(EvaluationType.REAL,con)}";
              setState(() {
              });
          }catch(e){
            res="Error";
            setState(() {
            });
          }
        }else if(text=="AC"){
          sum="0";
          res="0";
          setState(() {

          });
        }else if(text=="⌫"){
          if(sum.length==1){
            sum="0";
            setState(() {
            });
          }else{
            sum=sum.substring(0,sum.length-1);
            setState(() {
            });
          }
        }else{
          if(sum=="0"){
            sum=text;
            setState(() {

            });
          }else{
            sum+=text;
            setState(() {

            });
          }
        }
      },
      child: Container(
        margin: EdgeInsets.only(bottom:15),
        alignment: Alignment.center,
        height: h*0.09,
        width: w1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: _color,
        ),
        child: Text(text,style: TextStyle(color: fontcolor,fontSize: 30),),
      ),
    );
}


}
