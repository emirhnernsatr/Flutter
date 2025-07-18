import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldLearn extends StatefulWidget {
  const TextFieldLearn({super.key});

  @override
  State<TextFieldLearn> createState() => _TextFieldLearnState();
}

class _TextFieldLearnState extends State<TextFieldLearn> {
  final key = GlobalKey(); 

  FocusNode focusNodeTextFieldOne = FocusNode();
  FocusNode focusNodeTextFieldtwo = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  Form(
        child: Column(
          children: [
            TextField(
              maxLength: 20,
              buildCounter: (BuildContext context, {int? currentLength, bool? isFocused, int? maxLength }){
                return AnimatedContainer(
                  key: key,
                  duration:  Duration(seconds: 1),
                  height: 10,
                  width: 10.0 * (currentLength ?? 0) ,
                  color: Colors.green,
                );
              },
              keyboardType: TextInputType.emailAddress,
              autofillHints: [AutofillHints.email],
              focusNode: focusNodeTextFieldOne,
              inputFormatters: [TextProjectInputFormmater()._formmatter],
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.mail),
                border: OutlineInputBorder(), 
                label: Text('Mail'),
                //fillColor: Colors.blue[500],
                //filled: true,
                ),
            ),
            TextFormField(focusNode: focusNodeTextFieldtwo,
            minLines: 2,
            maxLines: 4,
            ),
          ],
        ),
      ),
  
    );
  }
}

class TextProjectInputFormmater {
  final _formmatter = TextInputFormatter.withFunction((oldValue, newValue) {
          if (newValue.text == 'a'){
            return oldValue;
          }
          return newValue;
        });
}
