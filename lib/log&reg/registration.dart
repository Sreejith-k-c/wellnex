import 'package:flutter/material.dart';
import 'package:wellnex/log&reg/login.dart';

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
                    onTap: (){
                      if (name_ctrl.text.isEmpty ||
                          phone_ctrl.text.isEmpty ||
                          email_ctrl.text.isEmpty ||
                          pass_crtl.text.isEmpty ||
                          cpass_crtl.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Please fill all fields")),
                        );
                      }else if (pass_crtl.text != cpass_crtl.text){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Password do not match"))
                        );
                      }else{
                          Navigator.push(context,
                       MaterialPageRoute(
                        builder: (context)=>LoginPage()));
                      }
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
}