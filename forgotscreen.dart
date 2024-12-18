import 'package:flutter/material.dart';

class Forgotscreen extends StatefulWidget {
  const Forgotscreen({super.key});

  @override
  State<Forgotscreen> createState() => _LoginpageState();
}

class _LoginpageState extends State<Forgotscreen> {
  bool isActive = false;
  var email_text=TextEditingController();
  var pass_text=TextEditingController();
String? email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
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
                        "assets/images/forgotpass.png",
                      ),
                      fit:BoxFit.contain)),
              child: Container(
                  margin: EdgeInsets.only(top: 160, left: 30),
                  child: Text(
                    "Welcome",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent),
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
                          "Forgot Password",
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )
                  //input field
                  ,
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    child: Column(
                      children: [
                        TextField(
                          controller: email_text ,
                            decoration: InputDecoration(
                              
                                labelText: "Email",
                                hintText: "Enter your email",
                                prefixIcon: Icon(Icons.alternate_email),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)))),
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
                                    borderRadius: BorderRadius.circular(10)))),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        //   children: [
                        //     TextButton(
                        //         onPressed: () {
                        //         },
                        //         child: Text(
                        //           "Forgot Password?",
                        //           style: TextStyle(color: Colors.blueAccent),
                        //         )),
                        //   ],
                        // ),
                      
                         Container(
                          margin: EdgeInsets.only(top: 30),
                          width: 230,
                          height: 40,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueAccent,
                                
                              ),
                              onPressed: () {
                                
                                  String name=email_text.text.toString();
                                  String pass=pass_text.text.toString();
                                  print(name);
                                  print(pass);
                                  
                              },
                              child: Text(
                                "Login",
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
          ],
        )
      ],
    ));
  }
}
