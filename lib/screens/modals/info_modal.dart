import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PopUps extends StatefulWidget {
  final Widget popUpWidget;
  final String btnText;
  const PopUps({super.key, required this.popUpWidget, required this.btnText});

  @override
  PopUpsBuilder createState() => PopUpsBuilder();
}

class PopUpsBuilder extends State<PopUps> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Stack(
                children: <Widget>[
                  const Opacity(
                    opacity: 0.4, // set the opacity level for the background
                    child:
                        ModalBarrier(dismissible: false, color: Colors.black),
                  ),
                  widget.popUpWidget,
                ],
              );
            },
          );
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue[900],
        ),
        child: Text(widget.btnText));
  }
}

class PopUpsG1 extends StatefulWidget {
  final List<dynamic> popUpItems;
  const PopUpsG1({Key? key, required this.popUpItems}) : super(key: key);
  @override
  PopupBuilderG1 createState() => PopupBuilderG1();
}

class PopupBuilderG1 extends State<PopUpsG1> {
  @override
  Widget build(BuildContext context) {
    List<Widget> popUpChildrenG1 = [
      FittedBox(
        alignment: Alignment.center,
        child: Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.grey[600],
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: Text(
              widget.popUpItems[0],
              style: const TextStyle(color: Colors.white),
            )),
      ),
      Center(
        child: SizedBox(
          width: 240,
          child: Text(
            widget.popUpItems[1],
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
      Container(
          height: 56,
          width: 56,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            // color: Colors.grey[800],
          ),
          child: Icon(
            widget.popUpItems[2],
            color: Colors.black,
            size: 50,
          )),
      Text(
        widget.popUpItems[3],
        style: const TextStyle(fontSize: 14),
      ),
      SizedBox(
          height: 44,
          width: 215,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.grey[600],
            ),
            child: Text(widget.popUpItems[4]),
          )),
      SizedBox(
          height: 44,
          width: 215,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
            ),
            child: Text(widget.popUpItems[5]),
          )),
    ];
    return Dialog(
        child: SizedBox(
      width: 300,
      height: 364,
      // color: Colors.blue,
      child: Card(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center
          children: List.generate(
            popUpChildrenG1.length,
            (index) => Container(
              margin: const EdgeInsets.only(top: 16),
              child: popUpChildrenG1[index], // set the padding for each child
            ),
          ),
        ),
      ),
    ));
  }
}

class PopUpsG2 extends StatefulWidget {
  final List<String> options;
  final String btnText;
  const PopUpsG2({Key? key, required this.options, required this.btnText})
      : super(key: key);
  @override
  PopupBuilderG2 createState() => PopupBuilderG2();
}

class PopupBuilderG2 extends State<PopUpsG2> {
  String? _selectedOption;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                child: Column(
                  children: [
                    Column(
                      children: widget.options.map((option) {
                        bool isSelected = _selectedOption == option;
                        return Column(
                          children: [
                            ListTile(
                              title: Text(
                                option,
                                style: const TextStyle(fontSize: 18),
                              ),
                              trailing: isSelected
                                  ? const Icon(Icons.check_box_rounded)
                                  : null,
                              onTap: () {
                                setState(() {
                                  _selectedOption = option;
                                });
                              },
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    width: 1,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 200,
          height: 50,
          left: 70,
          right: 70,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.grey[600],
            ),
            child: Text(widget.btnText),
          ),
        ),
      ],
    );
  }
}

class PopUpsG3 extends StatefulWidget {
  final List<dynamic> popUpItems;
  final List<TextEditingController> popUpsControllers;
  const PopUpsG3(
      {Key? key, required this.popUpItems, required this.popUpsControllers})
      : super(key: key);
  @override
  PopupBuilderG3 createState() => PopupBuilderG3();
}

class PopupBuilderG3 extends State<PopUpsG3> {
  @override
  Widget build(BuildContext context) {
    List<Widget> popUpChildrenG3 = [
      Text(
        widget.popUpItems[0],
        style: const TextStyle(fontSize: 18),
      ),
      Text(
        widget.popUpItems[1],
        style: const TextStyle(fontSize: 18),
      ),
      Text(
        widget.popUpItems[2],
        style: const TextStyle(fontSize: 14),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 50,
            child: Column(
              children: [
                TextField(
                  controller: widget.popUpsControllers[0],
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                  ],
                ),
                Text(widget.popUpItems[3]),
              ],
            ),
          ),
          SizedBox(
            width: 50,
            child: Column(
              children: [
                TextField(
                  controller: widget.popUpsControllers[1],
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                  ],
                ),
                Text(widget.popUpItems[4]),
              ],
            ),
          ),
        ],
      ),
      SizedBox(
          height: 44,
          width: 215,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.grey[600],
            ),
            child: Text(widget.popUpItems[5]),
          )),
      SizedBox(
          height: 44,
          width: 215,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
            ),
            child: Text(widget.popUpItems[6]),
          )),
    ];
    return Dialog(
        child: SizedBox(
          width: 300,
          height: 364,
          // color: Colors.blue,
          child: Card(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center
              children: List.generate(
                popUpChildrenG3.length,
                (index) => Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: popUpChildrenG3[index], // set the padding for each child
                ),
              ),
            ),          ),
    ));
  }
}
