import 'package:flutter/material.dart';
// todo
import 'package:easy_localization/easy_localization.dart';
// import 'package:restart_app/restart_app.dart';

void main() async {
  // todo
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    // TODO suppoorted languages
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations', // Path to translation files
      fallbackLocale: const Locale('en'), // Fallback locale
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // todo
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,

      home: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('welcome').tr(), // Use .tr() to translate text
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'hello',
              style: TextStyle(
                fontSize: 30,
                color: Colors.blue,
              ),
            ).tr(), // Translated text
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Toggle between English and Arabic
                if (context.locale.languageCode == 'en') {
                  context.setLocale(const Locale('ar'));
                } else {
                  context.setLocale(const Locale('en'));
                }
              },
              child: Text('switch_language').tr(),
            ),
          ],
        ),
      ),
    );
  }
}
