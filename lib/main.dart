import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double firstNumber;
  double secondNumber;
  String texttodispaly;
  String result;
  String operatortoperform;
  bottonClick(String bottonValue) {
    if (bottonValue == "AC") {
      firstNumber = 0;
      secondNumber = 0;
      texttodispaly = "";
      result = "";
      operatortoperform = "";
    }
     else if (bottonValue == ".") 
      {
        if(result.contains("."))
        {
          print("Already have a decimal");
          return;
        }
        else
        {
          result=result+bottonValue;
        }
      }
    else if(bottonValue=="◀")
    {
      if(texttodispaly.isNotEmpty)
      {
       result=texttodispaly.substring(0,result.length-1);
      }
      else
      {
        return;
      }
    }
    else if (bottonValue == "+" ||
             bottonValue == "-" || 
             bottonValue == "x" || 
             bottonValue == "/" || 
             bottonValue == "%" ) 
             try {
               
                firstNumber = double.parse(texttodispaly);
                result = "";
                operatortoperform = bottonValue; 
             } catch (e) {
               print("Please Enter First Number");
             }
    else if (bottonValue == "=") 
    {
      try {
        secondNumber = double.parse(texttodispaly);
        
      } catch (e) {
        print(e);
      }
      
      if (operatortoperform == "+") 
        {
          result = (firstNumber + secondNumber).toString();
        } 
      else if (operatortoperform == "-") 
        {
          result = (firstNumber - secondNumber).toString();
        } 
        else if (operatortoperform == "x") 
        {
            result = (firstNumber * secondNumber).toString();
        } 
        else if (operatortoperform == "/") 
        {
           result = ((firstNumber / secondNumber).toStringAsFixed(2)).toString();
        }
         else if (operatortoperform == "%") 
         {
            result = ((firstNumber % secondNumber).toStringAsFixed(2)).toString();
         }      
    }
    else //if user press any number value
      {
        result = int.parse(texttodispaly + bottonValue).toString();
      }

    setState(() 
        {
          texttodispaly = result;
        }
    );
  }

  Widget customBotton(String bottonValue,textcolor) {
    return Expanded(
      child: MaterialButton(
        elevation: 20.0,
        hoverElevation: 50.0,
        splashColor: Colors.teal,
        highlightColor: Colors.red,
        padding: EdgeInsets.all(20),
        onPressed: () => bottonClick(bottonValue),
        textColor:textcolor,
        child: Text(
          "$bottonValue",
          style: TextStyle(
            fontSize:30,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: "Calculator",
        home: Scaffold(
          appBar: AppBar(
            title: Text("Calculator",
            style: TextStyle(
              color: Colors.deepOrange,
            ),
            ),
            backgroundColor: Colors.white,
          ),
          body: Container(
            child: Column(
            //  mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    alignment: Alignment.bottomRight, 
                        child: Text(
                          "$firstNumber $operatortoperform $secondNumber\n= $texttodispaly",
                          style: TextStyle(
                              fontSize: 38.0,
                              fontWeight: FontWeight.bold,
                              ),
                        ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    customBotton("AC",Colors.deepOrangeAccent),
                    customBotton("◀",Colors.deepOrangeAccent),
                    customBotton("%",Colors.deepOrangeAccent),
                    customBotton("/",Colors.deepOrangeAccent),
                  ],
                ),
                Row(
                  children: <Widget>[
                    customBotton("7",Colors.black),
                    customBotton("8",Colors.black),
                    customBotton("9",Colors.black),
                    customBotton("x",Colors.deepOrangeAccent),
                  ],
                ),
                Row(
                  children: <Widget>[
                    customBotton("4",Colors.black),
                    customBotton("5",Colors.black),
                    customBotton("6",Colors.black),
                    customBotton("-",Colors.deepOrangeAccent),
                  ],
                ),
                Row(
                  children: <Widget>[
                    customBotton("1",Colors.black),
                    customBotton("2",Colors.black),
                    customBotton("3",Colors.black),
                    customBotton("+",Colors.deepOrangeAccent),
                  ],
                ),
                Row(
                  children: <Widget>[
                 //   customBotton("C"),
                    customBotton(".",Colors.black),
                    customBotton("0",Colors.black),
                    customBotton("=",Colors.deepOrangeAccent),
                  ],
                ),
              ],
            ),
          ),
        )
      );
  }
}
