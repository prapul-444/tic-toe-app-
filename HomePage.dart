import 'dart:io';


import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
bool isCross=true;
String message="";
List<String> gamestate=["empty","empty","empty","empty","empty","empty","empty","empty","empty"];

 
AssetImage edit=AssetImage("images/edit.png");
AssetImage cross=AssetImage("images/cross.png");
AssetImage circle=AssetImage("images/circle.png");

play(int index){

if(this.gamestate[index]=="empty"){
  setState(() {
   if(this.isCross==true){
     this.gamestate[index]="cross";
     this.isCross=false;
   } else{
     this.gamestate[index]="circle";
     this.isCross=true;
   }
   this.checkWin();
   
     });
   }
   }
   void initstate(){
     super.initState();
     setState(() {
      this.gamestate=["empty","empty","empty","empty","empty","empty","empty","empty","empty"]; 
      this.message="";
     });
   }
   reset(){
    Future.delayed(const Duration(milliseconds:1000),(){
 setState(() {
      //  sleep(const Duration(seconds:3));
      this.gamestate=["empty","empty","empty","empty","empty","empty","empty","empty","empty"]; 
      this.message="";
     });
   
    });
   }
   
   AssetImage getImage(String value){
   
   switch (value) {
     case "empty" :
          return edit;  
       break;
       case "circle" :
          return circle;  
       break;
       case "cross" :
          return cross;  
       break;
   }
      
   }
   checkWin(){
     if((gamestate[0]!='empty')&&(gamestate[0]==gamestate[1])&&(gamestate[1]==gamestate[2])){
       setState(() {
        this.message='${this.gamestate[0]}wins';
        this.reset();
     });
     }
      if((gamestate[3]!='empty')&&(gamestate[3]==gamestate[4])&&(gamestate[3]==gamestate[5])){
        this.message='${this.gamestate[3]}wins' ;
       
     }
 if((gamestate[6]!='empty')&&(gamestate[6]==gamestate[7])&&(gamestate[7]==gamestate[8])){
        this.message='${this.gamestate[6]}wins' ;
       
     }

 if((gamestate[0]!='empty')&&(gamestate[0]==gamestate[3])&&(gamestate[3]==gamestate[6])){
        this.message='${this.gamestate[0]}wins' ;
       
     }
 if((gamestate[1]!='empty')&&(gamestate[1]==gamestate[4])&&(gamestate[4]==gamestate[7])){
        this.message='${this.gamestate[1]}wins' ;
       
     }
      if((gamestate[2]!='empty')&&(gamestate[2]==gamestate[5])&&(gamestate[5]==gamestate[8])){
        this.message='${this.gamestate[2]}wins' ;
       
     }


 if((gamestate[0]!='empty')&&(gamestate[0]==gamestate[4])&&(gamestate[4]==gamestate[8])){
        this.message='${this.gamestate[0]}wins' ;
       
     }
 if((gamestate[2]!='empty')&&(gamestate[2]==gamestate[4])&&(gamestate[4]==gamestate[6])){
        this.message='${this.gamestate[2]}wins' ;
       
     }


      if(!gamestate.contains('empty')){
        setState(() {
         this.message='game drawn'; 
        });
      }

    }
   
     @override
     Widget build(BuildContext context) {
       return Scaffold(
         appBar: AppBar(
           title: Text('tic_tac_toe'),
         ),
         body: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: <Widget>[
             Expanded(
               child: GridView.builder(
                 padding: EdgeInsets.all(5.0),
                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 3,
                   childAspectRatio: 1.0,
                   mainAxisSpacing: 10.0,
                   crossAxisSpacing: 10.0
                 ),
                 itemCount: this.gamestate.length,
                 itemBuilder: (context,i)=>SizedBox(
                   width: 100.0,
                   height: 100.0,
                   child: MaterialButton(
                     onPressed:(){
                       this.play(i);
                     },
                     child:Image(
                       image: this.getImage(this.gamestate[i]),
                     ),
                     
                   ),
                 ),
               ),
             ),
           Container(
             padding: EdgeInsets.all(10.0),
             child: Text(this.message,style:TextStyle(fontSize: 20.0)),
           ),
           MaterialButton(
             child: Text('click here to reset the game'),
             color: Colors.green,
             splashColor: Colors.blue,
             onPressed: (){
               this.reset();
             },
            shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)
            )
           )
             
           ],

         ),
       );
     }
   
}