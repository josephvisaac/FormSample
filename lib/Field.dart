import 'package:flutter/material.dart';

import 'package:string_validator/string_validator.dart'; /*isAlpha()*/

class Field extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Scaffold(
        body: Form(
      autovalidate: false,
      key: _formKey,
      child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(30)),
          Container(
            child: Text(
              'Form Sample',
              style: TextStyle(fontSize: 20,),
            ),
          ),
          Padding(padding: EdgeInsets.all(10)),
          TextFormField(
            decoration: InputDecoration(hintText: 'first name'),
            onSaved: (String val) {
              // print(' Search Term TextField: form saved $val');
              print(' saved $val');
            },
            validator: (String val) {
              if (val.isEmpty) return 'Please enter some text';
              if (!isAlpha(val)) return 'Cannot have numbers';
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(hintText: 'last name'),
            onSaved: (String val) {
              // print(' Search Term TextField: form saved $val');
              print('saved $val');
            },
            validator: (String val) {
              if (val.isEmpty) return 'Please enter some text';
              if (!isAlpha(val)) return 'Must be letters only';
              return null;
            },
          ),
          RaisedButton(
              child: Text('Submit'),
              onPressed: () {
                //checks if the input is valid
                if (_formKey.currentState.validate())
                  //saves it in current state
                  _formKey.currentState.save();

                print('Successfully saved the state');
              })
        ],
      ),
    ));
  }
}
