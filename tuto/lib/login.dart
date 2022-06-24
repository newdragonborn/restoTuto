import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ShaderMask(
            shaderCallback: (rect) => LinearGradient(

        begin: Alignment.bottomCenter,
        end: Alignment.center,
        colors: [Colors.black,Colors.transparent],
        ).createShader(rect),
          blendMode: BlendMode.darken,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/login.png'),
                fit: BoxFit.cover,
                colorFilter:
                ColorFilter.mode(Colors.black38, BlendMode.darken),
              ),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: ListView(
            children: <Widget>[
              Padding(padding: EdgeInsets.fromLTRB(0, 50, 0, 50),
              child:Center(
                child: Text(
                  'KG AFRIQUE',
                  style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                ),
              ),
              ),
              Padding(
                padding: EdgeInsets.all(6),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(16.0),

                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.email,color: Colors.white),
                      hintText: 'Email :',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,

                  ),

                ),
              ),
              Padding(
                padding: EdgeInsets.all(6),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(16.0),

                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.lock,color: Colors.white),
                      hintText: 'Mot de passe :',
                    ),
                    obscureText: true,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.done,

                  ),

                ),
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Container(
                height: 70,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(16.0),

                ),
                child: FloatingActionButton(
                  onPressed: (){},
                  child: Text("Login"),
                ),
              ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                child: Container(padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(border: Border(
                    bottom: BorderSide(width: 2,
                      color: Colors.white,
                    ),
                  ) ),
                  child: Center(

                    child: Text("Merci!"),
                  ),
                ) ,
              ),





            ],

          ),

        ),
      ],
    );
  }
}
