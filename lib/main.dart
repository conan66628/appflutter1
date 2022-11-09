import 'package:flutter/material.dart';
import "package:get/get.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '@conan66628',
      theme: ThemeData(brightness: Brightness.dark, primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'MINTIC - Reto1'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final textorigen = TextEditingController();
final textdestino = TextEditingController();

class calculadora {
  final titulo;
  final icono1;
  final color;

  calculadora(this.titulo, this.icono1, this.color);
}

//var items = ["USD", "EUR", "COP"];
//List<String> item2 = <String>["USD", "EUR", "COP"];
String op1 = "USD";
String op2 = "USD";

List<DropdownMenuItem<String>> item3 = <DropdownMenuItem<String>>[
  DropdownMenuItem(child: Text("USD"), value: "USD"),
  DropdownMenuItem(child: Text("EUR"), value: "EUR"),
  DropdownMenuItem(child: Text("COP"), value: "COP"),
];

List<calculadora> cal = <calculadora>[
  calculadora("9", Icon(Icons.abc), Colors.blue),
  calculadora("8", Icon(Icons.abc), Colors.blue),
  calculadora("7", Icon(Icons.abc), Colors.blue),
  calculadora("6", Icon(Icons.abc), Colors.blue),
  calculadora("5", Icon(Icons.abc), Colors.blue),
  calculadora("4", Icon(Icons.abc), Colors.blue),
  calculadora("3", Icon(Icons.abc), Colors.blue),
  calculadora("2", Icon(Icons.abc), Colors.blue),
  calculadora("1", Icon(Icons.abc), Colors.blue),
  calculadora("0", Icon(Icons.abc), Colors.blue),
  calculadora(
      "Limpiar",
      Icon(
        Icons.cleaning_services,
        size: 30,
      ),
      Colors.blue),
  calculadora("Calcular", Icon(Icons.calculate), Colors.blue),
];

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Row(children: [
              Text("Origen"),
              VerticalDivider(),
              DropdownButton(
                  value: op1,
                  items: item3,
                  onChanged: (String? x) {
                    setState(() {
                      op1 = x.toString();
                    });
                  }),
              VerticalDivider(),
              VerticalDivider(),
              Text("Destino"),
              VerticalDivider(),
              DropdownButton(
                  value: op2,
                  items: item3,
                  onChanged: (String? x) {
                    setState(() {
                      op2 = x.toString();
                    });
                  }),
            ]),
            TextField(
              controller: textorigen,
              decoration: InputDecoration(labelText: "Origen", hintText: "0"),
            ),
            TextField(
              controller: textdestino,
              decoration: InputDecoration(labelText: "Destino", hintText: "0"),
            ),
            Expanded(
                child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: cal.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                    color: cal[index].color,
                    child: ListTile(
                      title: Center(
                        child: index > 9
                            ? cal[index].icono1
                            : Text(
                                cal[index].titulo,
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                      ),
                      onTap: () {
                        print(cal[index].titulo);

                        if (index < 10) {
                          textorigen.text = textorigen.text + cal[index].titulo;
                        } else if (index == 10) {
                          textorigen.text = "";
                          textdestino.text = "";
                        } else {
                          if (op1 == "USD" && op2 == "COP") {
                            textdestino.text =
                                (double.parse(textorigen.text) * 5000)
                                    .toString();
                          } else if (op1 == "COP" && op2 == "USD") {
                            textdestino.text =
                                (double.parse(textorigen.text) / 5000)
                                    .toString();
                          } else if (op1 == "EUR" && op2 == "COP") {
                            textdestino.text =
                                (double.parse(textorigen.text) * 5050)
                                    .toString();
                          } else if (op1 == "COP" && op2 == "EUR") {
                            textdestino.text =
                                (double.parse(textorigen.text) / 5050)
                                    .toString();
                          } else if (op1 == "EUR" && op2 == "USD") {
                            textdestino.text =
                                (double.parse(textorigen.text) * 0.99)
                                    .toString();
                          } else if (op1 == "USD" && op2 == "EUR") {
                            textdestino.text =
                                (double.parse(textorigen.text) / 0.99)
                                    .toString();
                          } else {
                            textdestino.text = textorigen.text;
                          }
                        }
                      },
                    ));
              },
            ))
          ],
        ),
      ),
    );
  }
}
