import 'package:flutter/material.dart';

import 'journal_tile.dart';
import 'log_entry.dart';

class LogEntryAdd extends StatefulWidget {
  @override
  _LogEntryAddState createState() => _LogEntryAddState();
}

class _LogEntryAddState extends State<LogEntryAdd> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController ailmentController = new TextEditingController();
  TextEditingController physicianController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LogEntryField('Physician', physicianController),
              LogEntryField('Condition', ailmentController),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: RaisedButton(
                  // todo: scale the button without hardcoded values
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onPressed: () {
                    LogEntry entry = new LogEntry(
                        ailment: ailmentController.text,
                        physician: physicianController.text,
                        dateStamp: DateTime.now());
                    JournalTile tile = JournalTile(entry);
                    if (tile.entry.ailment != '') {
                      Navigator.pop(context, tile);
                    } else {
                      Navigator.pop(context, null);
                    }
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class LogEntryField extends StatefulWidget {
  @override
  LogEntryFieldState createState() => LogEntryFieldState();

  final String title;
  final TextEditingController textController;

  LogEntryField(this.title, this.textController);
}

class LogEntryFieldState extends State<LogEntryField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textController,
      decoration: InputDecoration(
        labelText: widget.title,
      ),
    );
  }
}
