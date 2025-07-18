import 'package:flutter/material.dart';

class FormLearnView extends StatefulWidget {
  const FormLearnView({super.key});

  @override
  State<FormLearnView> createState() => _FormLearnViewState();
}

class _FormLearnViewState extends State<FormLearnView> {
  GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _key,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              validator:  FormFieldValidator().isNotEmpty,            
              ),

              DropdownButtonFormField<String>(
                validator: FormFieldValidator().isNotEmpty,
                items: [
                DropdownMenuItem(value: '1', child: Text('Item 1')),
                DropdownMenuItem(value: '2', child: Text('Item 2')),
                DropdownMenuItem(value: '3', child: Text('Item 3')),
              ], 
              onChanged: (value){} 
              ),
              CheckboxListTile(value: true, onChanged: (value){} ),
            ElevatedButton(
              onPressed: (){
                if (_key.currentState?.validate() ?? false) {
                  print('okey');
                  } 
              }, 
              child: Text('Save'))
          ]),
      ),
    );
  }
}

class FormFieldValidator {
  String?  isNotEmpty(String? data){
    return (data?.isNotEmpty ?? false) ? null : VaslidatorMessage._notEmpty;
  }
}

class VaslidatorMessage {
  static String _notEmpty = "Bu alan boş bırakılamaz";
}