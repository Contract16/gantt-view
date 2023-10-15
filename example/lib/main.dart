import 'package:example/data.dart';
import 'package:flutter/material.dart';
import 'package:gantt_view/controller/gantt_data_controller.dart';
import 'package:gantt_view/gantt_view.dart';
import 'package:gantt_view/model/gantt_event.dart';
import 'package:gantt_view/settings/gantt_settings.dart';
import 'package:gantt_view/settings/theme/gantt_style.dart';
import 'package:gantt_view/settings/theme/grid_scheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late GanttDataController<ExampleEventItem> _controller;

  @override
  void initState() {
    super.initState();
    _controller = GanttDataController<ExampleEventItem>(
      items: Data.dummyData,
      eventBuilder: (item) => GanttEvent(
        label: item.title,
        startDate: item.start,
        endDate: item.end,
      ),
      headerLabelBuilder: (item) => item.group,
      sorters: [
        (a, b) => a.group.compareTo(b.group),
        (a, b) => a.start.compareTo(b.start),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GanttView(
        controller: _controller,
        title: 'My Lovely Gantt',
        subtitle: 'This is a subtitle',
        gridScheme: const GridScheme(
          columnWidth: 30,
          rowSpacing: 0,
          timelineAxisType: TimelineAxisType.daily,
        ),
        style: GanttStyle(
          context,
          eventColor: Colors.blue.shade200,
          eventHeaderColor: Colors.blue.shade400,
          eventLabelColor: Colors.blue.shade900,
          gridColor: Colors.grey.shade300,
          eventLabelPadding: const EdgeInsets.all(4),
          eventRadius: 4,
          timelineColor: Colors.grey.shade300,
        ),
      ),
    );
  }
}
