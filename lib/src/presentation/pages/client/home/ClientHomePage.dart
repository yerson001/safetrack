import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safetrack/main.dart';
import 'package:safetrack/src/presentation/pages/client/home/bloc/ClientHomeBloc.dart';
import 'package:safetrack/src/presentation/pages/client/home/bloc/ClientHomeEvent.dart';
import 'package:safetrack/src/presentation/pages/client/home/bloc/ClientHomeState.dart';
import 'package:safetrack/src/presentation/pages/client/mapSeeker/ClientMapSeekerPage.dart';
import 'package:safetrack/src/presentation/pages/profile/info/ProfileInfoPage.dart';

class ClientHomePage extends StatefulWidget {
  const ClientHomePage({super.key});

  @override
  State<ClientHomePage> createState() => _ClientHomePageState();
}

class _ClientHomePageState extends State<ClientHomePage> {
  List<Widget> pageList = <Widget>[ClientMapSeekerPage(), ProfileInfoPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu de Opciones'),
      ),
      body: BlocBuilder<ClientHomeBloc, ClientHomeState>(
        builder: (context, state) {
          return pageList[state.pageIndex];
        },
      ),
      drawer: BlocBuilder<ClientHomeBloc, ClientHomeState>(
        builder: (context, state) {
          return Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
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
                    'Menu del Usuario',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ListTile(
                  title: Text("Mapa de Busqueda"),
                  selected: state.pageIndex == 0,
                  onTap: () {
                    context
                        .read<ClientHomeBloc>()
                        .add(ChangeDrawerPage(pageIndex: 0));
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text("Perfil de Usuario"),
                  selected: state.pageIndex == 1,
                  onTap: () {
                    context
                        .read<ClientHomeBloc>()
                        .add(ChangeDrawerPage(pageIndex: 1));
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text("Cerrar Sesión"),
                  onTap: () {
                    context.read<ClientHomeBloc>().add(Logout());
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => MyApp()),
                        (route) => false);
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
