import 'package:flutter/material.dart';

class LoginContent extends StatelessWidget {
  const LoginContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.blue,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, //horizaontal
            mainAxisAlignment: MainAxisAlignment.center, // vertical
            children: [
              RotatedBox(
                quarterTurns: 1,
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              RotatedBox(
                quarterTurns: 1,
                child: Text(
                  "Registro",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              )
            ],
          ),
        ),
        //second screen
        Container(
          //height: MediaQuery.of(context).size.height * 0.95,
          margin: EdgeInsets.only(left: 60, bottom: 60),
          decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  bottomLeft: Radius.circular(35))),
          child: Container(
            margin: EdgeInsets.only(top: 0, bottom: 0, left: 25, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  "WELCOME",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "back ...",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    'assets/img/car.png',
                    width: 200,
                    height: 200,
                  ),
                ),
                Text(
                  "Log in",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      label: Text("Email"), prefixIcon: Icon(Icons.email)),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      label: Text("Password"), prefixIcon: Icon(Icons.key)),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 30),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    child: Text("Iniciar Sesion"),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
