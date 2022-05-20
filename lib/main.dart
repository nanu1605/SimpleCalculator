import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
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
          backgroundColor: Colors.red[900],
        ),
        body: Container(
          //hello
          decoration: new BoxDecoration(color: Colors.black),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget> [
              Container(
                padding: EdgeInsets.only(right: 35),
                alignment: Alignment(1.0,1.0),
                child: Text(
                  history,
                  style: TextStyle(
                    fontSize: 24,color: Colors.white
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(25),
                alignment: Alignment(1.0,1.0),
                child: Text(
                  texttodisplay,
                  style: TextStyle(
                    fontSize: 48,
                    color: Colors.white
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
                    child: ElevatedButton(onPressed: (){buttonclick('7');},
                        style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(25),
                            primary: Colors.blue
                        ),
                        child: Text('7',
                        style: TextStyle(fontFamily: 'Raleway',
                        fontSize: 30,
                        )
                        ),
                      ),
                    ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5,10,5,10),
                    child: ElevatedButton(onPressed: (){buttonclick('8');},
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(25),
                      ),
                        child: Text('8',
                        style: TextStyle(fontFamily: 'Raleway',
                        fontSize: 30
                        )
                        ),
                      ),
                    ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5,10,5,10),
                    child: ElevatedButton(onPressed: (){buttonclick('9'); },
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(25),
                      ),
                        child: Text('9',
                            style: TextStyle(fontFamily: 'Raleway',
                                fontSize: 30
                            )
                        ),
                      ),
                    ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5,10,5,10),
                    child: ElevatedButton(onPressed: (){buttonclick('*'); },
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(25),
                        primary: Colors.amber
                      ),
                        child: Text('*',
                            style: TextStyle(fontFamily: 'Raleway',
                                fontSize: 30
                            )
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
                      child: ElevatedButton(onPressed: (){buttonclick('4');},
                          style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(25),
                              primary: Colors.blue
                          ),
                          child: Text('4',
                              style: TextStyle(fontFamily: 'Raleway',
                                fontSize: 30,
                              )
                          ),
                        ),
                      ),
                    Container(
                      margin: EdgeInsets.fromLTRB(5,10,5,10),
                      child: ElevatedButton(onPressed: (){buttonclick('5'); },
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(25),
                        ),
                          child: Text('5',
                              style: TextStyle(fontFamily: 'Raleway',
                                  fontSize: 30
                              )
                          ),
                        ),
                      ),
                    Container(
                      margin: EdgeInsets.fromLTRB(5,10,5,10),
                      child: ElevatedButton(onPressed: (){buttonclick('6'); },
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(25),
                        ),
                          child: Text('6',
                              style: TextStyle(fontFamily: 'Raleway',
                                  fontSize: 30
                              )
                          ),
                        ),
                      ),
                    Container(
                      margin: EdgeInsets.fromLTRB(5,10,5,10),
                      child: ElevatedButton(onPressed: (){buttonclick('+'); },
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(25),
                            primary: Colors.amber
                        ),
                          child: Text('+',
                              style: TextStyle(fontFamily: 'Raleway',
                                  fontSize: 30
                              )
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
                      child: ElevatedButton(onPressed: (){buttonclick('1');},
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(25),
                        ),
                          child: Text('1',
                              style: TextStyle(fontFamily: 'Raleway',
                                fontSize: 30,
                              )
                          ),
                        ),
                      ),
                    Container(
                      margin: EdgeInsets.fromLTRB(5,10,5,10),
                      child: ElevatedButton(onPressed: (){buttonclick('2'); },
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(25),
                        ),
                          child: Text('2',
                              style: TextStyle(fontFamily: 'Raleway',
                                  fontSize: 30
                              )
                          ),
                        ),
                      ),
                    Container(
                      margin: EdgeInsets.fromLTRB(5,10,5,10),
                      child: ElevatedButton(onPressed: (){buttonclick('3'); },
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(25),
                        ),
                          child: Text('3',
                              style: TextStyle(fontFamily: 'Raleway',
                                  fontSize: 30
                              )
                          ),
                        ),
                      ),
                    Container(
                      margin: EdgeInsets.fromLTRB(5,10,5,10),
                      child: ElevatedButton(onPressed: (){buttonclick('-'); },
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(25),
                          primary: Colors.amber
                        ),
                          child: Text('-',
                              style: TextStyle(fontFamily: 'Raleway',
                                  fontSize: 30
                              )
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
                      height: 90,
                      child: ElevatedButton(onPressed: (){buttonclick('AC');},
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(15),
                          primary: Colors.orange[800]
                        ),
                          child: Text('AC',
                              style: TextStyle(fontFamily: 'Raleway',
                                fontSize: 30,
                              )
                          ),
                        ),
                      ),
                    Container(
                      margin: EdgeInsets.fromLTRB(5,10,5,10),
                      child: ElevatedButton(onPressed: (){buttonclick('0'); },
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(25),
                        ),
                          child: Text('0',
                              style: TextStyle(fontFamily: 'Raleway',
                                  fontSize: 30
                              )
                          ),
                        ),
                      ),
                    Container(
                      margin: EdgeInsets.fromLTRB(5,10,5,10),
                      child: ElevatedButton(onPressed: (){buttonclick('='); },
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(25),
                          primary: Colors.green
                        ),
                          child: Text('=',
                              style: TextStyle(fontFamily: 'Raleway',
                                  fontSize: 30
                              )
                          ),
                        ),
                      ),
                    Container(
                      margin: EdgeInsets.fromLTRB(5,10,5,10),
                      child: ElevatedButton(onPressed: (){buttonclick('/'); },
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(25),
                          primary: Colors.amber
                        ),
                          child: Text('/',
                              style: TextStyle(fontFamily: 'Raleway',
                                  fontSize: 30
                              )
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
                      child: ElevatedButton(onPressed: (){buttonclick('back'); },
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(25),
                          primary: Colors.red[700]
                        ),
                          child: Icon(
                            Icons.backspace_outlined
                          ),
                        ),
                    ),
                  ],
                )
              ],
            ),
            ],
          ),
        ),
    );
  }
}