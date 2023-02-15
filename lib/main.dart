import 'package:flutter/material.dart';
import 'package:search_poc/pages/search_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const SearchHomePage(),
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
  bool isSelected = false;
  List<Names> names = namesMock;
  String nameSelect = '';
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Form(
              child: TextFormField(
                onChanged: search,
                controller: controller,
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(07),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: names.length,
                    itemBuilder: (context, index) {
                      return Card(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: ListTile(
                          selected: nameSelect == names[index].title ? isSelected : false,
                          selectedColor: Colors.amber,
                          trailing: Text(
                            names[index].title,
                          ),
                          title: Text(
                            names[index].number,
                            textAlign: TextAlign.start,
                          ),
                          onTap: () {
                            setState(() {
                              nameSelect = names[index].title;
                              isSelected = true;
                            });
                          },
                        ),
                      ));
                    }))
          ],
        ),
      ),
    );
  }

  void search(String value) {
    List<Names> listSearch;
    if (int.tryParse(value) != null) {
      listSearch = namesMock.where((e) {
        return e.number.toLowerCase().trim().contains(value.trim().toLowerCase());
      }).toList();
    } else {
      listSearch = namesMock.where((e) {
        return e.title.toLowerCase().trim().contains(value.trim().toLowerCase());
      }).toList();
    }

    setState(() {
      names = listSearch;
    });
  }
}

class Names {
  final String title;
  final String number;
  const Names({
    required this.number,
    required this.title,
  });
}

var namesMock = [
  const Names(title: 'Everton', number: '03'),
  const Names(title: 'Paulo', number: '01'),
  const Names(title: 'João', number: '22'),
  const Names(title: 'Samuel', number: '31'),
  const Names(title: 'Carlos', number: '25'),
  const Names(title: 'Anderson', number: '09'),
  const Names(title: 'Pamela', number: '05'),
  const Names(title: 'Cassio', number: '40'),
  const Names(title: 'Paula', number: '43'),
  const Names(title: 'Ana', number: '18'),
  const Names(title: 'Walter', number: '33'),
  const Names(title: 'Odete', number: '23'),
];
