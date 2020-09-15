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
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          height: 0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: <Widget>[
                              Image.asset(
                                'assets/logo1.png',
                                height: 100,
                              ),
                              Container(
                                width: 300,
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(height: 20.0),
                                      TextFormField(
                                        validator: (val) => val.isEmpty
                                            ? ' Enter an email'
                                            : null,
                                        decoration:
                                            TextInputDecoration.copyWith(
                                                hintText: "Email"),
                                        onChanged: (val) {
                                          setState(() => email = val);
                                        },
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      TextFormField(
                                        validator: (val) => val.length < 6
                                            ? ' Enter a password longer than 6 character'
                                            : null,
                                        decoration:
                                            TextInputDecoration.copyWith(
                                                hintText: "Password"),
                                        obscureText: true,
                                        onChanged: (val) {
                                          setState(() => password = val);
                                        },
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Container( 
                                          height: 50,
                                          width: 200,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.lightBlue[100]),
                                              borderRadius:
                                                  BorderRadius.circular(32),
                                              color: Colors.lightBlue[100]),
                                          child: RaisedButton(
                                            color: Colors.redAccent[100],
                                            child: Text(
                                              "Login",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 27,
                                              ),
                                            ),
                                            onPressed: () async {
                                              if (_formKey.currentState
                                                  .validate()) {
                                                setState(() => loading = true);
                                                dynamic result = await _auth
                                                    .signInWithEmailPassword(
                                                        email, password);
                                                if (result == null) {
                                                  setState(() {
                                                    error =
                                                        "Please enter correct credential";
                                                    loading = false;
                                                  });
                                                }
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                      // Padding(
                                      //   padding:
                                      //       const EdgeInsets.fromLTRB(0, 0, 200, 0),
                                      //   child: RaisedButton(
                                      //     color: Colors.yellow[700],
                                      //     child: Text(
                                      //       "Register",
                                      //       style: TextStyle(
                                      //         color: Colors.black,
                                      //         fontWeight: FontWeight.bold,
                                      //         fontSize: 18,
                                      //       ),
                                      //     ),
                                      //     onPressed: () async {
                                      //       if (_formKey.currentState.validate()) {
                                      //         setState(() => loading = true);
                                      //         dynamic result = await _auth
                                      //             .registerWithEmailPassword(
                                      //                 email, password);
                                      //         if (result == null) {
                                      //           setState(() {
                                      //             error =
                                      //                 "Please enter correct email";
                                      //             loading = false;
                                      //           });
                                      //         }
                                      //       }
                                      //     },
                                      //   ),
                                      //),
                                      SizedBox(
                                        height: 0,
                                      ),
                                      Text(
                                        error,
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 14.0),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              // Padding(
                              //   padding: EdgeInsets.only(top: 20),
                              //   child: Container(
                              //     height: 50,
                              //     decoration: BoxDecoration(
                              //         border: Border.all(
                              //             width: 4, color: Colors.lightBlue[100]),
                              //         borderRadius: BorderRadius.circular(32),
                              //         color: Colors.lightBlue[100]),
                              //     child: Padding(
                              //       padding: EdgeInsets.only(left: 10),
                              //       child: TextFormField(
                              //         style: TextStyle(
                              //           fontSize: 15,
                              //           fontFamily: "Big Shoulders Display",
                              //         ),
                              //         decoration: InputDecoration(
                              //             border: InputBorder.none,
                              //             hintText: 'Enter Your Email'),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              // Padding(
                              //   padding: EdgeInsets.only(top: 10),
                              //   child: Container(
                              //     height: 50,
                              //     decoration: BoxDecoration(
                              //         border: Border.all(
                              //             width: 1, color: Colors.lightBlue[100]),
                              //         borderRadius: BorderRadius.circular(32),
                              //         color: Colors.lightBlue[100]),
                              //     child: Padding(
                              //       padding: EdgeInsets.only(left: 10),
                              //       child: TextFormField(
                              //         obscureText: true,
                              //         style: TextStyle(
                              //           fontSize: 15,
                              //           fontFamily: "Big Shoulders Display",
                              //         ),
                              //         decoration: InputDecoration(
                              //           border: InputBorder.none,
                              //           hintText: 'Enter password',
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              // Padding(
                              //   padding: EdgeInsets.only(top: 10),
                              //   child: Container(
                              //     height: 50,
                              //     width: 200,
                              //     decoration: BoxDecoration(
                              //         border: Border.all(
                              //             width: 1, color: Colors.lightBlue[100]),
                              //         borderRadius: BorderRadius.circular(32),
                              //         color: Colors.lightBlue[100]),
                              //     child: RaisedButton(
                              //       color: Colors.redAccent[100],
                              //       child: Text(
                              //         "Login",
                              //         style: TextStyle(
                              //           color: Colors.white,
                              //           fontWeight: FontWeight.bold,
                              //           fontSize: 27,
                              //         ),
                              //       ),
                              //       onPressed: () async {
                              //         if (_formKey.currentState.validate()) {
                              //           setState(() => loading = true);
                              //           dynamic result = await _auth
                              //               .registerWithEmailPassword(email, password);
                              //           if (result == null) {
                              //             setState(() {
                              //               error = "Please enter correct email";
                              //               loading = false;
                              //             });
                              //           }
                              //         }
                              //       },
                              //     ),
                              //   ),
                              // ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        GestureDetector(
                                          onTap: () {},
                                          child: Text(
                                            " Forgot password",
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 200,
                                child: RaisedButton(
                                  color: Colors.redAccent[100],
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        " New User ! SIGN UP",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  onPressed: () async {
                                    if (_formKey.currentState.validate()) {
                                      setState(() => loading = true);
                                      dynamic result =
                                          await _auth.registerWithEmailPassword(
                                              email, password);
                                      if (result == null) {
                                        setState(() {
                                          error = "Please enter correct email";
                                          loading = false;
                                        });
                                      }
                                    }
                                  },
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            left: 10.0, right: 20.0),
                                        child: Divider(
                                          color: Colors.black,
                                          height: 36,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            left: 20.0, right: 10.0),
                                        child: Divider(
                                          color: Colors.black,
                                          height: 36,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            border: Border.all(width: 0.1, color: Colors.grey),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Center(
                              child: Row(children: <Widget>[
                                Text(
                                  '                           Made With ',
                                ),
                                Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                                Text(" By Team Hot Byte")
                              ]),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
