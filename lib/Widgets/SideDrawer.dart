import 'package:clinic_app/Services/auth.dart';
import 'package:clinic_app/Widgets/popup.dart';
import 'package:clinic_app/home/appointment_page_1.dart';
import 'package:clinic_app/utils/colors.dart';
import 'package:clinic_app/utils/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';

class SideDrawer extends StatefulWidget {

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            child: Center(),
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/image/logo.png"),
                  fit: BoxFit.fitWidth),
              color: AppColors.buttonBackgroundColor,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Página Principal'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
              leading: Icon(Icons.calendar_today_rounded),
              title: Text('Marcar Consulta'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      const AppointmentPage(
                        hasService: false,
                      )),
                );
              }),
          ListTile(
            leading: Icon(Icons.all_inbox_rounded),
            title: Text('Documentos'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Terminar Sessão'),
              /*onTap: () async {
               await _auth.signOut();
             },*/
              onTap: () {
                showDialog(context: context,
                    builder: (BuildContext context){
                      return PopUp(
                        title: "Encerrar Sessao",
                        descriptions: "Tem a certeza que pretende encerrar a sua sessao?",
                        text: "Sim",
                      );
                    }
                );
              }
          ),
        ],
      ),
    );
  }
}
