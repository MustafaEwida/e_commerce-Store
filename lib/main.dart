

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/providers/Auth.dart';

import 'package:flutter_application_3/screens/nav.dart';
import 'package:flutter_application_3/screens/Overview.dart';
import 'package:provider/provider.dart';
import 'providers/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './widgets/Theme.dart';
import 'providers/Cart.dart';
import 'providers/Order.dart';
import './screens/LogIn_S.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './screens/splach.dart';
import 'helper/navkey.dart';
import './screens/profile.dart';
import 'package:theme_provider/theme_provider.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
  runApp(
   MultiProvider(providers: [
     ChangeNotifierProvider(create: ((context) =>AuthHelper() )),
 ChangeNotifierProxyProvider<AuthHelper,Main_Provider>
 (create: ((context) =>Main_Provider([],[]) ),
 update: (con,auth,previos)=> Main_Provider(previos?.items==null?[]:previos!.items,previos?.Cato==null?[] :previos!.Cato),
 
 ),
    ChangeNotifierProvider(create: ((context) =>Cart() )),
     ChangeNotifierProvider(create: ((context) =>Orders() )),

   ]
   ,child:  MyApp(),
   
   
   ));
}

class MyApp extends StatelessWidget {


  const MyApp({Key? key}) : super(key: key);
 
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return ScreenUtilInit(
      designSize: const Size(392.72, 803.63),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return ThemeProvider(
           themes: [
      AppTheme(
          id: "custom_theme", // Id(or name) of the theme(Has to be unique)
          description: "My Custom Theme", // Description of theme
          data:  ThemeApp.themeapp,
        ),
        AppTheme.dark(), // This is standard dark theme (id is default_dark_theme)
        
      ],
      
        child: Builder(
          builder: (themeContext) => 
             ThemeConsumer(child: Builder(
                
                builder: ((themecontext) {
                  return   MaterialApp(
          
   
    
    navigatorKey: Custum_Nav.navigatorKey,
    home:Consumer<AuthHelper>(builder: ((context, value, child) {
      return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
       
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return  snapshot.hasData?Nav():Splach();
        },
      );
    })),
    routes: {
      
  'Log' :(context) => LogIn_Screen(),
  'profile':(context) => profile()


    },
   
     theme:  ThemeProvider.themeOf(themeContext).data

       
      ,
      
      );
                  
                })))
            ,
          ),
        
      
    );
        
        
        
        
        
        
        /* MaterialApp(
    navigatorKey: Custum_Nav.navigatorKey,
    
    routes: {
  'Log' :(context) => LogIn_Screen(),
  'profile':(context) => profile()


    },
    darkTheme: ThemeData.dark(),
     theme:

       
     ThemeApp.themeapp ,
      home:Splach(),
      );*/  },
   
    );
    
    
    
    
     /*MaterialApp(
    navigatorKey: Custum_Nav.navigatorKey,
    
    routes: {
  'Log' :(context) => LogIn_Screen(),
  'profile':(context) => profile()


    },
     theme:


     ThemeApp.themeapp ,
      home:Splach(),
    );
  
    */
    
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
