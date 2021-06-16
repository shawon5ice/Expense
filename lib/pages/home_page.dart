// import 'package:expense/widgets/chart.dart';
// import 'package:expense/widgets/new_input_transaction.dart';
// import 'package:expense/widgets/transactions_list.dart';
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import '../model/transaction.dart';
// import 'package:velocity_x/velocity_x.dart';

// const String dataBoxName = "transaction";

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final List<Transaction> _userTransaction = [];
//   var _isNight = false;

//   List<Transaction> get _recentTransactions {
//     return _userTransaction
//         .where(
//           (element) => element.date.isAfter(
//             DateTime.now().subtract(
//               Duration(days: 7),
//             ),
//           ),
//         )
//         .toList();
//   }

//   void _addNewTransaction(String txTitle, double txAmount, DateTime txTime) {
//     Transaction newTx = Transaction(
//       amount: txAmount,
//       title: txTitle,
//       date: txTime,
//     );
//     Hive.box('transaction').add(newTx);
//   }

//   // void _deleteTransaction(String id) {
//   //   setState(() {
//   //     _userTransaction.removeWhere((element) => element.id == id);
//   //   });
//   // }

//   void showBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       builder: (_) {
//         return NewTransaction(addTransaction: _addNewTransaction);
//       },
//       backgroundColor: Colors.transparent,
//     );
//   }

//   get revList {
//     Iterable list = _userTransaction.reversed;
//     return list.toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(
//             "My Expenses",
//           ),
//           actions: [
//             IconButton(
//               icon: Icon(
//                   _isNight == false ? Icons.nightlight_round : Icons.wb_sunny),
//               onPressed: () {
//                 setState(() {
//                   _isNight == false ? _isNight = true : _isNight = false;
//                 });
//               },
//             )
//           ],
//         ),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 Chart(recentTransactins: _recentTransactions),
//                 _userTransaction.length != 0
//                     ? TransactionsList(
//                         transactions: revList,
//                       )
//                     : Center(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Image.asset('assets/images/waiting.png',
//                                 fit: BoxFit.cover,
//                                 height: context.percentHeight * 30),
//                             Card(
//                               elevation: 5,
//                               margin: EdgeInsets.symmetric(
//                                   vertical: 20, horizontal: 5),
//                               color: Theme.of(context).primaryColor,
//                               child: Text(
//                                 'There is no transaction',
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 20),
//                               ).p(15),
//                             )
//                           ],
//                         ),
//                       ),
//               ],
//             ),
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           child: Icon(Icons.add),
//           onPressed: () => showBottomSheet(context),
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       ),
//     );
//   }
// }

// // theme: ThemeData(
// //         primarySwatch: Colors.amber,
// //         brightness: _isNight == false ? Brightness.light : Brightness.dark,
// //       ),
