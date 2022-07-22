import 'package:clinic_app/home/appointment_page_1.dart';
import 'package:clinic_app/utils/colors.dart';
import 'package:clinic_app/utils/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Text(
                'Clínica Hora Sã',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            decoration: BoxDecoration(
              color: AppColors.mainColor2,
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
                      builder: (context) => const AppointmentPage(
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
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
