import 'package:flutter/material.dart';

 
class Formulario extends StatefulWidget {
  @override
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  bool _checkedM = false;
  bool _checkedF = false;
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return MaterialApp(      
      debugShowCheckedModeBanner: false,
      title: 'Examen Parcial',
      home: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          Container(
            width: _width * 0.9,
            height: _height * 0.75,
            color: Colors.white,
            child: ListView(
              padding: EdgeInsets.all(20),
              children: [
                Material(
                    child: Text("USER PROFILE",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                    textAlign: TextAlign.center,
                    ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Material(child: Text("User name",style: TextStyle(color: Colors.purple[700], fontWeight: FontWeight.bold, fontSize: 12))),
                Padding(padding: EdgeInsets.all(5)),
                Material(child: CajaTexto(hint:"Enter User Name",tipo:1)),
                Padding(padding: EdgeInsets.all(10)),
                Material(child: Text("Email Id",style: TextStyle(color: Colors.purple[700], fontWeight: FontWeight.bold, fontSize: 12))),
                Padding(padding: EdgeInsets.all(5)),
                Material(child: CajaTexto(hint:"Enter Email",tipo:2)),
                Padding(padding: EdgeInsets.all(10)),
                Material(child: Text("Mobile Number",style: TextStyle(color: Colors.purple[700], fontWeight: FontWeight.bold, fontSize: 12))),
                Padding(padding: EdgeInsets.all(5)),
                Material(child: CajaTexto(hint:"Enter your ID digit mobile number",tipo:3)),
                Padding(padding: EdgeInsets.all(10)),
                Material(child: Text("Date of Birth",style: TextStyle(color: Colors.purple[700], fontWeight: FontWeight.bold, fontSize: 12))),
                Padding(padding: EdgeInsets.all(5)),
                Material(child: CajaTexto(hint:"DD / MM / YYYY",tipo:4)),
                Padding(padding: EdgeInsets.all(5)),
                Material(
                  child: Row(
                    children: [
                      Expanded(child: Column(
                        children: [
                          CheckboxListTile(
                            title: Text("Male"),
                            controlAffinity: ListTileControlAffinity.platform,
                            value: _checkedM,
                            onChanged: (bool value){
                              setState(() {
                                _checkedF = _checkedM;
                                _checkedM = value;
                              });
                            },
                            activeColor: Colors.purple[700],
                            checkColor: Colors.white,
                          )
                        ],
                      ),),
                      Expanded(child: Column(
                        children: [
                           CheckboxListTile(
                            title: Text("Female"),
                            controlAffinity: ListTileControlAffinity.platform,
                            value: _checkedF,
                            onChanged: (bool value){
                              setState(() {
                                _checkedM = _checkedF;
                                _checkedF = value;
                              });
                            },
                            activeColor: Colors.purple[700],
                            checkColor: Colors.white,
                          )
                        ],
                      ),)
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.all(5)),
                Material(child: Row(children: [Expanded(child: BotonSave(),)],))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BotonSave extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    return Column(
    children: [
      Container(  
        padding: EdgeInsets.symmetric(horizontal: 180,vertical: 10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pink[700],Colors.purple[700]],
            stops: [0.1,0.6],
            begin: FractionalOffset.centerLeft,
            end: FractionalOffset.centerRight
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text('SAVE',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),),
          
      )
    ],
   );
  }
}

class CajaTexto extends StatefulWidget {
  final String hint;
  final int tipo;
  const CajaTexto({this.hint,this.tipo}) ;

  @override
  _CajaTextoState createState() => _CajaTextoState();
}

class _CajaTextoState extends State<CajaTexto> {
  String _fecha = '';
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if(widget.tipo == 1){
      return TextField(
        keyboardType: TextInputType.text ,
        decoration: InputDecoration(    
          prefixIcon: Icon(Icons.account_circle, color: Colors.purple[700]),     
          hintText: widget.hint,                       
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25)
          )
        ),
      );
    }
    else if(widget.tipo == 2){
      return TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(    
          prefixIcon: Icon(Icons.email_sharp, color: Colors.purple[700]),     
          hintText: widget.hint,                       
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25)
          )
        ),
      );
    }
    else if(widget.tipo == 3){
      return TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(    
          prefixIcon: Icon(Icons.mobile_friendly_outlined, color: Colors.purple[700]),  
          hintText: widget.hint,                       
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25)
          )
        ),
      );
    }
    else{
      return TextField(
        controller: _textEditingController,
        enableInteractiveSelection: false,
        focusNode: FocusNode(),
        decoration: InputDecoration(    
          prefixIcon: Icon(Icons.calendar_today_outlined, color: Colors.purple[700]),
          hintText: widget.hint,                       
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25)
          )
        ),
      onTap: (){
        FocusScope.of(context).requestFocus(FocusNode());
        setState(() {});
          _selectDate(context);
        },
      );
    }
  }
  void _selectDate(BuildContext context) async{
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2022),
      initialDate: DateTime.now()
    );

    if(date != null){
      setState(() {
        String _dia = date.day.toString();
        String _mes = date.month.toString();
        String _anio = date.year.toString();
        _fecha = _dia + " / " + _mes +  " / " + _anio;
        _textEditingController.text = _fecha;
      });
    }

  }
}