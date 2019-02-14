import 'package:country_pickers/country.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:country_pickers/country_pickers.dart';
import 'dart:io';
import '../../widgets/widgets.dart' show TextFieldJedd;
import '../../utils.dart';

class PickCountry extends StatefulWidget {
  bool enabled = true;
  TextStyle style;
  Function(String) selectedCode;

  PickCountry({
    this.selectedCode,
    this.enabled,
    this.style,
  });
  _PickCountryState createState() => _PickCountryState();
}

class _PickCountryState extends State<PickCountry> {
  Country _selectedCountry;

  @override
  void initState() {
    // TODO: implement initState
    this._selectedCountry = CountryPickerUtils.getCountryByIsoCode('sa');
    if (mounted) {
      widget.selectedCode(this._selectedCountry.phoneCode);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showPickerDialog,
      child: Container(
        child: Text(
          "+${this._selectedCountry.phoneCode}",
          style: widget.style,
        ),
      ),
    );
  }

  void _showPickerDialog() {
    if (!widget.enabled) return null;
    if (Utils.isIOS) {
      _openCupertinoCountryPicker();
    } else {
      _openCountryPickerDialog();
    }
  }

  /**
   * * IOS
   */
  void _openCupertinoCountryPicker() => showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return CountryPickerCupertino(
          pickerSheetHeight: 200.0,
          itemBuilder: _buildCupertinoItem,
          onValuePicked: (Country country) => setState(() {
                _selectedCountry = country;
                widget.selectedCode(this._selectedCountry.phoneCode);
              }),
        );
      });

  Widget _buildCupertinoItem(Country country) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          SizedBox(width: 8.0),
          // Text("+${country.phoneCode}"),
          // SizedBox(width: 8.0),
          Flexible(child: Text(country.name))
        ],
      );

  /**
   * * Android
   */
  void _openCountryPickerDialog() => showDialog(
        context: context,
        builder: (context) => Theme(
            data: Theme.of(context).copyWith(primaryColor: Colors.pink),
            child: CountryPickerDialog(
                titlePadding: EdgeInsets.all(8.0),
                searchCursorColor: Colors.pinkAccent,
                searchInputDecoration: InputDecoration(hintText: 'Search...'),
                isSearchable: false,
                title: Text('Select your phone code'),
                onValuePicked: (Country country) => setState(() {
                      _selectedCountry = country;
                      widget.selectedCode(this._selectedCountry.phoneCode);
                    }),
                itemBuilder: _buildDialogItem)),
      );
  Widget _buildDialogItem(Country country) => ClipRect(
        child: Row(
          textDirection: TextDirection.ltr,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // CountryPickerUtils.getDefaultFlagImage(country),
            Text(
              "+${country.phoneCode}",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontSize: 15,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(width: 8.0),
            Flexible(child: Text(country.isoCode))
          ],
        ),
      );
}

// class PickCountry extends StatefulWidget {
//   bool isLoading = false;
//   String countryCode;
//   Function(String) phoneNumber;
//   String validationErr = "";

//   PickCountry({
//     this.isLoading,
//     this.phoneNumber,
//     this.countryCode,
//     this.validationErr,
//   });
//   @override
//   _PickCountryState createState() => _PickCountryState();
// }

// class _PickCountryState extends State<PickCountry> {
//   Country _selectedDialogCountry = CountryPickerUtils.getCountryByIsoCode('sa');
//   Country _selectedCupertinoCountry =
//       CountryPickerUtils.getCountryByIsoCode('sa');

//   Country _selectedCountry = CountryPickerUtils.getCountryByIsoCode('sa');
//   @override
//   void initState() {
//     widget.countryCode = _selectedCountry.phoneCode;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: _phoneBox(context),
//     );
//   }

//   Widget _phoneBox(BuildContext context) {
//     return Opacity(
//       opacity: widget.isLoading ? 0.2 : 1,
//       child: Container(
//         decoration: BoxDecoration(
//             color: Colors.black12,
//             borderRadius: BorderRadius.all(
//               Radius.circular(3),
//             ),
//             border: Border.all(color: Colors.black26, width: 1)),
//         child: _buildPicker(context),
//       ),
//     );
//   }

