import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_tasks_hk/forgotscreen.dart';
import 'package:flutter_tasks_hk/login.dart';
 import 'package:http/http.dart' as http ; 
 import 'cofig.dart';
class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Registerpage> {
  bool isActive = false;
  var email_text = TextEditingController();
  var pass_text = TextEditingController();
  var name_text = TextEditingController();
  String? email;
  bool _isNotValidate=false;
  void registerUser()async{
    if(email_text.text.isNotEmpty&& pass_text.text.isNotEmpty&& name_text.text.isNotEmpty ){
    
    setState(() {
      _isNotValidate=false;
    });
    var regbody={
   "email":email_text.text,
   "password":pass_text.text,
   "name":name_text.text
 
    };
  
  try {
    var response=await http.post(Uri.parse(registration),
    headers: {'Content-Type':'application/json'},
    body: jsonEncode(regbody),
    
    );
    if(response.statusCode==200|| response.statusCode==201){
      var jsonResponse=jsonDecode(response.body);
      print(jsonResponse);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Registration Successful!')),);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginpage()));
    }else{
      print(response.body);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed:${response.body}')),
      );
    }
  }catch(error){
    print(error);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error occurred:$error')),);
  }
 

    }else{
      setState(() {
        _isNotValidate=true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 250,
                decoration: BoxDecoration(
                    // border: Border.all(color: Colors.red),
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/images/ragisterpage.png",
                        ),
                        fit: BoxFit.contain)),
                child: Container(
                    margin: EdgeInsets.only(top: 160, left: 30),
                    child: Text(
                      "Welcome to \nLogistics",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    )),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Register",
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )
                    //input field
                    ,
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      child: Column(
                        children: [
                          TextField(
                            
                              controller: name_text,
                              decoration: InputDecoration(
                                filled: true,
                                  labelText: "UserName",
                                  hintText: "Enter your Name",
                                  errorText: _isNotValidate?"Enter valid Name":null ,
                                  prefixIcon: Icon(Icons.person),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10)))),
                          SizedBox(
                            height: 30,
                          ),
                          TextField(
                              controller: email_text,
                              decoration: InputDecoration(
                                  labelText: "Email",
                                  hintText: "Enter your email",
                                  prefixIcon: Icon(Icons.alternate_email),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10)))),
                          SizedBox(
                            height: 30,
                          ),
                          TextField(
                              controller: pass_text,
                              obscureText: !isActive,
                              decoration: InputDecoration(
                                  labelText: "Password",
                                  hintText: "Enter your password",
                                  prefixIcon: Icon(Icons.lock),
                                  suffixIcon: IconButton(
                                    icon: Icon(isActive
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                    onPressed: () {
                                      setState(() {
                                        isActive = !isActive;
                                      });
                                    },
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10)))),
                          Container(
                            margin: EdgeInsets.only(top: 30),
                            width: 400,
                            height: 40,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueAccent,
                                ),
                                onPressed: () {
          registerUser();
                                   
                                  String email = email_text.text.toString();
                                  String name = name_text.text.toString();
                                  String pass = pass_text.text.toString();
                                  print(name);
                                  print(pass);
                                  print(email);
                                },
                                child: Text(
                                  "Register",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                )),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )

              //or
              ,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "OR",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Logistics User?"),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: 4,
                  )
                ],
              )
            ],
          )
        ],
      ),
    ));
  }
}
