// ignore_for_file: prefer_const_constructors

import 'package:expenditure_app/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transcation = [
    Transaction(
        id: "t1", title: "Neue Schuhe", amoungt: 69.69, date: DateTime.now()),
    Transaction(id: "t2", title: "Tee", amoungt: 3.99, date: DateTime.now())
  ];

  //late String titleInput;
  //late String amountInput;
  final titelControler = TextEditingController();
  final amountControler = TextEditingController();

  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),
      ),
      body: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('Chart'),
                elevation: 5,
              ),
            ),
            Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: titelControler,
                      //onChanged: (value) => titleInput = value,
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Amount'),
                      controller: amountControler,
                      //onChanged: (value) => amountInput = value,
                    ),
                    TextButton(
                      onPressed: () {
                        print(titelControler.text);
                      },
                      child: Text("Add Trascation"),
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Column(
                children: transcation
                    .map((e) => Card(
                            child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.purple, width: 2)),
                              padding: EdgeInsets.all(10),
                              child: Text('\$ ${e.amoungt}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.purple)),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  e.title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(DateFormat("dd.MM.yyyy").format(e.date),
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.grey))
                              ],
                            )
                          ],
                        )))
                    .toList()),
          ]),
    );
  }
}
