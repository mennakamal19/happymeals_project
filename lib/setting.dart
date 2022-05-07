// import 'package:flutter/material.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:settings_ui/settings_ui.dart';
//
// class Setting extends StatefulWidget {
//
//   @override
//   _SettingState createState() => _SettingState();
// }
//
// class _SettingState extends State<Setting> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         shadowColor: Colors.transparent,
//         backgroundColor: Colors.transparent,
//         leading: IconButton(icon: Icon(Icons.arrow_back_ios_rounded), onPressed: () =>Navigator.pop(context)),
//         title: Text('Setting'),
//         titleSpacing: 0,
//       ),
//       body:
//       Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: SettingsList(
//           sections: [
//             SettingsSection(
//               title: 'Common',
//               titleTextStyle: TextStyle(color: Theme.of(context).accentColor,fontWeight: FontWeight.bold,fontSize: 14),
//               tiles: [
//                 SettingsTile(
//                   title: 'Language',
//                   subtitle: 'English',
//                   leading: Icon(Icons.language),
//                   onPressed: (BuildContext context) {},
//                 ),
//                 SettingsTile.switchTile(
//                   title: 'Dark mode',
//                   leading: Icon(Icons.dark_mode_rounded),
//                   switchValue: false,
//                   onToggle: (bool value) {
//
//                   },
//                 ),
//               ],
//             ),
//             SettingsSection(
//               title: 'Account',
//               titleTextStyle: TextStyle(color: Theme.of(context).accentColor,fontWeight: FontWeight.bold,fontSize: 14),
//               tiles: [
//                 SettingsTile(
//                   title: 'phone number',
//                   leading: Icon(Icons.phone),
//                   onPressed: (BuildContext context) {},
//                 ),
//                 SettingsTile(
//                   title: 'Email',
//                   leading: Icon(Icons.email),
//                   onPressed: (BuildContext context) {},
//                 ),
//                 SettingsTile(
//                   title: 'Change password',
//                   leading: Icon(Icons.lock_outline_rounded),
//                   onPressed: (BuildContext context) {},
//                 ),
//                 SettingsTile(
//                   title: 'Sign out',
//                   leading: Icon(Icons.logout),
//                   onPressed: (BuildContext context) {},
//                 ),
//               ],
//             ),
//             SettingsSection(
//               title: 'Misc',
//               titleTextStyle: TextStyle(color: Theme.of(context).accentColor,fontWeight: FontWeight.bold,fontSize: 14),
//               tiles: [
//                 SettingsTile(
//                   title: 'Terms of Service',
//                   leading: Icon(Icons.sticky_note_2_outlined),
//                   onPressed: (BuildContext context) {},
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ) ,
//     );
//   }
// }
