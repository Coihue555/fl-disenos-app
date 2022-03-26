import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:disenos_app/src/routes/routes.dart';


class LauncherScreen extends StatelessWidget {
   
  const LauncherScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diseños en Flutter'),
      ),
      drawer: _MenuPrincipal(),
      body: _ListaOpciones(),
    );
  }
}

class _ListaOpciones extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, i) => const Divider(
        color: Colors.blue,
      ),
      itemCount: pageRoutes.length,
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon(pageRoutes[i].icon, color: Colors.blue,),
        title: Text(pageRoutes[i].titulo),
        trailing: const FaIcon(FontAwesomeIcons.chevronRight),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> pageRoutes[i].page)
          );
        },
      ),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                height: 200,
                child: const CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text('AM', style: TextStyle(fontSize: 50),),
                ),
              ),
            ),

            Expanded(
              child: _ListaOpciones(),
              ),
            ListTile(
              leading: const Icon(Icons.lightbulb_outline, color: Colors.blue,),
              title: const Text('Darkmode'),
              trailing: Switch.adaptive(
                value: true,
                activeColor: Colors.blue,
                onChanged: (value){}
              ),
            ),

            ListTile(
              leading: const Icon(Icons.add_to_home_screen, color: Colors.blue,),
              title: const Text('Custom Theme'),
              trailing: Switch.adaptive(
                value: true,
                activeColor: Colors.blue,
                onChanged: (value){}
              ),
            )
          ],
        ),
      ),
    );
  }
}