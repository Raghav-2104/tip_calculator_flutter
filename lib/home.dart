import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int percent = 5;
  bool check = false;
  late double total = 0;
  late double amount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Tip Calulator'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.grey[700],
      ),
      body: Column(children: [
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 150),
          child: TextField(
            onChanged: (value) {
              amount = double.parse(value);
            },
            decoration: InputDecoration(
                labelText: 'Cost',
                icon:const Icon(
                  Icons.money_rounded,
                  size: 50,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
            keyboardType: TextInputType.number,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const Text(
          'Use Slider for tip percent',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Slider(
          label: percent.toString(),
          value: (percent ?? 5).toDouble(),
          onChanged: (val) {
            setState(() {
              percent = val.toInt();
            });
          },
          min: 5,
          max: 25,
          divisions: 4,
          activeColor: Colors.purple,
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Round off the tip?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            Checkbox(
                value: check,
                onChanged: (bool? val) {
                  setState(() {
                    check = val!;
                  });
                }),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              if (check==false) {
                total = percent * 0.01 * amount;
              } else {
                total = percent * 0.01 * amount;
                total=total.round().toDouble();
              }
            });
            print(total);
          },
          child: Text("Calculate Tip"),
          style: ElevatedButton.styleFrom(
            primary: Colors.purple,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          'Your total tip is ${total}',
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
      ]),
    );
  }
}
