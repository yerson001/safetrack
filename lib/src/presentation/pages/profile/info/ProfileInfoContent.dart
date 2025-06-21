import 'package:flutter/material.dart';
import 'package:safetrack/src/domain/models/User.dart';

class ProfileInfoContent extends StatelessWidget {

  final User? user;
  const ProfileInfoContent(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            _headerProfile(context),
            Spacer(),
            _actionProfile("EDITAR PERFIL", Icons.edit,(){
              Navigator.pushNamed(context, 'profile/update',arguments: user);
            }),
            _actionProfile("CERRAR SESIÓN", Icons.settings_power,(){}),
            SizedBox(height: 40),
          ],
        ),
        _cardUserInfo(context)
      ],
    );
  }

  Widget _actionProfile(String opcion, IconData icon,Function() function) {
    return GestureDetector(
      onTap: (){
function();
      },
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: ListTile(
          title: Text(
            opcion,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: Container(
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: const [
                        Color(0xffb51837),
                        Color(0xff661c3a),
                        Color(0xff301939),
                      ]),
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              child: Icon(
                icon,
                color: Colors.white,
              )),
        ),
      ),
    );
  }

  Widget _cardUserInfo(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 100),
      width: MediaQuery.of(context).size.width,
      height: 250,
      child: Card(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20,bottom: 20),
              width: 100,
              child: AspectRatio(
                aspectRatio: 1,
                child: ClipOval(
                  child: user != null  
                  ? FadeInImage.assetNetwork(
                    placeholder: 'assets/img/user_image.png',
                    //image:'https://res.cloudinary.com/du1fmj8le/image/upload/v1732832398/dbgzrshrmofjjtyalkay.jpg',
                    image: user!.image!,
                    fit: BoxFit.cover,
                    fadeInDuration: Duration(seconds: 1),
                  )
                  : Container(),
                ),
              ),
            ),
            Text(
              '${user?.name} ${user?.lastname}' ??'',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
             user?.email??'',
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
            Text(
              user?.phone??'',
              style: TextStyle(fontWeight: FontWeight.normal),
            )
          ],
        ),
      ),
    );
  }

  Widget _headerProfile(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: 40),
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: const [
            Color(0xffb51837),
            Color(0xff661c3a),
            Color(0xff301939),
          ])),
      child: Text(
        "PERFIL DEL USUARIO",
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
