import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'settings_store.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage(this.settingsStore);

  final SettingsStore settingsStore;

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Opacity(
                opacity: 0.85,
                child: Text('Settings', style: Theme.of(context).textTheme.headline),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Theme.of(context).dividerColor)),
                  ),
                  padding: EdgeInsets.only(bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(FontAwesomeIcons.plug),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          'News API',
                          style: Theme.of(context).textTheme.subhead,
                        ),
                      ),
                    ],
                  ),
                ),
                Observer(
                  builder: (_) => Padding(
                    padding: const EdgeInsets.only(left: 16, top: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'API key',
                          style: Theme.of(context).textTheme.title,
                        ),
                        Form(
                          key: _formKey,
                          child: TextFormField(
                            initialValue: widget.settingsStore.apiKeyValue,
                            decoration: InputDecoration(
                              hintText: 'Enter API key',
                            ),
                            onSaved: (String value) {
                              widget.settingsStore.setNonValidatedApiKey(value);
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
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: RaisedButton(
                              child: Text('Update'),
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  widget.settingsStore.setApiKey();
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Theme.of(context).dividerColor)),
                  ),
                  padding: EdgeInsets.only(bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(FontAwesomeIcons.paintRoller),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          'Customization',
                          style: Theme.of(context).textTheme.subhead,
                        ),
                      ),
                    ],
                  ),
                ),
                Observer(
                  builder: (_) => Padding(
                    padding: const EdgeInsets.only(left: 16, top: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        AbsorbPointer(
                          absorbing: widget.settingsStore.themeSetBySystemValue,
                          child: Opacity(
                            opacity: widget.settingsStore.themeSetBySystemValue ? 0.3 : 1.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Use dark theme',
                                  style: Theme.of(context).textTheme.title,
                                ),
                                Switch(
                                  value: widget.settingsStore.useDarkModeValue,
                                  onChanged: widget.settingsStore.setDarkMode,
                                  activeColor: Theme.of(context).accentColor,
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 4),
                                      child: Text(
                                        'Theme set by system',
                                        style: Theme.of(context).textTheme.title,
                                      ),
                                    ),
                                    Opacity(
                                      opacity: 0.5,
                                      child: Text(
                                        'Requires minimum Android 10 or IOS 13',
                                        style: Theme.of(context).textTheme.subtitle,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Switch(
                                value: widget.settingsStore.themeSetBySystemValue,
                                onChanged: widget.settingsStore.setSystemTheme,
                                activeColor: Theme.of(context).accentColor,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
