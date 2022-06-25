import 'package:flutter/material.dart';
import 'package:maa/form_history/user.dart';

typedef OnDelete();

class UserForm extends StatefulWidget {
  final User user;
  final state = _UserFormState();
  final OnDelete onDelete;

  UserForm({Key? key, required this.user, required this.onDelete})
      : super(key: key);
  @override
  _UserFormState createState() => state;

  bool isValid() => state.validate();
}

class _UserFormState extends State<UserForm> {
  final form = GlobalKey<FormState>();
  bool active_condition = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Material(
        elevation: 1,
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(8),
        child: Form(
          key: form,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AppBar(
                leading: const Icon(Icons.insert_chart),
                elevation: 0,
                title: const Text('Medical History'),
                backgroundColor: Color(0xFF586894),
                centerTitle: true,
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: widget.onDelete,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28, right: 16, top: 16),
                child: TextFormField(
                  initialValue: widget.user.condition,
                  onSaved: (val) => widget.user.condition = val!,
                  validator: (val) =>
                      val!.length > 3 ? null : 'Condition name is invalid',
                  decoration: const InputDecoration(
                    labelText: 'Condition',
                    hintText: 'Enter your medical Condition',
                    icon: Icon(Icons.medical_services),
                    isDense: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 28, right: 16, bottom: 24, top: 18),
                child: TextFormField(
                  initialValue: widget.user.hospitalname,
                  onSaved: (val) => widget.user.hospitalname = val!,
                  validator: (val) =>
                      val!.contains('@') ? null : 'Hospital is invalid',
                  decoration: const InputDecoration(
                    labelText: 'Hospital Name',
                    hintText: 'Enter your Hospital Name',
                    icon: Icon(Icons.place),
                    isDense: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28, right: 16, bottom: 24),
                child: TextFormField(
                  initialValue: widget.user.doctorname,
                  onSaved: (val) => widget.user.doctorname = val!,
                  validator: (val) =>
                      val!.contains('@') ? null : 'Doctor name is invalid',
                  decoration: const InputDecoration(
                    labelText: 'Doctor Name',
                    hintText: 'Enter your Doctors Name',
                    icon: Icon(Icons.person),
                    isDense: true,
                  ),
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.only(left: 1, right: 10, bottom: 24),
                  child: CheckboxListTile(
                    value: active_condition,
                    onChanged: (val) {
                      setState(() {
                        initialValue:
                        widget.user.activestatus;
                        onSaved:
                        (val) => widget.user.activestatus = val!;
                        active_condition = val!;
                      });
                    },
                    activeColor: Colors.deepPurpleAccent,
                    title: const Text("Active"),
                    subtitle: const Text("Are you Still undergoing  treatment"),
                    // secondary: Icon(Icons.local_activity_rounded),
                    controlAffinity: ListTileControlAffinity.leading,
                  ))
            ],
          ),
        ),
      ),
    );
  }

  ///form validator
  bool validate() {
    var valid = form.currentState!.validate();
    if (valid) form.currentState!.save();
    return valid;
  }
}
