import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './models/transaction.dart';
import './widgets/chart.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';

class Section4MainApp extends StatelessWidget {
  const Section4MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
      primarySwatch: Colors.purple,
      colorScheme: const ColorScheme.light(
        error: Colors.red,
      ),
      fontFamily: 'Quicksand',
      textTheme: ThemeData.light().textTheme.copyWith(
            titleSmall: const TextStyle(
              fontFamily: 'Open Sans',
              fontSize: 18,
            ),
            labelSmall: const TextStyle(
              color: Colors.white,
            ),
          ),
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
          fontFamily: 'Open Sans',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    return Platform.isIOS
        ? const CupertinoApp(
            debugShowCheckedModeBanner: true,
            title: 'Personal Expenses',
            theme: CupertinoThemeData(
              primaryColor: Colors.purple,
              brightness: Brightness.light,
            ),
            home: Section4HomePage(),
          )
        : MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Personal Expenses',
            theme: theme.copyWith(
              colorScheme: theme.colorScheme.copyWith(secondary: Colors.amber),
            ),
            home: const Section4HomePage(),
          );
  }
}

class Section4HomePage extends StatefulWidget {
  const Section4HomePage({Key? key}) : super(key: key);

  @override
  State<Section4HomePage> createState() => _Section4HomePageState();
}

class _Section4HomePageState extends State<Section4HomePage> with WidgetsBindingObserver {
  final List<Transaction> _userTransactions = [];
  bool _showChart = false;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: chosenDate,
      id: UniqueKey().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((element) => element.id == id);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: NewTransaction(_addNewTransaction),
        );
      },
    );
  }

  List<Widget> _buildLandscapeContent(MediaQueryData mediaQuery, PreferredSizeWidget appBar, Widget txListWidget) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Show Chart',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Switch.adaptive(
            value: _showChart,
            activeColor: Theme.of(context).colorScheme.secondary,
            onChanged: (val) {
              setState(() {
                _showChart = val;
              });
            },
          ),
        ],
      ),
      _showChart
          ? SizedBox(
              height: (mediaQuery.size.height - appBar.preferredSize.height - mediaQuery.padding.top) * 0.7,
              child: Chart(_recentTransactions),
            )
          : txListWidget
    ];
  }

  List<Widget> _buildPortraitContent(MediaQueryData mediaQuery, PreferredSizeWidget appBar, Widget txListWidget) {
    return [
      SizedBox(
        height: (mediaQuery.size.height - appBar.preferredSize.height - mediaQuery.padding.top) * 0.2,
        child: Chart(_recentTransactions),
      ),
      txListWidget
    ];
  }

  /// Erstellt die AppBar in Abh??ngigkeit der Plattform.
  Widget _buildAppBar() {
    return Platform.isIOS
        ? CupertinoNavigationBar(
            middle: const Text(
              'Personal Expenses',
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GestureDetector(
                  child: const Icon(CupertinoIcons.add),
                  onTap: () => _startAddNewTransaction(context),
                ),
              ],
            ),
          )
        : AppBar(
            title: const Text(
              'Personal Expenses',
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () => _startAddNewTransaction(context),
              ),
            ],
          );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;

    final appBar = _buildAppBar();

    final txListWidget = SizedBox(
      height: (mediaQuery.size.height - (appBar as PreferredSizeWidget).preferredSize.height - mediaQuery.padding.top) * 0.75,
      child: TransactionList(_userTransactions, _deleteTransaction),
    );

    final pageBody = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            if (isLandscape) ..._buildLandscapeContent(mediaQuery, appBar, txListWidget),
            if (!isLandscape) ..._buildPortraitContent(mediaQuery, appBar, txListWidget),
          ],
        ),
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: appBar as ObstructingPreferredSizeWidget,
            child: pageBody,
          )
        : Scaffold(
            appBar: appBar,
            body: pageBody,
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    child: const Icon(Icons.add),
                    onPressed: () => _startAddNewTransaction(context),
                  ),
          );
  }
}