//   Widget _buildPicker(BuildContext context) {
//     Widget _textFiled;
//     Country _country;
//     VoidCallback _onPressd;
//     if (Utils.isIOS) {
//       _country = _selectedCupertinoCountry;
//       _onPressd = _openCupertinoCountryPicker;
//       _textFiled = CupertinoTextField(
//         keyboardType: TextInputType.phone,
//         maxLength: 10,
//         enabled: !widget.isLoading,
//         style: Theme.of(context).textTheme.body1.copyWith(fontSize: 30),
//         onChanged: widget.phoneNumber,
//       );
//     } else {
//       _country = _selectedDialogCountry;
//       _onPressd = _openCountryPickerDialog;
//       _textFiled = TextField(
//         keyboardType: TextInputType.phone,
//         autofocus: true,
//         enabled: !widget.isLoading,
//         decoration: InputDecoration(
//             border: InputBorder.none,
//             errorText:
//                 widget.validationErr != null ? widget.validationErr : null),
//         style: Theme.of(context).textTheme.body1.copyWith(fontSize: 30),
//         onChanged: widget.phoneNumber,
//       );
//     }
//     return Row(
//       mainAxisSize: MainAxisSize.max,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         // selected value
//         ConstrainedBox(
//           constraints: BoxConstraints(maxWidth: 70, maxHeight: 60),
//           child: FlatButton(
//             padding: EdgeInsets.all(0),
//             onPressed: _onPressd,
//             child: Text(
//               '+${_country.phoneCode}',
//               textDirection: TextDirection.ltr,
//             ),
//           ),
//         ),
//         SizedBox(width: 3.0),
//         Flexible(
//           child: _textFiled,
//         ),
//       ],
//     );
//   }

//   Widget _buildDialogItem(Country country) => ClipRect(
//         child: Row(
//           textDirection: TextDirection.ltr,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             // CountryPickerUtils.getDefaultFlagImage(country),
//             // SizedBox(width: 3.0),
//             Text(
//               "+${country.phoneCode}",
//               textDirection: TextDirection.ltr,
//               style: TextStyle(
//                 fontSize: 15,
//                 color: Theme.of(context).primaryColor,
//               ),
//             ),
//             SizedBox(width: 8.0),
//             Flexible(child: Text(country.isoCode))
//           ],
//         ),
//       );

//   void _openCountryPickerDialog() => showDialog(
//         context: context,
//         builder: (context) => Theme(
//             data: Theme.of(context).copyWith(primaryColor: Colors.pink),
//             child: CountryPickerDialog(
//                 titlePadding: EdgeInsets.all(8.0),
//                 searchCursorColor: Colors.pinkAccent,
//                 searchInputDecoration: InputDecoration(hintText: 'Search...'),
//                 isSearchable: false,
//                 title: Text('Select your phone code'),
//                 onValuePicked: (Country country) => setState(() {
//                       _selectedDialogCountry = country;
//                     }),
//                 itemBuilder: _buildDialogItem)),
//       );

//   void _openCupertinoCountryPicker() => showCupertinoModalPopup<void>(
//       context: context,
//       builder: (BuildContext context) {
//         return CountryPickerCupertino(
//           pickerSheetHeight: 200.0,
//           itemBuilder: _buildCupertinoItem,
//           onValuePicked: (Country country) => setState(() {
//                 _selectedCupertinoCountry = country;
//               }),
//         );
//       });

//   Widget _buildCupertinoItem(Country country) => Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           CountryPickerUtils.getDefaultFlagImage(country),
//           SizedBox(width: 8.0),
//           // Text("+${country.phoneCode}"),
//           // SizedBox(width: 8.0),
//           Flexible(child: Text(country.name))
//         ],
//       );
// }

// class PhoneInput extends StatefulWidget {
//   Function(String) contryCode;
//   Function(String) phoneNumber;
//   String validationErr = "";
//   PhoneInput({
//     this.contryCode,
//     this.phoneNumber,
//     this.validationErr,
//   });

//   _PhoneInputState createState() => _PhoneInputState();
// }

// class _PhoneInputState extends State<PhoneInput> {
//   Country _seletedCountry;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: TextField(
//         onChanged: widget.phoneNumber,
//         decoration: InputDecoration(
//           border: InputBorder.none,
//           errorText: widget.validationErr,
//         ),
//       ),
//     );
//   }

//   Widget _countryPicker(BuildContext context) {
//     return Text("sdfsd");
//   }
// }
