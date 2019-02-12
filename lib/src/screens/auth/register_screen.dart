// import 'package:flutter/material.dart';
// import '../../app/providers/providers.dart' show AuthProvider, UserProvider;
// import '../../app/user/user.dart';
// import 'package:flutter_masked_text/flutter_masked_text.dart';
// import '../keys.dart';
// import '../../app/mix.dart';
// import '../../app/auth/auth_bloc.dart';
// import 'dart:async';

// class PhoneInput extends StatefulWidget {
//   AuthBloc bloc;
//   PhoneInput(this.bloc);
//   _PhoneInputState createState() => _PhoneInputState();
// }

// class _PhoneInputState extends State<PhoneInput> {
//   bool err = false;
//   StreamSubscription _b;
//   _PhoneInputState();
//   @override
//   void initState() {
//     super.initState();
//     _b = widget.bloc.isLoading.listen((data) {
//       print("DataReceived: " + data.toString());
//     }, onDone: () {
//       print("Task Done");
//     }, onError: (error) {
//       Future.delayed(Duration.zero, () {
//         Scaffold.of(context).showSnackBar(SnackBar(
//           content: Text("Error here"),
//           backgroundColor: Colors.deepPurple,
//         ));
//       });
//     });
//   }

//   void _handleTap() {
//     setState(() {
//       err = !err;
//     });
//     print("state is : " + err.toString());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: TextField(
//         decoration: InputDecoration(
//             enabled: !this.err,
//             border: OutlineInputBorder(borderSide: BorderSide(width: 2.3))),
//         onChanged: (v) => print(v),
//         onTap: () => print("edere"),
//       ),
//     );
//   }
// }

// class LoginScreen extends StatelessWidget with BlocUi {
//   bool autoFocus;
//   LoginScreen();
//   void showError(String err) {
//     print("error in ui mixin");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AuthProvider(
//       child: UserProvider(
//         child: Container(child: BuildLoginScreen()),
//       ),
//     );
//   }
// }

// class BuildLoginScreen extends StatelessWidget {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//   BuildLoginScreen({autoFoucs: bool});

//   @override
//   Widget build(BuildContext context) {
//     final authBloc = AuthProvider.of(context);
//     final userBloc = UserProvider.of(context);
//     User user = User();
//     return Container(
//         padding: EdgeInsets.all(20),
//         color: Colors.lightGreenAccent,
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               StreamBuilder(
//                 stream: authBloc.submitting,
//                 builder: (context, snapshot) {
//                   if (!snapshot.hasData) {
//                     return Container();
//                   }
//                   // Navigator.pushNamed(context, '/articles');
//                   return Container();
//                 },
//               ),
//               _loading(context),
//               _topMsg(context),
//               // _phoneInput(context),
//               PhoneInput(authBloc),
//               _agreement(context),
//               _submit(context),
//             ],
//           ),
//         ));
//   }

//   Future _showError(BuildContext context, String error) async {
//     Scaffold.of(context).showSnackBar(SnackBar(
//       content: Text(error),
//       backgroundColor: Colors.red,
//     ));
//   }

//   _loading(BuildContext context) {
//     final authBloc = AuthProvider.of(context);
//     return StreamBuilder(
//       stream: authBloc.isLoading,
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return Container();
//         }
//         if (snapshot.data == true) {
//           return CircularProgressIndicator(
//             backgroundColor: Colors.greenAccent,
//           );
//         }
//         return Container();
//       },
//     );
//   }

//   Widget _topMsg(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(top: 40),
//       child: Text("please enter your phone number "),
//     );
//   }

//   Widget _phoneInput(BuildContext context) {
//     final authBloc = AuthProvider.of(context);
//     final translator = {'#': RegExp("^[0-9\u0660-\u0669]")};
//     // TODO: Arabic number support
//     var controller =
//         new MaskedTextController(mask: '### ### ####', translator: translator);

//     // controller.afterChange = (String previous, String next) {
//     //   print("$previous | $next");
//     // };

//     User user = User();
//     return StreamBuilder(
//       stream: authBloc.userOut,
//       initialData: 0,
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {}

//         if (snapshot.hasError) {
//           _showError(context, snapshot.error);
//         }
//         // controller.updateText(snapshot.data);
//         return Directionality(
//           textDirection: TextDirection.ltr,
//           child: TextField(
//             textAlign: TextAlign.left,
//             autofocus: true,
//             controller: controller,
//             keyboardType: TextInputType.phone,
//             onChanged: (v) {
//               var unmaskedValue =
//                   controller.text.replaceAll(RegExp('[^0-9]'), '');
//               user = user.rebuild((b) => b..phone = unmaskedValue);
//               authBloc.userIn(user);
//             },
//             decoration: InputDecoration(
//               contentPadding: EdgeInsets.all(20),
//             ),
//             style: TextStyle(fontSize: 42.4, color: Colors.purple),
//           ),
//         );
//       },
//     );
//   }

//   Widget _agreement(BuildContext context) {
//     return Text("by clicing sumbit you agreed on all our terms");
//   }

//   Widget _submit(BuildContext context) {
//     final authBloc = AuthProvider.of(context);
//     return StreamBuilder(
//       stream: authBloc.submitting,
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {}
//         return RaisedButton(
//           color: Colors.greenAccent,
//           child: Text("Submit"),
//           onPressed: () {
//             authBloc.submit();
//           },
//         );
//       },
//     );
//   }

//   // void _showError(String error) {
//   //   final snackBar = SnackBar(content: Text('Are you talkin\' to me?'));
//   //   JeddKeys.scaffoldKey.
//   // }
// }
