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
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('News App', style: Theme.of(context).textTheme.headline),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'You need to obtain a API key from https://newsapi.org/register to use this application. The API key is required to fetch news data from server.',
                  style: Theme.of(context).textTheme.body1,
                ),
              ),
              Text('Enter API key', style: Theme.of(context).textTheme.subhead,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Form(
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
