import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Home()
  ));
}
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int firstnum;
  late int secondnum;
  late String res='';
  late String texttodisplay='';
  late String operation='';
  late String history='';

  void buttonclick(String buttonvalue){
    // print(buttonvalue);
    if(buttonvalue=='AC'){
      firstnum=0;
      secondnum=0;
      res='';
      texttodisplay='';
      history='';
    }
    else if(buttonvalue=='back'){
      res=texttodisplay.substring(0,texttodisplay.length-1);
    }
    else if(buttonvalue=='+'|| buttonvalue=='-' || buttonvalue=='*' || buttonvalue=='/'){
      firstnum=int.parse(texttodisplay);
      res='';
      operation=buttonvalue;
    }
    else if(buttonvalue=='='){
      secondnum=int.parse(texttodisplay);
      if(operation=='+'){
        res=(firstnum+secondnum).toString();
        history=firstnum.toString()+operation.toString()+secondnum.toString();
      }
      if(operation=='-'){
        res=(firstnum-secondnum).toString();
        history=firstnum.toString()+operation.toString()+secondnum.toString();
      }
      if(operation=='*'){
        res=(firstnum*secondnum).toString();
        history=firstnum.toString()+operation.toString()+secondnum.toString();
      }
      if(operation=='/'){
        res=(firstnum/secondnum).toString();
        history=firstnum.toString()+operation.toString()+secondnum.toString();
      }
    }
    else{
      res=int.parse(texttodisplay+buttonvalue).toString();
    }
    setState(() {
      texttodisplay=res;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              'Calculator',
          style: TextStyle(
              fontFamily: 'Raleway',
            fontSize: 40
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.red[700],
        ),
        body:Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget> [
            Container(
              padding: EdgeInsets.only(right: 35),
              alignment: Alignment(1.0,1.0),
              child: Text(
                history,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(30),
              alignment: Alignment(1.0,1.0),
              child: Text(
                texttodisplay,
                style: TextStyle(
                  fontSize: 48,
                ),
              ),
            ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget> [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [
                Container(
                  margin: EdgeInsets.fromLTRB(5,10,5,10),
                  child: SizedBox(
                    width: 90,
                    height: 40,
                    child: ElevatedButton(onPressed: (){buttonclick('7');},
                      style: ElevatedButton.styleFrom(
                      primary: Colors.amber
                      ),
                      child: Text('7',
                      style: TextStyle(fontFamily: 'Raleway',
                      fontSize: 30,
                      )
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(5,10,5,10),
                  child: SizedBox(
                    width: 90,
                    height: 40,
                    child: ElevatedButton(onPressed: (){buttonclick('8'); },
                      child: Text('8',
                      style: TextStyle(fontFamily: 'Raleway',
                      fontSize: 30
                      )
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(5,10,5,10),
                  child: SizedBox(
                    width: 90,
                    height: 40,
                    child: ElevatedButton(onPressed: (){buttonclick('9'); },
                      child: Text('9',
                          style: TextStyle(fontFamily: 'Raleway',
                              fontSize: 30
                          )
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(5,10,5,10),
                  child: SizedBox(
                    width: 90,
                    height: 40,
                    child: ElevatedButton(onPressed: (){buttonclick('*'); },
                      child: Text('*',
                          style: TextStyle(fontFamily: 'Raleway',
                              fontSize: 30
                          )
                      ),
                    ),
                  ),
                ),
              ],
            ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget> [
                  Container(
                    margin: EdgeInsets.fromLTRB(5,10,5,10),
                    child: SizedBox(
                      width: 90,
                      height: 40,
                      child: ElevatedButton(onPressed: (){buttonclick('4');},
                        style: ElevatedButton.styleFrom(
                            primary: Colors.amber
                        ),
                        child: Text('4',
                            style: TextStyle(fontFamily: 'Raleway',
                              fontSize: 30,
                            )
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5,10,5,10),
                    child: SizedBox(
                      width: 90,
                      height: 40,
                      child: ElevatedButton(onPressed: (){buttonclick('5'); },
                        child: Text('5',
                            style: TextStyle(fontFamily: 'Raleway',
                                fontSize: 30
                            )
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5,10,5,10),
                    child: SizedBox(
                      width: 90,
                      height: 40,
                      child: ElevatedButton(onPressed: (){buttonclick('6'); },
                        child: Text('6',
                            style: TextStyle(fontFamily: 'Raleway',
                                fontSize: 30
                            )
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5,10,5,10),
                    child: SizedBox(
                      width: 90,
                      height: 40,
                      child: ElevatedButton(onPressed: (){buttonclick('+'); },
                        child: Text('+',
                            style: TextStyle(fontFamily: 'Raleway',
                                fontSize: 30
                            )
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget> [
                  Container(
                    margin: EdgeInsets.fromLTRB(5,10,5,10),
                    child: SizedBox(
                      width: 90,
                      height: 40,
                      child: ElevatedButton(onPressed: (){buttonclick('1');},
                        style: ElevatedButton.styleFrom(
                            primary: Colors.amber
                        ),
                        child: Text('1',
                            style: TextStyle(fontFamily: 'Raleway',
                              fontSize: 30,
                            )
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5,10,5,10),
                    child: SizedBox(
                      width: 90,
                      height: 40,
                      child: ElevatedButton(onPressed: (){buttonclick('2'); },
                        child: Text('2',
                            style: TextStyle(fontFamily: 'Raleway',
                                fontSize: 30
                            )
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5,10,5,10),
                    child: SizedBox(
                      width: 90,
                      height: 40,
                      child: ElevatedButton(onPressed: (){buttonclick('3'); },
                        child: Text('3',
                            style: TextStyle(fontFamily: 'Raleway',
                                fontSize: 30
                            )
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5,10,5,10),
                    child: SizedBox(
                      width: 90,
                      height: 40,
                      child: ElevatedButton(onPressed: (){buttonclick('-'); },
                        child: Text('-',
                            style: TextStyle(fontFamily: 'Raleway',
                                fontSize: 30
                            )
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget> [
                  Container(
                    margin: EdgeInsets.fromLTRB(5,10,5,10),
                    child: SizedBox(
                      width: 90,
                      height: 40,
                      child: ElevatedButton(onPressed: (){buttonclick('AC');},
                        style: ElevatedButton.styleFrom(
                            primary: Colors.amber
                        ),
                        child: Text('AC',
                            style: TextStyle(fontFamily: 'Raleway',
                              fontSize: 30,
                            )
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5,10,5,10),
                    child: SizedBox(
                      width: 90,
                      height: 40,
                      child: ElevatedButton(onPressed: (){buttonclick('0'); },
                        child: Text('0',
                            style: TextStyle(fontFamily: 'Raleway',
                                fontSize: 30
                            )
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5,10,5,10),
                    child: SizedBox(
                      width: 90,
                      height: 40,
                      child: ElevatedButton(onPressed: (){buttonclick('='); },
                        child: Text('=',
                            style: TextStyle(fontFamily: 'Raleway',
                                fontSize: 30
                            )
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5,10,5,10),
                    child: SizedBox(
                      width: 90,
                      height: 40,
                      child: ElevatedButton(onPressed: (){buttonclick('/'); },
                        child: Text('/',
                            style: TextStyle(fontFamily: 'Raleway',
                                fontSize: 30
                            )
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(5,10,5,10),
                    child: SizedBox(
                      width: 90,
                      height: 40,
                      child: ElevatedButton(onPressed: (){buttonclick('back'); },
                        child: Icon(
                          Icons.backspace_outlined
                        ),
                      ),
                    ),
                  ),
                    ],
                    )
                    ],
                    ),
          ],
        ),
    );
  }
}