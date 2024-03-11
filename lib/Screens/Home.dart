import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:provider/provider.dart';
import 'package:social_media/Provider/Auth_provider.dart';
import 'package:social_media/Screens/loginscreen.dart';
import 'package:social_media/constant.dart';


class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
   // final n = Provider.of<Count>(context).num.toString();
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text('My Media',
            style: GoogleFonts.arapey(fontSize: 25, color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.logout_outlined),
            onPressed: () async {
              Auth auth = Auth();
              auth.signOutAndSwitchAccount();
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Login()));
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              vertical120,
              Text('MyApp',
                  style: GoogleFonts.calistoga(fontSize: 20)),
              
            ],
          ),
        ),
      ),
        
      
    ));
  }
}

// class Count with ChangeNotifier {
//   int _num = 0;
//   int get num => _num;
//   void change() {
//     _num++;
//     notifyListeners();
//   }

//   void refresh() {
//     _num = 0;
//     notifyListeners();
//   }
// }
