
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() =>
    runApp(MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.white
      ),
      home: const Home(),
    ));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String name = ' ';
  String adress = ' ';
  String server_response = ' ';


  final _controllername = TextEditingController();
  final _controllerurl = TextEditingController();



    Future<void> answer() async{
        try {
          adress = _controllerurl.text + '?name='+_controllername.text;

          final url = Uri.parse(adress);

          //http://10.0.2.2:90/api/hello
          var response = await http.post(url);

          final data = (response.body);
          setState(() {
            server_response = data;
          });
              () => print(server_response);
        } catch (error) {
          print(error);
        }
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Api Request'),
          centerTitle: true,
        ),
        body: Column(
          children: [

            const Padding(padding: EdgeInsets.all(20.0)),
            const Text('API Endpoint'),
            TextField(
              controller: _controllerurl,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'url adress',
              ),
            ),

            const Padding(padding: EdgeInsets.all(20.0)),
            const Text('What is your name?'),
            TextField(
              controller: _controllername,
              decoration:const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'name',
              ),
            ),

            const Padding(padding: EdgeInsets.all(20.0)),
            const Text('Server response'),
            const Padding(padding: EdgeInsets.all(20.0)),
            Text(server_response),
          ],
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: answer,
          child: const Text('answer'),
        ),
      );
    }
  }

