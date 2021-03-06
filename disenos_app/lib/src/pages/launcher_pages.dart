import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:disenos_app/src/routes/routes.dart';
import 'package:disenos_app/src/theme/theme.dart';

class LauncherScreen extends StatelessWidget {
  const LauncherScreen({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    
    return Scaffold(
      backgroundColor: appTheme.colorScheme.secondary,
      appBar: AppBar(
        title: const Text('Diseños en Flutter - Mobiles'),
      ),
      drawer: _MenuPrincipal(),
      body: _ListaOpciones(),
    );
  }
}

class _ListaOpciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, i) => Divider(
        color: appTheme.primaryColorLight,
      ),
      itemCount: pageRoutes.length,
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon(
          pageRoutes[i].icon,
          color: appTheme.primaryColorLight,
        ),
        title: Text(pageRoutes[i].titulo),
        trailing: FaIcon(
          FontAwesomeIcons.chevronRight,
          color: appTheme.primaryColorLight,
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => pageRoutes[i].page));
        },
      ),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return Drawer(
      child: Container(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                height: 200,
                child: CircleAvatar(
                  backgroundColor: appTheme.currentTheme.colorScheme.secondary,
                  child: const Text(
                    'AM',
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ),
            ),
            Expanded(
              child: _ListaOpciones(),
            ),
            ListTile(
              leading: Icon(
                Icons.lightbulb_outline,
                color: appTheme.currentTheme.colorScheme.secondary,
              ),
              title: const Text('Darkmode'),
              trailing: Switch.adaptive(
                  value: appTheme.darkTheme,
                  activeColor: appTheme.currentTheme.colorScheme.secondary,
                  onChanged: (value) {
                    appTheme.darkTheme = value;
                  }),
            ),
            ListTile(
              leading: Icon(
                Icons.add_to_home_screen,
                color: appTheme.currentTheme.colorScheme.secondary,
              ),
              title: const Text('Custom Theme'),
              trailing: Switch.adaptive(
                  value: appTheme.customTheme,
                  activeColor: appTheme.currentTheme.colorScheme.secondary,
                  onChanged: (value) {
                    appTheme.customTheme = value;
                  }),
            )
          ],
        ),
      ),
    );
  }
}
