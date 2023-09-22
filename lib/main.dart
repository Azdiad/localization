import 'package:animation/View/splash.dart/splashscreen.dart';
import 'package:animation/controller/localizationcontroller.dart';
import 'package:animation/controller/screenpageprovider.dart';
import 'package:animation/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Localprovider(),
        ),
        ChangeNotifierProvider(
          create: (_) => Increassizeprovider(),
        )
      ],
      child: Consumer<Localprovider>(builder: (context, provider, snapshot) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: provider.locale,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
          ],
          supportedLocales: L10n.all,
          home: SplasScreen(),
        );
      }),
    );
  }
}
