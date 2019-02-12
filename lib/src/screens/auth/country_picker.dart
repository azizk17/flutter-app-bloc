import 'package:country_pickers/country.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:country_pickers/country_pickers.dart';

class PickCountry extends StatefulWidget {
  bool isLoading = false;
  PickCountry({
    this.isLoading,
  });
  @override
  _PickCountryState createState() => _PickCountryState();
}

class _PickCountryState extends State<PickCountry> {
  Country _selectedDialogCountry = CountryPickerUtils.getCountryByIsoCode('sa');
  Country _selectedCupertinoCountry =
      CountryPickerUtils.getCountryByIsoCode('sa');
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Directionality(
          textDirection: TextDirection.ltr, child: _android(context)),
    );
  }

  Widget _android(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.all(
              Radius.circular(3),
            ),
            border: Border.all(color: Colors.black26, width: 1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 70, maxHeight: 60),
              // height: 40,
              child: FlatButton(
                // color: Colors.black12,
                padding: EdgeInsets.all(0),
                onPressed: widget.isLoading ? null : _openCountryPickerDialog,
                child: _buildDialogListItem(_selectedDialogCountry),
              ),
            ),
            SizedBox(
              width: 8.0,
            ),
            Flexible(
              child: TextField(
                style: TextStyle(
                    fontSize: 30, color: Theme.of(context).primaryColor),
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  enabled: !widget.isLoading,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // @override
  // Widget ss(BuildContext context) {
  //   return ListView(
  //     padding: EdgeInsets.all(8.0),
  //     children: <Widget>[
  //       Card(
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: <Widget>[
  //             Text('CountryPickerDialog'),
  //             ListTile(
  //               onTap: _openCountryPickerDialog,
  //               title: _buildDialogItem(_selectedDialogCountry),
  //             ),
  //           ],
  //         ),
  //       ),
  //       Card(
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: <Widget>[
  //             Text('CountryPickerCupertino'),
  //             ListTile(
  //               title: _buildCupertinoItem(_selectedCupertinoCountry),
  //               onTap: _openCupertinoCountryPicker,
  //             ),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget _buildDialogListItem(Country country) => ClipRect(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // CountryPickerUtils.getDefaultFlagImage(country),
            // SizedBox(width: 3.0),
            Text(
              "+${country.phoneCode}",
              style: TextStyle(
                  fontSize: 15, color: Theme.of(context).primaryColor),
            ),
            // SizedBox(width: 8.0),
            // Flexible(child: Text(country.name))
          ],
        ),
      );

  Widget _buildDialogItem(Country country) => ClipRect(
        child: Row(
          textDirection: TextDirection.ltr,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // CountryPickerUtils.getDefaultFlagImage(country),
            // SizedBox(width: 3.0),
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
                onValuePicked: (Country country) =>
                    setState(() => _selectedDialogCountry = country),
                itemBuilder: _buildDialogItem)),
      );

  void _openCupertinoCountryPicker() => showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return CountryPickerCupertino(
          pickerSheetHeight: 200.0,
          onValuePicked: (Country country) =>
              setState(() => _selectedCupertinoCountry = country),
        );
      });

  Widget _buildCupertinoItem(Country country) => Row(
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          SizedBox(width: 8.0),
          Text("+${country.phoneCode}"),
          SizedBox(width: 8.0),
          Flexible(child: Text(country.isoCode))
        ],
      );
}
