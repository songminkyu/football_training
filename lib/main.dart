import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TrainingList(),
    );
  }
}

class TrainingList extends StatefulWidget {
  @override
  _TrainingListState createState() => _TrainingListState();
}

class _TrainingListState extends State<TrainingList> {
  final Map<String, List<String>> trainingLinks = {
    '윤청구 퍼포먼스 트레이닝': [
      'https://www.instagram.com/ycg_performance_official/',
      'https://www.instagram.com/dr.yuncheonggu/',
      'https://www.instagram.com/reel/C5hzkCoyfF_/?igsh=ZWUzZGV2MjMwaGl6',
      'https://www.youtube.com/watch?v=Z-ZprgK6LhM',
      '1. Two leg jumping',
      '2. Front hopping',
      '3. Side hopping',
      '4. Front pitching',
      '5. Side pitching',
      '6. Side moving pitching',
      '7. Side pitching jump',
      '8. Figure eight coordination',
      '9. Landmine Squat to Rotational Press'
    ],
    'Other Profiles': [
      'https://www.instagram.com/marcusriosofficial/',
      'https://www.instagram.com/alexveith_athletics/',
      'https://www.instagram.com/sportsmenacademy/',
      'https://www.instagram.com/ms_physical_official/',
      'https://www.instagram.com/dailymove.official/',
      'https://www.instagram.com/laget_om_ka/',
      'https://www.instagram.com/top.notch.egypt/',
      'https://www.instagram.com/exsplosive_athlete/',
      'https://www.instagram.com/sprinterssong/',
      'https://www.instagram.com/rehabexercise/',
      'https://www.instagram.com/colintakahashi19/',
      'https://www.instagram.com/troygallen/',
      'https://www.instagram.com/thulani_chipanga/',
      'https://www.instagram.com/pierreseliteperformance/'
      // Add other links similarly
    ],
    '드리블': [
      'https://www.instagram.com/regate_takuya/',
      'https://www.instagram.com/tamakou0908/',
      'https://www.instagram.com/regate_yuma/',
      'https://www.instagram.com/regate_satsuki/',
      'https://www.instagram.com/football_herfeiha/',
      // Add other links similarly
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('축구 트레이닝 목록'),
      ),
      body: ListView.builder(
        itemCount: trainingLinks.keys.length,
        itemBuilder: (context, index) {
          String key = trainingLinks.keys.elementAt(index);
          return ExpansionTile(
            title: Text(key),
            children: trainingLinks[key]!.map((item) => ListTile(
              title: Text(item),
              onTap: item.startsWith('https') ? () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WebViewPage(url: item),
                ),
              ) : null, // Only enable tapping for links
            )).toList(),
          );
        },
      ),
    );
  }
}

class WebViewPage extends StatelessWidget {
  final String url;

  WebViewPage({required this.url});

  @override
  Widget build(BuildContext context) {
    WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(url));

    return Scaffold(
      appBar: AppBar(
        title: Text('웹 페이지'),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
