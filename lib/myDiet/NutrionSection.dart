import 'package:flutter/material.dart';

class Nutrition extends StatefulWidget {
  Nutrition({Key key, @required this.nutrition, @required this.amount})
      : super(key: key);
  String nutrition;
  String amount;
  @override
  _NutritionState createState() => _NutritionState();
}

List proteins;

class _NutritionState extends State<Nutrition> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.nutrition == 'Proteins(gm) ' && widget.amount == '60') {
      proteins = [
        'Chicken breast 27gm',
        'Turkey breast 26gm',
        'Egg whites 27gm',
        'Dried fish 18gm'
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: proteins.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: new Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                    child: Container(
                      height: 60,
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(proteins[index]),
                          )),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          border: Border.all(width: 2, color: Colors.black)),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
