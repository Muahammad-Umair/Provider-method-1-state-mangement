import 'package:bread_crust_provider/Controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/broadCrust.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: BroadCrustP(),
      child: const MaterialApp(
        title: "Bread crust",
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Brust Cast"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Consumer<BroadCrustP>(builder: (context, controler, __) {
            final list = controler.unmodifiedlist;
            return Wrap(
              children: list
                  .map((broadCrust) => Text(
                        broadCrust.title,
                        style: TextStyle(
                            color: broadCrust.IsActive
                                ? Colors.blue
                                : Colors.grey),
                      ))
                  .toList(),
            );
          }),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {
                context
                    .read<BroadCrustP>()
                    .add(BroadCrust(name: "New Value 1"));
              },
              child: Text("Add New"),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {
                context.read<BroadCrustP>().reset();
              },
              child: Text("Reset"),
            ),
          ),
        ],
      ),
    );
  }
}
