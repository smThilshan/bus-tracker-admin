import 'package:bus_tracker_admin/widgets/custom_btn.dart';
import 'package:bus_tracker_admin/widgets/my_date_selector.dart';
import 'package:bus_tracker_admin/widgets/my_selection_box.dart';
import 'package:bus_tracker_admin/widgets/my_textfield_widget.dart';
import 'package:bus_tracker_admin/widgets/two_texfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddRouteScreen extends StatefulWidget {
  static const routeName = 'add_route_screen';

  const AddRouteScreen({super.key});

  @override
  State<AddRouteScreen> createState() => _AddRouteScreenState();
}

class _AddRouteScreenState extends State<AddRouteScreen> {
  final TextEditingController firstController = TextEditingController();

  TextEditingController email = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late String _tripNo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Route Income'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DateSelectorWidget(),
                  const SizedBox(
                    height: 20,
                  ),
                  // SelectionBox(),
                  MySelectionBoxWidget(
                    items: ['01', '02', '03', '04'],
                    initialValue: '01',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TwoTextfieldWidget(firstLabel: "K - P", secondLabel: "P - K"),
                  const SizedBox(
                    height: 20,
                  ),
                  MyTextfieldWidget(
                    label: 'Expenses',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TwoTextfieldWidget(
                      firstLabel: "D - Salary", secondLabel: "C - Salary"),

                  SizedBox(
                    height: 20,
                  ),
                  MyTextfieldWidget(
                    label: 'Others',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MyTextfieldWidget(
                    label: 'Balance',
                  ),
                  // BigBlueButton(),
                  SizedBox(
                    height: 25,
                  ),
                  CustomButton(
                    onPressed: () {},
                    text: 'Done',
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
