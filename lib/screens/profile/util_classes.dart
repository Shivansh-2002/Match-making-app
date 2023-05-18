import "dart:io";
import "package:flutter/material.dart";
// import "package:image_picker/image_picker.dart";

class ScreenUtil {
  static double ? screenWidth;
  static double ? screenHeight;

  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
  }
} 

class HomeGroundWidget extends StatefulWidget {
  final String text;
  final List<String> contentText;
  final List<TextEditingController> contentControllers;
  const HomeGroundWidget(
      {Key? key,
      required this.text,
      required this.contentText,
      required this.contentControllers})
      : super(key: key);
  @override
  HomeGroundWidgetBuilder createState() => HomeGroundWidgetBuilder();
}

class HomeGroundWidgetBuilder extends State<HomeGroundWidget> {
  @override
  Widget build(BuildContext context) {
    return Content(
      text: widget.text,
      childrens: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: ListText(
              listControllers: widget.contentControllers.sublist(0, 3),
              listStrings: widget.contentText.sublist(0, 3)),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: InputFieldWithOptions(
            options: const ["Set", "Unset"],
            labelText: widget.contentText[3],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: BoxText(
              text: widget.contentText[4],
              controller: widget.contentControllers[4]),
        ),
      ],
    );
  }
}

class Content extends StatefulWidget {
  final String text;
  final dynamic childrens;
  const Content({Key? key, required this.text, required this.childrens})
      : super(key: key);
  @override
  ContentBuilder createState() => ContentBuilder();
}

class ContentBuilder extends State<Content> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Card(
        child: ExpansionTile(
          tilePadding: const EdgeInsets.only(left: 4),
          title: Text(
            widget.text,
            style: const TextStyle(color: Colors.black),
          ),
          trailing: _isExpanded
              ? const Icon(
                  Icons.remove,
                  color: Colors.black,
                )
              : const Icon(
                  Icons.add,
                  color: Colors.black,
                ),
          onExpansionChanged: (bool expanded) {
            setState(() {
              _isExpanded = expanded;
            });
          },
          children: widget.childrens,
        ),
      ),
    );
  }
}

class BoxText extends StatefulWidget {
  final String text;
  final TextEditingController controller;
  const BoxText({Key? key, required this.text, required this.controller})
      : super(key: key);
  @override
  BoxTextBuilder createState() => BoxTextBuilder();
}

class BoxTextBuilder extends State<BoxText> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(labelText: widget.text),
    );
  }
}

class ListText extends StatefulWidget {
  final List<TextEditingController> listControllers;
  final List<String> listStrings;
  const ListText(
      {Key? key, required this.listControllers, required this.listStrings})
      : super(key: key);
  @override
  ListTextBuilder createState() => ListTextBuilder();
}

class ListTextBuilder extends State<ListText> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.listControllers.length,
      itemBuilder: (context, index) {
        return BoxText(
          text: widget.listStrings[index],
          controller: widget.listControllers[index],
        );
      },
    );
  }
}

class InputFieldWithOptions extends StatefulWidget {
  final List<String> options;
  final String labelText;

  const InputFieldWithOptions({
    Key? key,
    required this.options,
    required this.labelText,
  }) : super(key: key);
  @override
  InputFieldWithOptionsState createState() => InputFieldWithOptionsState();
}

class InputFieldWithOptionsState extends State<InputFieldWithOptions> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: widget.labelText,
        // border: const OutlineInputBorder(),
      ),
      value: selectedOption,
      onChanged: (String? newValue) {
        setState(() {
          selectedOption = newValue;
        });
      },
      items: widget.options.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class ImageBox extends StatefulWidget {
  final double h;
  final double w;

  const ImageBox({super.key, required this.h, required this.w});
  @override
  ImageBoxBuilder createState() => ImageBoxBuilder();
}

class ImageBoxBuilder extends State<ImageBox> {
  File? image;

  Future<void> pickImage() async {
    // try {
    //   final pickedFile =
    //       // await ImagePicker().pickImage(source: ImageSource.gallery);
    //   if (pickedFile == null) return;
    //   setState(() {
    //     image = File(pickedFile.path);
    //   });
    // } catch (e) {
    //   const AlertDialog(semanticLabel: "Failed to load image");
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.h,
      width: widget.w,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
      child: ElevatedButton(
        onPressed: pickImage,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.grey,
        ),
        child: image != null
            ? Image.file(
                image!,
                width: 177,
                height: 200,
                fit: BoxFit.cover,
              )
            : const Icon(Icons.add),
      ),
    );
  }
}
