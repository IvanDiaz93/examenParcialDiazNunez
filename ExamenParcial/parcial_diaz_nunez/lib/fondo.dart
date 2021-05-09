import 'package:flutter/material.dart';

class Fondo extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Examen Parcial',
      home: 
      Container(
         child: Column(
           children: [
             Row(
               children:[
                 Container(
                    width: _width,
                    height: _height * 0.3,
                    decoration: BoxDecoration(
                       gradient: LinearGradient(
                         colors: [Colors.pink[700],Colors.purple[700]],
                         stops: [0.1,0.6],
                         begin: FractionalOffset.topCenter,
                         end: FractionalOffset.bottomCenter
                         ),  
                     ),
                     child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                          children: [                           
                              Container(      
                              margin: EdgeInsets.only(bottom: 5),
                              width: _width * 0.50,
                              height: _height * 0.15,             
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                //color: Colors.purple[700],
                                image: DecorationImage(
                                  fit: BoxFit.scaleDown,
                                  image: NetworkImage('assets/user_female.png'),                     
                                )                      
                              ),                                
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Material(
                                  child: Text('Lacey Fernandez  ',style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
                                  color: Colors.purple[700],                              
                                  ),
                                Icon(Icons.edit_outlined, color: Colors.white,)
                              ],
                            )
                          ],
                     ), 
                                 
                 ),                 
               ],               
             ),    
             Row(
               children: [
                 Container(
                   width: _width,
                   height: _height * 0.7,
                   color: Colors.grey[300],
                 ),                 
               ], 
            ),        
           ],
         ),
      ),
    );
  }
}