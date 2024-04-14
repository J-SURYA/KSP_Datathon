// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_super_html_viewer/flutter_super_html_viewer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const LocationAccident());
}

const String url =
    'https://www.google.co.in/maps/@12.9539974,77.6309395,11z?entry=ttu';

void _launchURL() async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

const _htmlContent = '''
<html>
<head><meta charset="utf-8" /></head>
<body>
    <div>                        <script type="text/javascript">window.PlotlyConfig = {MathJaxConfig: 'local'};</script>
        <script charset="utf-8" src="https://cdn.plot.ly/plotly-2.30.0.min.js"></script>                <div id="d3d83aa6-4cf2-4f8c-a96c-21c67aff05a2" class="plotly-graph-div" style="height:100%; width:100%;"></div>            <script type="text/javascript">                                    window.PLOTLYENV=window.PLOTLYENV || {};                                    if (document.getElementById("d3d83aa6-4cf2-4f8c-a96c-21c67aff05a2")) {                    Plotly.newPlot(                        "d3d83aa6-4cf2-4f8c-a96c-21c67aff05a2",                        [{"hovertemplate":"Month=%{x}\u003cbr\u003eindex=%{y}\u003cextra\u003e\u003c\u002fextra\u003e","legendgroup":"","marker":{"color":"#000001"},"name":"","orientation":"h","showlegend":false,"x":[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,9,9,9,9,9,9,9,9,9,9,9,9,9,9,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,11,11,11,11,11],"xaxis":"x","y":[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403,404,405,406,407,408,409,410,411,412,413,414,415,416,417,418,419,420,421,422,423,424,425,426,427,428,429,430,431,432,433,434,435,436,437,438,439,440,441,442,443,444,445,446,447,448,449,450,451,452,453,454,455,456,457,458,459,460,461,462,463,464,465,466,467,468,469,470,471,472,473,474,475,476,477,478,479,480,481,482,483,484,485,486,487,488,489,490,491,492,493,494,495,496,497,498,499,500,501,502,503,504,505,506,507,508,509,510,511,512,513,514,515,516,517,518,519,520,521,522,523,524,525,526,527,528,529,530,531,532,533,534,535,536,537,538,539,540,541,542,543,544,545,546,547,548,549,550,551,552,553,554,555,556,557,558,559,560],"yaxis":"y","type":"funnel"}],                        {"template":{"data":{"candlestick":[{"decreasing":{"line":{"color":"#000033"}},"increasing":{"line":{"color":"#000032"}},"type":"candlestick"}],"contourcarpet":[{"colorscale":[[0.0,"#000011"],[0.1111111111111111,"#000012"],[0.2222222222222222,"#000013"],[0.3333333333333333,"#000014"],[0.4444444444444444,"#000015"],[0.5555555555555556,"#000016"],[0.6666666666666666,"#000017"],[0.7777777777777778,"#000018"],[0.8888888888888888,"#000019"],[1.0,"#000020"]],"type":"contourcarpet"}],"contour":[{"colorscale":[[0.0,"#000011"],[0.1111111111111111,"#000012"],[0.2222222222222222,"#000013"],[0.3333333333333333,"#000014"],[0.4444444444444444,"#000015"],[0.5555555555555556,"#000016"],[0.6666666666666666,"#000017"],[0.7777777777777778,"#000018"],[0.8888888888888888,"#000019"],[1.0,"#000020"]],"type":"contour"}],"heatmap":[{"colorscale":[[0.0,"#000011"],[0.1111111111111111,"#000012"],[0.2222222222222222,"#000013"],[0.3333333333333333,"#000014"],[0.4444444444444444,"#000015"],[0.5555555555555556,"#000016"],[0.6666666666666666,"#000017"],[0.7777777777777778,"#000018"],[0.8888888888888888,"#000019"],[1.0,"#000020"]],"type":"heatmap"}],"histogram2d":[{"colorscale":[[0.0,"#000011"],[0.1111111111111111,"#000012"],[0.2222222222222222,"#000013"],[0.3333333333333333,"#000014"],[0.4444444444444444,"#000015"],[0.5555555555555556,"#000016"],[0.6666666666666666,"#000017"],[0.7777777777777778,"#000018"],[0.8888888888888888,"#000019"],[1.0,"#000020"]],"type":"histogram2d"}],"icicle":[{"textfont":{"color":"white"},"type":"icicle"}],"sankey":[{"textfont":{"color":"#000036"},"type":"sankey"}],"scatter":[{"marker":{"line":{"width":0}},"type":"scatter"}],"table":[{"cells":{"fill":{"color":"#000038"},"font":{"color":"#000037"},"line":{"color":"#000039"}},"header":{"fill":{"color":"#000040"},"font":{"color":"#000036"},"line":{"color":"#000039"}},"type":"table"}],"waterfall":[{"connector":{"line":{"color":"#000036","width":2}},"decreasing":{"marker":{"color":"#000033"}},"increasing":{"marker":{"color":"#000032"}},"totals":{"marker":{"color":"#000034"}},"type":"waterfall"}]},"layout":{"coloraxis":{"colorscale":[[0.0,"#000011"],[0.1111111111111111,"#000012"],[0.2222222222222222,"#000013"],[0.3333333333333333,"#000014"],[0.4444444444444444,"#000015"],[0.5555555555555556,"#000016"],[0.6666666666666666,"#000017"],[0.7777777777777778,"#000018"],[0.8888888888888888,"#000019"],[1.0,"#000020"]]},"colorscale":{"diverging":[[0.0,"#000021"],[0.1,"#000022"],[0.2,"#000023"],[0.3,"#000024"],[0.4,"#000025"],[0.5,"#000026"],[0.6,"#000027"],[0.7,"#000028"],[0.8,"#000029"],[0.9,"#000030"],[1.0,"#000031"]],"sequential":[[0.0,"#000011"],[0.1111111111111111,"#000012"],[0.2222222222222222,"#000013"],[0.3333333333333333,"#000014"],[0.4444444444444444,"#000015"],[0.5555555555555556,"#000016"],[0.6666666666666666,"#000017"],[0.7777777777777778,"#000018"],[0.8888888888888888,"#000019"],[1.0,"#000020"]],"sequentialminus":[[0.0,"#000011"],[0.1111111111111111,"#000012"],[0.2222222222222222,"#000013"],[0.3333333333333333,"#000014"],[0.4444444444444444,"#000015"],[0.5555555555555556,"#000016"],[0.6666666666666666,"#000017"],[0.7777777777777778,"#000018"],[0.8888888888888888,"#000019"],[1.0,"#000020"]]},"colorway":["#000001","#000002","#000003","#000004","#000005","#000006","#000007","#000008","#000009","#000010"]}},"xaxis":{"anchor":"y","domain":[0.0,1.0],"title":{"text":"Month"}},"yaxis":{"anchor":"x","domain":[0.0,1.0],"title":{"text":"index"}},"legend":{"tracegroupgap":0},"margin":{"t":60}},                        {"responsive": true}                    )                };                            </script>        </div>
</body>
</html>
''';

