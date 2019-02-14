import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_view/pin_code_view.dart';

// class PhoneVerificationScreen extends StatefulWidget {
//   _PhoneVerificationScreenState createState() =>
//       _PhoneVerificationScreenState();
// }

// class _PhoneVerificationScreenState extends State<PhoneVerificationScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//           color: Theme.of(context).primaryColor,
//           padding: EdgeInsets.all(7),
//           child: Center(
//             child: _pinInput(context),
//           )),
//     );
//   }

//   Widget _pinInput(BuildContext context) {
//     return PinCode(
//       title: Text(
//         "Lock Screen",
//         style: TextStyle(
//             color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.normal),
//       ),
//       subTitle: Text(''),
//       codeTextStyle: TextStyle(
//           fontSize: 20, fontStyle: FontStyle.normal, color: Colors.white),
//       codeLength: 6,
//       onCodeEntered: (v) => _onSubmit,
//     );
//   }

//   void _onSubmit(String v) {
//     print(v);
//   }
// }

class PhoneVerificationScreen extends StatelessWidget {
  final int digits = 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _fileds(context),
    );
  }

  Widget _fileds(BuildContext context) {
    return Row(children: _buildFields(context));
  }

  List<Widget> _buildFields(BuildContext context) {
    List<Widget> items = <Widget>[];
    for (var i = 0; i < this.digits; i++) {
      items.add(Container(
        margin: EdgeInsets.all(15),
        color: Colors.amber,
        constraints: BoxConstraints(
          maxHeight: 40,
          maxWidth: 40,
        ),
        child: TextField(),
      ));
    }
    return items;
  }

  void _nextItem() {}
  void _prevItem() {}
  void _submit() {}
}
