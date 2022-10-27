
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:theme_provider/theme_provider.dart';



import '../widgets/Settings_group_component.dart';
import '../widgets/settings_item_component.dart';


class Settings_screen extends StatefulWidget {
  @override
  _Settings_screenState createState() => _Settings_screenState();
}

class _Settings_screenState extends State<Settings_screen> {
  bool dark = false;
  bool? can;
  bool hasprint = false;

  checkcan() async {
 //   can = await LocalAuthentication().canCheckBiometrics;
  }

      @override
  void initState() {
    
    //Provider.of<Main_provider>(context,listen: false).checkinternet();


   /* checkcan().then((value) {
      print('sssss$value');
      can=value;});
    print(can);

    */
   
    super.initState();
  }
  show() {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text("Confirmation"),
            content: Text("you sure you want to delete account"),
            actions: [
              ElevatedButton(
                  onPressed: () {
                //  Provider.of<Auth_provider>(context,listen: false).deletacount();
                   // Nav.NavigatorKey.currentState!
                     //   .pushReplacementNamed('splach');
                  },
                  child: Text("Ok")),
              TextButton(
                  onPressed: () {
                  //  Nav.NavigatorKey.currentState!.pop();
                  },
                  child: Text("Cancel"))
            ],
          );
        });
  }

  Future<bool> getdark() async {
    final p = await SharedPreferences.getInstance();
    return p.getBool('dark') == null ? false : p.getBool('dark')!;
  }

  @override
  Widget build(BuildContext context) {
   //  Provider.of<Main_provider>(context);
    /*getdark().then((value){
    print(value);
    dark=value;
    print(dark);
   } 
   
   );*/

    return FutureBuilder(
      future: getdark(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
     
        print(dark);
        return Scaffold(
          appBar: AppBar(
            title: Text("Settings"),
          ),
          body:Padding(
            padding: EdgeInsets.all(0),
            child: ListView(
              children: [
                Settings_Group(
                  title:
                     // EasyLocalization.of(context)!.currentLocale ==
                          //    Locale('en', '')?
                           "Common"
                         // : 'الإعدادات العامة',,
                , settingsItems: [
                    Settings_Item(
                        onTap: () {},
                        Trailing: PopupMenuButton(
                          icon: Icon(Icons.arrow_forward_ios_sharp),
                          itemBuilder: (context) {
                            return [
                              PopupMenuItem(
                                  onTap: () {
                                /*    EasyLocalization.of(context)!
                                        .setLocale(Locale('ar', ''));*/
                                  },
                                  child: Text('العربيه')),
                              PopupMenuItem(
                                  onTap: () {
                                 /*   EasyLocalization.of(context)!
                                        .setLocale(Locale('en', ''));*/
                                  },
                                  child: Text('English')),
                            ];
                          },
                        ),
                        icon: Icon(Icons.language),
                        title: /*EasyLocalization.of(context)!.currentLocale ==
                                Locale('en', '')
                            ?*/ "Language"
                            //: "لغة التطبيق",
                       , subtitle: /*EasyLocalization.of(context)!.currentLocale ==
                                Locale('en', '')
                            ?*/ 'English'
                            /*: "العربية"*/),
                    Settings_Item(
                      onTap: () {},
                      icon:Icon( Icons.dark_mode),
                      title: /*EasyLocalization.of(context)!.currentLocale ==
                              Locale('en', '')
                          ? */'Dark mode'
                           /*"الوضع المظلم"*/,
                      subtitle: dark
                          ? /*EasyLocalization.of(context)!.currentLocale ==
                                  Locale('en', '')
                              ? */"Active"
                              /*: "مفعل"*/
                          : /*EasyLocalization.of(context)!.currentLocale ==
                                  Locale('en', '')
                              ?*/ "off"
                             /* : "مغلق"*/,
                      Trailing:
                         Switch(
                        activeColor: Theme.of(context).primaryColor,
                        value: dark,
                        onChanged: (bool value) async {  
                          if (ThemeProvider.controllerOf(context).currentThemeId== ('default_dark_theme')){
 ThemeProvider.controllerOf(context).setTheme('custom_theme');
  setState(() {
     dark=false;
   });
}else{
   ThemeProvider.controllerOf(context).setTheme('default_dark_theme');
   setState(() {
     dark=true;
   });
}

                        //  Nav.NavigatorKey.currentState!
                             // .pushReplacementNamed('nav');                       
                        //  provider.changeDark(value) ;
                         /* if (dark == true) {
                            ThemeProvider.controllerOf(context)
                                .setTheme('default_dark_theme');
                          }*//* else {
                            ThemeProvider.controllerOf(context)
                                .setTheme('custem');
                          }*/
                          print(dark);

                          final p = await SharedPreferences.getInstance();
                          p.setBool('dark',  true);
                        },
                      ),
                      
                    )
                  ],
                ),
                Settings_Group(
                  title:
                     /* EasyLocalization.of(context)!.currentLocale ==
                              Locale('en', '')
                          ?*/ "Privecy"
                         /* : "الحماية"*/,
                 settingsItems: [
                    /*  SettingsItem(
              onTap: () async{
            can = await  LocalAuthentication().canCheckBiometrics;
            print('xxxxx$can');
             if(can!){
            hasprint = true;
        final x=    await SharedPreferences.getInstance();
        x.setBool('print', hasprint);
        print(x.getBool('print'));
             }else{
showDialog(context: context, builder: (ctx){
 return AlertDialog(
 title: Text("Error"),
 content: Text("Your device does not support fingerprint"),
actions: [
 
 TextButton(onPressed: (){
  Nav.NavigatorKey.currentState!.pop();
 
 }, child: Text("Ok"))


],

  );

});
             }

              },
             /* trailing: Switch.adaptive(
                
                value: true, onChanged:(v){}),*/
              icons: Icons.fingerprint,
              title: "Finger Print",
             
            ),*/
                     Settings_Item(
                      onTap: () {
                       // Nav.NavigatorKey.currentState!.pushNamed('apppass');
                      },
                      icon: Icon(Icons.lock),
                      title:/* EasyLocalization.of(context)!.currentLocale ==
                              Locale('en', '')
                          ?*/ "PIN code"
                          /*: "الرقم السري"*/,
                    ),
                  ],
                ),
                Settings_Group(
                  title:
                      /*EasyLocalization.of(context)!.currentLocale ==
                              Locale('en', '')
                          ?*/ "Account"
                          /*: "اعدادات الحساب"*/,
                  settingsItems: [
                    Settings_Item(
                      onTap: () {
                      //  Nav.NavigatorKey.currentState!.pushNamed('edit');
                      },
                      icon: Icon(Icons.edit),
                      title: /*EasyLocalization.of(context)!.currentLocale ==
                              Locale('en', '')*/
                           "Edit Profile"
                        /*  : "تعديل الملف الشخصي"*/,
                    ),
                     Settings_Item(
                      onTap: () {
                        //Nav.NavigatorKey.currentState!.pushNamed('reset');
                      },
                      icon: Icon(Icons.password),
                      title:/* EasyLocalization.of(context)!.currentLocale ==
                              Locale('en', '')
                          ? */"Reset Password"
                          /*: "اعادة تعيين كلمة السر"*/,
                    ),
                     Settings_Item(
                      onTap: () {
                        show();
                      },
                      icon: Icon(Icons.delete),
                      title: /*EasyLocalization.of(context)!.currentLocale ==
                              Locale('en', '')
                          ?*/ "Delete Account"
                          /*: "حذف الحساب"*/,
                    )
                  ],
                ),
                Settings_Group(
               title:
                     /* EasyLocalization.of(context)!.currentLocale ==
                              Locale('en', '')
                          ? */"Support"
                         /* : "الدعم"*/,
                  settingsItems: [
                     Settings_Item(
                      onTap: () {
                       // Nav.NavigatorKey.currentState!.pushNamed('contect');
                      },
                      icon: Icon(Icons.help_center),
                      title:/* EasyLocalization.of(context)!.currentLocale ==
                              Locale('en', '')
                          ?*/ "Help center"
                         /* : "تواصل معنا"*/,
                    ),
                     Settings_Item(
                      
                      onTap: () {
                       // Nav.NavigatorKey.currentState!.pushNamed('contect');
                      },
                      icon: Icon(Icons.contact_phone_rounded),
                      title:/* EasyLocalization.of(context)!.currentLocale ==
                              Locale('en', '')
                          ?*/ "Contact us"
                         /* : "تواصل معنا"*/,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
