import 'package:flutter/material.dart';
import 'package:flutter_tasks_hk/AddProduct.dart';
import 'package:flutter_tasks_hk/login.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

List<String> productName=['KeyBord','Iphone','Ipnone2','laptop','laptop2','headphone','eyerphone','','','','','','','','',];
List <String> productImage=[
  'assets/images/charger.jpg',
  'assets/images/eyerbird.jpg',
  'assets/images/headphone.jpg',
  'assets/images/iPhone.jpg',
  'assets/images/iphone2.jpg',
'assets/images/keyboard.jpg',
'assets/images/laptop2.jpg',
'assets/images/leptop.jpg',
'assets/images/s-pen_bord.jpg',
'assets/images/s-pen.jpg',
'assets/images/samsung.jpg',
'assets/images/samsung2.jpg',
'assets/images/screens.jpg',
'assets/images/sunglasse.jpg',
'assets/images/tablet.jpg',



];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,

      ),
drawer: Drawer(
  child: Container(
    color: Colors.blueGrey[100],
    child: ListView(
      children: [
        UserAccountsDrawerHeader(accountName: Text("Kunal"), accountEmail: Text("Kunal@1314") 
        ,currentAccountPicture: CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(Icons.person,color: Colors.blue,),
        ),
        ),
        ListTile(
          title: Text("Home"),
          leading: Icon(Icons.home),
          onTap: (){
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: Text('Add Product'),
          leading:Icon(Icons.add) ,
          onTap:(){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddProduct())
            );
     
     

          } ,
        ),
        ListTile(
          title: Text('settings'),
          leading: Icon(Icons.settings),
          onTap: (){
            Navigator.pop(context);
          },

        ),
        Divider(),
     
     ListTile(
      title: Text('Logout'),
      leading: Icon(Icons.exit_to_app),
      onTap:(){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Loginpage()));
      } ,
     )

      ],
    ),
  )
),
body: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 8.0,mainAxisSpacing: 8.0,childAspectRatio: 0.8), itemBuilder: (context,index){
  return Card(
    elevation: 5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0)
    ),
    child: InkWell(onTap: (){},
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Column(children: [
        Image.network(productImage[index],
      fit: BoxFit.cover,
      width: 200,
      height: 200,
      ),
       Padding(
         padding: const EdgeInsets.only(top: 30),
         child: Text(productName[index],style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold ),),
       )
      ],)
    ) ,
    ),
  );
},itemCount: productImage.length ,),


    );
  }
}