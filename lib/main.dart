import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const appTitle = "Actividad Flutter";

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appTitle,
      color: Colors.purple,
      home: MyHomePage(title: appTitle),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static const List<Widget> _widgetOptions = <Widget>[
    Text("Bienvenidos", style: optionStyle)
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Buscar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Botón Buscar presionado")),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            tooltip: 'Notificaciones',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Botón Notificaciones presionado")),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Configuración',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Botón Configuración presionado")),
              );
            },
          ),
        ],
      ),
      body: Center(child: _widgetOptions[_selectedIndex]),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.purple,
                image: DecorationImage(
                  image: AssetImage('assets/logo/logoheader.png'),
                  fit: BoxFit.cover,
                  opacity: 0.2,
                ),
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('ver lista'),
              selected: _selectedIndex == 0,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ListTileExample()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.business),
              title: const Text('ver cardview'),
              selected: _selectedIndex == 1,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CardPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ListTitleApp extends StatelessWidget {
  const ListTitleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: ListTileExample());
  }
}

class ListTileExample extends StatefulWidget {
  const ListTileExample({super.key});

  @override
  State<ListTileExample> createState() => _ListTileExampleState();
}

class _ListTileExampleState extends State<ListTileExample> {
  int _selectedIndex = 0;

  // Aquí defines tu array de datos
  final List<String> programmingLanguages = [
    "Python",
    "Java",
    "C++",
    "JavaScript",
    "Dart",
    "Kotlin",
    "Swift",
    "Go",
    "Ruby",
    "PHP"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Programming Languages")),
      body: ListView.builder(
        itemCount: programmingLanguages.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(
              index == _selectedIndex
                  ? Icons.check_circle
                  : Icons.radio_button_unchecked,
            ),
            title: Text(programmingLanguages[index]),
            selected: index == _selectedIndex,
            selectedTileColor: const Color.fromARGB(255, 86, 14, 203).withOpacity(0.3),
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
          );
        },
      ),
    );
  }
}

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Card View")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.asset(
                  'assets/logo/logoheader.png',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  "Título de la Card",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                child: Text(
                  "lorem ipsum dolor sit amet, consectetur adipiscing elit. lorem ipsum dolor sit amet, consectetur adipiscing elit. lorem ipsum dolor sit amet, consectetur adipiscing elit. lorem ipsum dolor sit amet, consectetur adipiscing elit. lorem ipsum dolor sit amet, consectetur adipiscing elit. lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}