
import 'package:flutter/material.dart';
import 'package:flutter_tasks_hk/HomePage.dart';
import 'package:flutter_tasks_hk/RagisterPage.dart';
import 'package:flutter_tasks_hk/forgotscreen.dart';
// import 'package:shared_preferences/shared_preferences.';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});


  @override
  State<Loginpage> createState() => _LoginpageState();
}


class _LoginpageState extends State<Loginpage> {
  
  static const String KEYVALUE="email";
  bool isActive = false;
  var email_text = TextEditingController();
  var pass_text = TextEditingController();

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    getUserValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
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
                            "assets/images/loginImage2.jpg",
                          ),
                          fit: BoxFit.contain)),
                  child: Container(
                      margin: EdgeInsets.only(top: 160, left: 30),
                      child: Text(
                        "Welcome\nBack",
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
                              "Login",
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 25,
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Forgotscreen()));
                                    },
                                    child: Text(
                                      "Forgot Password?",
                                      style:
                                          TextStyle(color: Colors.blueAccent),
                                    )),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 30),
                              width: 400,
                              height: 40,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueAccent,
                                  ),
                                  onPressed: () async {
                                    var email = email_text.text.toString();
                                    var pass = pass_text.text.toString();
                  //  var prefsEmail =  await SharedPreferences.getInstance();
                  //  var prefsPass=await SharedPreferences.getInstance();
                  //  prefsEmail.setString('email', email);
                  //  prefsPass.setString('pass',pass);
                   print(email);
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
                Container(
                  width: 400,
                  height: 40,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 235, 224, 224)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.g_mobiledata),
                      Text(
                        "Login with Google",
                        style: TextStyle(
                            color: Colors.black87, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.arrow_right))
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("New to Logistics?"),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Registerpage()));
                        },
                        child: Text(
                          "Register",
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
      ),
    ));
  }
  
  void getUserValue() async {



  // var prefsE = await SharedPreferences.getInstance();
  // var prefsP =await SharedPreferences.getInstance();

  // var isLoggedIn=prefsE.getString('email');

  // // var getprefsE = prefsE.getString(KEYVALUE);
  // var getprefsP=prefsP.getString("pass");
  
 


  }}