import 'package:flutter/material.dart';

import '../../flutter_flow/flutter_flow_calendar.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../database/database_proxy.dart';

abstract class AbstractTimestampedWidget extends StatefulWidget {
  const AbstractTimestampedWidget({super.key});

  Widget clone(DateTime timestamp);
}

class ViewEntriesWidget extends StatefulWidget {
  final String table;
  final AbstractTimestampedWidget parent;
  const ViewEntriesWidget({Key? key, required this.table, required this.parent})
      : super(key: key);

  @override
  State<ViewEntriesWidget> createState() => _ViewEntriesWidgetState();
}

class _ViewEntriesWidgetState extends State<ViewEntriesWidget> {
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

    final entries =
        await DatabaseProxy(widget.table).getIndexedTimes(timestamp);

    List<DateTime> list = [];

    for (final entry in entries) {
      list.add(entry);
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
        tileColor: const Color(0xFFDFBDDF),
        dense: false,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => widget.parent.clone(entry)),
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
      backgroundColor: const Color(0xFF987E98),
      appBar: AppBar(
        backgroundColor: const Color(0xFF987E98),
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
        actions: const [],
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                FlutterFlowCalendar(
                  color: const Color(0xFF0B6B65),
                  weekFormat: false,
                  weekStartsMonday: false,
                  onChange: (DateTimeRange? newSelectedDate) {
                    setState(() => calendarSelectedDay = newSelectedDate);
                    _updateList();
                  },
                  titleStyle: const TextStyle(),
                  dayOfWeekStyle: const TextStyle(),
                  dateStyle: const TextStyle(),
                  selectedDateStyle: const TextStyle(),
                  inactiveDateStyle: const TextStyle(),
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
