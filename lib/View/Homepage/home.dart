import 'package:animation/View/Homepage/widget/screentile.dart';
import 'package:animation/View/Homepage/widget/triplist.dart';
import 'package:animation/controller/localizationcontroller.dart';
import 'package:animation/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    title(String val) {
      switch (val) {
        case 'en':
          return Text(
            'English',
            style: TextStyle(fontSize: 16),
          );
        case 'hi':
          return Text(
            'हिंदी',
            style: TextStyle(fontSize: 16),
          );
        case 'ml':
          return Text(
            'മലയാളം',
            style: TextStyle(fontSize: 16),
          );
        default:
          return Text(
            'English',
            style: TextStyle(fontSize: 16),
          );
      }
    }

    return Consumer<Localprovider>(builder: (context, provider, snapshot) {
      var lang = provider.locale ?? Localizations.localeOf(context);
      return Scaffold(
          body: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThytQ9s-Isfdu65tBKjg9I8mjMA8DpNQAboQ&usqp=CAU  "),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topLeft),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 30),
                  SizedBox(
                    height: 160,
                    child: ScreenTitle(text: 'Vehicles'),
                  ),
                  DropdownButton(
                    value: lang,
                    onChanged: (Locale? val) {
                      provider.setLocal(val!);
                    },
                    items: L10n.all
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: title(e.languageCode),
                            ))
                        .toList(),
                  ),
                  Flexible(
                    child: VehicleList(),
                  )
                  //Sandbox(),
                ],
              )));
    });
  }
}
