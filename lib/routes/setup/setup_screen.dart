import 'package:News/common/app_store.dart';
import 'package:News/routes/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SetupScreen extends StatefulWidget {

  @override
  _SetupScreenState createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _value;

  @override
  void initState() {
    super.initState();
  }

  _onButtonPressed() {
    if (_formKey.currentState.validate()) {
      Provider.of<AppStore>(context).setApiKey(_value);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text('Enter API key'),
              Form(
                key: _formKey,
                child: TextFormField(
                  onSaved: (String value) {
                    this._value = value;
                  },
                  validator: (value) {
                    _formKey.currentState.save();
                    if (value.isEmpty) {
                      return 'Please enter API key';
                    }
                    return null;
                  },
                ),
              ),
              RaisedButton(
                child: Text('Continue'),
                onPressed: _onButtonPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