class LocationAccident extends StatelessWidget {
  const LocationAccident({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WebView Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<GDPData> _chartData = [];
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: ClipRRect(
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(05)),
          child: Container(
            width: double.infinity,
            color: Colors.blue,
            child: AppBar(
              leading: Container(
                padding: const EdgeInsets.only(left: 10), // Adjust the padding
              ),
              title: Container(
                padding:
                    const EdgeInsets.only(top: 10), // Adjust the top padding
                child: const Text(
                  'LOCATION ANALYSIS',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 10,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30.0),
                  SizedBox(
                    height: 500,
                    child: SfCartesianChart(
                      title: const ChartTitle(
                          text: 'MAXIMUM ACCIDENT IN VARIOUS CITY',
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue)),
                      legend: const Legend(isVisible: true),
                      tooltipBehavior: _tooltipBehavior,
                      series: <CartesianSeries>[
                        BarSeries<GDPData, String>(
                          name: 'CITY(top 5)',
                          dataSource: _chartData,
                          xValueMapper: (GDPData gdp, _) => gdp.continent,
                          yValueMapper: (GDPData gdp, _) => gdp.gdp,
                          dataLabelSettings:
                              const DataLabelSettings(isVisible: true),
                          enableTooltip: true,
                        )
                      ],
                      primaryXAxis: const CategoryAxis(),
                      primaryYAxis: NumericAxis(
                        edgeLabelPlacement: EdgeLabelPlacement.shift,
                        numberFormat: NumberFormat.currency(
                            locale: 'en_US', symbol: '', decimalDigits: 0),
                        title: const AxisTitle(text: 'NO OF ACCIDENT'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  HtmlContentViewer(
                    htmlContent: _htmlContent,
                    initialContentHeight: MediaQuery.of(context).size.height,
                    initialContentWidth: MediaQuery.of(context).size.width,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30.0),
          const Center(
            child: ElevatedButton(
              onPressed: _launchURL,
              child: Text('See Where'),
            ),
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData('bengaluru city', 34526),
      GDPData('Tumaruku', 16738),
      GDPData('Bengaluru dist', 15436),
      GDPData('Hassan', 15365),
      GDPData('Mandya', 15295),
      GDPData('Belagivi dist', 15058),
    ];
    return chartData;
  }
}

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final double gdp;
}
