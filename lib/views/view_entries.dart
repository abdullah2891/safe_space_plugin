import 'package:firebase_database/firebase_database.dart';

import '../document_abuse/document_abuse_widget.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class ViewEntriesWidget<Type> extends StatefulWidget {
  final String table;
  const ViewEntriesWidget({Key? key, required this.table}) : super(key: key);

  @override
  _ViewEntriesWidgetState createState() => _ViewEntriesWidgetState();
}

class _ViewEntriesWidgetState extends State<ViewEntriesWidget<Type>> {
  DateTimeRange? calendarSelectedDay;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<DateTime> _list = [];

  @override
  void initState() {
    super.initState();
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  _updateList() async {
    final timestamp = calendarSelectedDay!.start;
    final indexString = "${timestamp.year}/${timestamp.month}/${timestamp.day}";

    DatabaseReference ref =
        FirebaseDatabase.instance.ref("index/${widget.table}/$indexString");

    final DataSnapshot entries = await ref.get();

    List<DateTime> list = [];

    for (final entry in entries.children) {
      list.add(DateTime.parse(entry.value as String));
    }

    setState(() {
      _list = list;
    });
  }

  List<Widget> _getList() {
    List<Widget> list = [];

    for (final entry in _list) {
      list.add(ListTile(
        title: Text(
          "${entry.year}/${entry.month}/${entry.day}",
          style: FlutterFlowTheme.of(context).title3,
        ),
        subtitle: Text(
          "${entry.hour}:${entry.minute}:${entry.second}",
          style: FlutterFlowTheme.of(context).subtitle2,
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Color(0xFF303030),
          size: 20,
        ),
        tileColor: Color(0xFFDFBDDF),
        dense: false,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DocumentAbuseWidget(loadForTimstamp: entry)),
          );
        },
      ));
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF987E98),
      appBar: AppBar(
        backgroundColor: Color(0xFF987E98),
        automaticallyImplyLeading: true,
        title: Text(
          'View Entries',
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                FlutterFlowCalendar(
                  color: Color(0xFF0B6B65),
                  weekFormat: false,
                  weekStartsMonday: false,
                  onChange: (DateTimeRange? newSelectedDate) {
                    setState(() => calendarSelectedDay = newSelectedDate);
                    _updateList();
                  },
                  titleStyle: TextStyle(),
                  dayOfWeekStyle: TextStyle(),
                  dateStyle: TextStyle(),
                  selectedDateStyle: TextStyle(),
                  inactiveDateStyle: TextStyle(),
                ),
                ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: _getList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
