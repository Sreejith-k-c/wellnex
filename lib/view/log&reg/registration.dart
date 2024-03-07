import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:wellnex/database/hive_database/hivedb.dart';
import 'package:wellnex/view/log&reg/login.dart';
import 'package:wellnex/models/hiveModel/user_model.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final name_ctrl=TextEditingController();
  final phone_ctrl=TextEditingController();
  final email_ctrl=TextEditingController();
  final pass_crtl=TextEditingController();
  final cpass_crtl=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShaderMask(
        shaderCallback: (bounds) => LinearGradient(
          colors: [Colors.black, Colors.black12],
          begin: Alignment.bottomCenter,
          end: Alignment.center,
        ).createShader(bounds),
        blendMode: BlendMode.darken,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image:
                  AssetImage("assets/edgar-chaparro-sHfo3WOgGTU-unsplash.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black45,
                BlendMode.darken,
              ),
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Register here",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: name_ctrl,
                      decoration: InputDecoration(
                        hintText: "Name",
                        hintStyle: TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.4),
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(10.0),
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: phone_ctrl,
                      decoration: InputDecoration(
                        hintText: "Phone Number",
                        hintStyle: TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.4),
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(10.0),
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: email_ctrl,
                      decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.4),
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(10.0),
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: pass_crtl,
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.4),
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(10.0),
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller:cpass_crtl,
                      decoration: InputDecoration(
                        hintText: "Confirm Password",
                        hintStyle: TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.4),
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(10.0),
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  InkWell(
                    onTap: () async{
                      final userlist=await HiveDb.instance.getUser();
                      validateSignUp(context,userlist);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 60,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text("Register",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,fontWeight: FontWeight.bold
                          ),),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validateSignUp(BuildContext context, List<User> userlist) async {
    final uname = email_ctrl.text.trim();
    final pwd = pass_crtl.text.trim();
    bool userFound = false;
    final validateEmail = EmailValidator.validate(uname);
    if(uname != "" && pwd != "") {
      if (validateEmail == true) {
        await Future.forEach(userlist, (singleUser) {
          if (singleUser.email == uname) {
            userFound = true;
          } else {
            userFound = false;
          }
        });
        if (userFound == true) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("User Already Exist!!")));
        } else {
          final validatePassword = validatePassWord(context, pwd);
          if (validatePassword == true) {
            final user = User(email: uname, password: pwd);
            await HiveDb.instance.addUser(user); // user added to hive db
            
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("User Registration Success")));
                Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => LoginPage()));
          }
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Enter a Valid Email!!!")));
      }
    }else{
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Field Must Not be Empty!!!")));
    }
  }
  
  validatePassWord(BuildContext context, String pwd) {
    if (pwd.length <6){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Password length should be > 6 !!"))
      );
      return false;
    }else{
      return true;
    }
  }
}