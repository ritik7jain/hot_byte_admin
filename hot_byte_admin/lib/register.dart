import 'package:flutter/material.dart';
import 'package:hot_byte_admin/loading.dart';
import 'constants.dart';
import 'package:hot_byte_admin/signin.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email= '';
  String password='';
  String error='';
  bool loading = false;
    @override
  Widget build(BuildContext context) {
     return loading ? Loading() : Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        elevation: 0.0,
        title: Text("Sign up to Hot Byte",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 23
          ),),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text("Sign In",
             style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20
          ),),
            onPressed: () async{
              widget.toggleView();

            },

          ),
        ],
      ),
      body: Container(
         decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/hot_byte.jpg"),
              // fit: BoxFit.cover,
            )
          ),
        padding: EdgeInsets.symmetric(vertical :20, horizontal:50),
        child:Form(
          key:_formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                validator: (val) => val.isEmpty ? ' Enter an email' : null,
                 decoration: TextInputDecoration.copyWith(hintText:"Email"),
                onChanged: (val){
                  setState(() => email = val);},
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                validator: (val) => val.length<6 ? ' Enter a password longer than 6 character' : null,
                decoration: TextInputDecoration.copyWith(hintText:"Password"),
                obscureText: true,
                onChanged: (val){
                   setState(() => password  = val);
                },
              ),
              SizedBox(height: 20.0,),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 200, 0),
                child: RaisedButton(
                  color: Colors.yellow[700],
                  child: Text(
                    "Register",
                     style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                  ),
                  onPressed: () async{
                    if(_formKey.currentState.validate()){
                        setState(()=>loading = true);
                      dynamic result = await _auth.registerWithEmailPassword(email,password);
                      if(result == null){
                        setState((){
                          error="Please enter correct email";
                          loading=false;
                         } );
                      }
                    }
                    

                  },
                ),
              ),
              SizedBox(height: 20,),
              Text(
                error,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 14.0
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}