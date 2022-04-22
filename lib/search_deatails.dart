// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:nethouese/pages/views/service2/searchService.dart';
//
// class SearchDetails extends StatefulWidget {
//
//
//   @override
//   _SearchDetailsState createState() => _SearchDetailsState();
// }
//
// class _SearchDetailsState extends State<SearchDetails> {
//   var searchbar = TextEditingController();
//   List allResults = [] ;
//   late String searchKey;
//   late Stream streamQuery;
//   var QueryResult=[];
//   var tempsearchstore=[];
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     searchbar.addListener(onSearchChange);
//   }
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     searchbar.removeListener(onSearchChange);
//     searchbar.dispose();
//     super.dispose();
//   }
//   @override
//   void initialSearch(String value) {
//     if(value.length==0){
//       setState(() {
//         QueryResult=[];
//         tempsearchstore=[];
//       });
//     }
//     var capitalizedValue=value.substring(0,1).toUpperCase()+value.substring(1);
//     if(QueryResult.length==0&& value.length==1){
//       SearchService().searchByName(value).then((QuerySnapshot docs){
//
//         //Below are the two lines of code where the error is occurring.
//
//         for(int i=0;i<QuerySnapshot.documents.length)
//           QueryResult.add(docs.documents[i].data);
//       });
//     }
//
//   }
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: <Widget>[
//             TextField(
//               controller: searchbar ,
//               cursorColor:Theme.of(context).accentColor,
//               decoration: InputDecoration(
//                   contentPadding: EdgeInsets.all(8),
//                   hintText: 'Search',
//                   fillColor: Colors.grey[300],
//                   filled: true,
//                   prefixIcon: Icon(Icons.search),
//                   border: OutlineInputBorder(
//                       borderSide: BorderSide.none,
//                       borderRadius: BorderRadius.circular(20)
//                   )
//               ),
//               onChanged: (value){
//                 initialSearch(value);
//               },
//             ),
//             StreamBuilder(
//               stream: FirebaseFirestore.instance
//                   .collection('Restaurant')
//                   .where('title', isEqualTo: searchbar.text)
//                   .snapshots(),
//               builder: (context, QuerySnapshot ) {
//                 if (!QuerySnapshot.hasData) return new Text('Loading...');
//                 return new ListView.builder(
//                   itemCount: QuerySnapshot.docs.length,
//                   itemBuilder: (context, index) => Item(QuerySnapshot.data!.documents[index]),
//                 );
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
//   onSearchChange()
//   {
//
//   }
//   searchResultList()
//   {
//     var showResults = [];
//     if(searchbar.text !="")
//     {
//       // we have a search paramter
//       for(var name_resSnapshot in allResults )
//       {
//         var name = FirebaseFirestore.instance.collection('Restaurant')
//             .where('name'.toLowerCase()).snapshots();
//         if (name.contains(searchbar.text.toLowerCase()))
//         {
//           showResults.add(name_resSnapshot)
//         }
//       }
//
//     }
//   }
//   Widget _fireSearch(String queryText) {
//     return new StreamBuilder(
//       stream: FirebaseFirestore.instance
//           .collection('Restaurant')
//           .where('title', isEqualTo: queryText)
//           .snapshots(),
//       builder: (context, QuerySnapshot ) {
//         if (!QuerySnapshot.hasData) return new Text('Loading...');
//         return new ListView.builder(
//           itemCount: QuerySnapshot.docs.length,
//           itemBuilder: (context, index) =>
//               Item(QuerySnapshot.data!.documents[index]),
//         );
//       },
//     );
//   }
//   Widget Item()=> Row(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children:<Widget> [
//       Container(
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(6.0)
//           ),
//           clipBehavior: Clip.antiAliasWithSaveLayer,
//           width: 90.0,
//           height: 100.0,
//           child: Image.asset(list['image'],fit: BoxFit.cover,)
//       ),
//       SizedBox(width: 15.0,),
//       Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children:<Widget> [
//           Text(
//               list['name'],
//               style: TextStyle(
//                 fontSize: 16.0,
//               )
//           ),
//           Text(
//               list['type'],
//               style: TextStyle(
//                 color: Colors.grey,
//               )
//           ),
//           Row(
//             children:<Widget> [
//               Icon(
//                 Icons.star,
//                 color: Theme.of(context).accentColor,
//                 size: 14,
//               ),
//               SizedBox(width: 2,),
//               Text(
//                   list['rate'],
//                   style: TextStyle(
//                     color: Theme.of(context).accentColor,
//                   )
//               ),
//             ],
//           ),
//         ],
//       ),
//     ],
//   );
// }
