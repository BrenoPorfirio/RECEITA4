import 'package:flutter/material.dart';

var dataObjects = [
  {
    "name": "Real Madrid",
    "fundation": "1902",
    "champions": "14",
  },
  {
    "name": "Milan",
    "fundation": "1899",
    "champions": "7",
  },
  {
    "name": "Liverpool",
    "fundation": "1892",
    "champions": "6",
  },
  {
    "name": "Bayern de Munique",
    "fundation": "1900",
    "champions": "6",
  },
  {
    "name": "Ajax",
    "fundation": "1900",
    "champions": "4",
  },
  {
    "name": "Manchester United",
    "fundation": "1878",
    "champions": "3",
  },
  {
    "name": "Inter de Milão",
    "fundation": "1908",
    "champions": "3",
  },
  {
    "name": "Chelsea",
    "fundation": "1905",
    "champions": "2",
  },
  {
    "name": "Benfica",
    "fundation": "1904",
    "champions": "2",
  },
  {
    "name": "Nottingham Forest",
    "fundation": "1865",
    "champions": "2",
  },
  {
    "name": "Juventus",
    "fundation": "1897",
    "champions": "2",
  },
  {
    "name": "Porto",
    "fundation": "1893",
    "champions": "2",
  },
  {
    "name": "Celtic",
    "fundation": "1887",
    "champions": "1",
  },
  {
    "name": "Feyenoord",
    "fundation": "1908",
    "champions": "1",
  },
  {
    "name": "Aston Villa",
    "fundation": "1874",
    "champions": "1",
  },
  {
    "name": "Hamburgo",
    "fundation": "1887",
    "champions": "1",
  },
  {
    "name": "Steaua Bucareste",
    "fundation": "1974",
    "champions": "1",
  },
  {
    "name": "PSV",
    "fundation": "1913",
    "champions": "1",
  },
  {
    "name": "Estrela Vermelha",
    "fundation": "1945",
    "champions": "1",
  },
  {
    "name": "Olympique de Marselha",
    "fundation": "1899",
    "champions": "1",
  },
  {
    "name": "Borussia Dortmund",
    "fundation": "1909",
    "champions": "1",
  }
];

void main() {
  MyApp app = MyApp();
  runApp(app);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Ranking dos times com mais Champions"),
          ),
          body: SingleChildScrollView(
            child: DataBodyWidget(objects: dataObjects),
          ),
          bottomNavigationBar: NewNavBar(),
        ));
  }
}

class NewNavBar extends StatelessWidget {
  NewNavBar();
  void botaoFoiTocado(int index) {
    print("Tocaram no botão $index");
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(onTap: botaoFoiTocado, items: const [
      BottomNavigationBarItem(
        label: "Time",
        icon: Icon(Icons.flag_outlined),
      ),
      BottomNavigationBarItem(
          label: "Fundação", icon: Icon(Icons.flag_outlined)),
      BottomNavigationBarItem(
          label: "Champions", icon: Icon(Icons.flag_outlined))
    ]);
  }
}

class DataBodyWidget extends StatelessWidget {
  final List objects;
  final List<String>? columnNames;
  final List<String>? propertyNames;

  const DataBodyWidget({
    Key? key,
    required this.objects,
    this.columnNames,
    this.propertyNames,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> _columnNames =
        columnNames ?? ["Nome", "Fundação", "Champions"];
    final List<String> _propertyNames =
        propertyNames ?? ["name", "fundation", "champions"];

    return DataTable(
      columns: _columnNames
          .map(
            (name) => DataColumn(
              label: Expanded(
                child: Text(
                  name,
                  style: const TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
          )
          .toList(),
      rows: objects
          .map(
            (obj) => DataRow(
              cells: _propertyNames
                  .map(
                    (propName) => obj.containsKey(propName)
                        ? DataCell(Text(obj[propName].toString()))
                        : const DataCell(Text('')),
                  )
                  .toList(),
            ),
          )
          .toList(),
    );
  }
}

class MyTileWidget extends StatelessWidget {
  List objects;
  List<String> propertyNames;
  MyTileWidget({this.objects = const [], this.propertyNames = const []});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: objects.length,
      itemBuilder: (context, index) {
        var obj = objects[index];
        return ListTile(
          title: Text(obj[propertyNames[0]]),
          subtitle: Text(
            propertyNames
                .skip(1)
                .map((propName) => "${propName}: ${obj[propName]}")
                .join(" - "),
          ),
          trailing: Icon(Icons.chevron_right),
        );
      },
    );
  }
}
