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
  newApp app = newApp();
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
          body: Center(
              child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: DataBodyWidget(
                      objects: dataObjects,
                      columnNames: ["Nome", "Fundação", "Champions"],
                      propertyNames: ["name", "fundation", "champions"]))),
          bottomNavigationBar: NewNavBar(),
        ));
  }
}

class newApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.red),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Ranking dos times com mais Champions"),
          ),
          body: Center(
              child: MyTileWidget(
                  objects: dataObjects,
                  columnNames: ["Nome", "Fundação", "Champions"],
                  propertyNames: ["name", "fundation", "champions"])),
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
        label: "Times",
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
  final List<Map<String, dynamic>> objects;
  final List<String> columnNames;
  final List<String> propertyNames;
  DataBodyWidget(
      {this.objects = const [],
      this.columnNames = const [],
      this.propertyNames = const []});
  @override
  Widget build(BuildContext context) {
    return DataTable(
        columns: columnNames
            .map((name) => DataColumn(
                label: Expanded(
                    child: Text(name,
                        style: TextStyle(fontStyle: FontStyle.italic)))))
            .toList(),
        rows: objects
            .map((obj) => DataRow(
                cells: propertyNames
                    .map((propName) => DataCell(Text(obj[propName])))
                    .toList()))
            .toList());
  }
}

class MyTileWidget extends StatelessWidget {
  List<Map<String, dynamic>> objects;
  final List<String> columnNames;
  final List<String> propertyNames;

  MyTileWidget(
      {this.objects = const [],
      this.columnNames = const [],
      this.propertyNames = const []});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: objects.length,
      itemBuilder: (context, index) {
        final obj = objects[index];

        final columnTexts = columnNames.map((col) {
          final prop = propertyNames[columnNames.indexOf(col)];
          return Text("$col: ${obj[prop]}");
        }).toList();

        return ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: columnTexts,
          ),
        );
      },
    );
  }
}
