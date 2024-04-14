import 'package:flutter/material.dart';
import 'package:flutter_super_html_viewer/flutter_super_html_viewer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(const Road());
}

const _htmlContent =
    '''<div>                        <script type="text/javascript">window.PlotlyConfig = {MathJaxConfig: 'local'};</script>
        <script charset="utf-8" src="https://cdn.plot.ly/plotly-2.30.0.min.js"></script>                <div id="e4b1d3d9-9550-48f6-96f3-a2c436be2058" class="plotly-graph-div" style="height:100%; width:100%;"></div>            <script type="text/javascript">                                    window.PLOTLYENV=window.PLOTLYENV || {};                                    if (document.getElementById("e4b1d3d9-9550-48f6-96f3-a2c436be2058")) {                    Plotly.newPlot(                        "e4b1d3d9-9550-48f6-96f3-a2c436be2058",                        [{"fillpattern":{"shape":""},"hovertemplate":"Noofvehicle_involved=%{x}\u003cbr\u003eRoad_Type=%{y}\u003cextra\u003e\u003c\u002fextra\u003e","legendgroup":"","line":{"color":"#636efa"},"marker":{"symbol":"circle"},"mode":"lines","name":"","orientation":"h","showlegend":false,"stackgroup":"1","x":[1,1,2,2,1,1,2,2,1,1,2,2,2,2,2,1,2,2,1,1,1,1,2,2,1,1,2,1,1,1,1,2,2,2,2,1,2,1,2,2,1,1,2,1,1,1,1,1,1,2,1,2,1,1,1,1,2,2,2,2,1,1,3,2,2,2,2,2,2,1,1,1,1,2,2,1,1,2,2,1,1,1,2,1,2,2,2,1,2,1,2,1,2,1,1,1,3,2,1,1,1,1,2,2,1,2,1,1,2,1,1,2,3,1,1,1,2,1,2,2,2,2,3,1,1,1,1,1,2,2,1,1,2,1,2,2,1,2,1,1,1,1,2,2,1,1,1,1,2,1,2,2,1,2,2,3,2,2,1,1,2,1,5,1,1,2,1,2,1,1,2,1,1,1,2,1,1,1,2,2,1,1,2,2,1,1,2,1,1,2,1,1,2,1,2,1,2,2,1,1,2,1,1,2,1,2,2,2,2,2,2,2,1,2,1,2,1,2,1,1,1,1,1,1,2,1,1,3,2,1,1,1,1,2,2,1,2,2,1,1,2,1,1,2,2,3,2,1,1,1,2,1,1,3,1,1,1,2,3,1,2,1,1,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,1,1,2,2,1,1,1,2,1,1,1,2,2,1,2,1,2,1,1,1,2,2,1,2,2,1,2,2,1,1,1,1,2,1,2,2,1,2,2,2,2,2,1,2,1,2,1,2,1,2,1,1,2,1,1,1,1,1,2,2,2,1,2,1,2,1,1,1,2,1,1,1,1,2,1,2,1,1,1,2,2,2,2,2,1,2,1,1,2,2,1,1,1,1,1,1,2,1,2,2,1,2,1,1,2,1,1,1,2,1,1,1,2,2,1,1,1,3,1,1,2,2,2,1,1,2,1,2,2,2,1,1,1,1,3,1,2,2,1,1,2,2,2,1,2,1,1,2,2,1,2,2,1,3,2,2,2,3,2,1,1,1,1,1,1,1,1,2,1,1,1,1,2,1,1,1,2,1,2,2,1,1,1,1,1,1,2,2,1,2,2,2,1,2,2,1,2,1,1,1,1,2,2,4,1,1,1,2,2,2,1,1,1,2,1,2,1,2,2,3,2,3,1,1,2,1,2,2,1,1,1,2,1,2,2,1,2,2,1,1,2,1,2,2,2,2,2,1,2,2,1,1,1,1,2,1,2,2,3,2,1,1,2,2,2,2,2,2,1,1,1,2,1,1,1,2,1,1,2,1,2,2,2,2,1,1,1,2,1,2,1,2,1,1,1,1,1,2,2,1,1,2,1,2,1,1,2,2,1,2,2,1,1,1,2,2,2,1,2,2,2,2,1,1,2,1,2,1,2,2,2,1,1,1,2,1,2,1,1,1,1,2,1,2,1,2,1,3,1,2,2,2,1,2,1,1,1,1,2,3,1,1,1,1,1,2,2,2,1,2,2,2,2,1,2,1,1,1,1,2,2],"xaxis":"x","y":["State Highway","State Highway","State Highway","State Highway","State Highway","Village Road","State Highway","Village Road","State Highway","One way","State Highway","State Highway","One way","State Highway","City or Town Road","Village Road","State Highway","One way","State Highway","State Highway","State Highway","One way","State Highway","Village Road","State Highway","NH","State Highway","One way","Village Road","State Highway","City or Town Road","City or Town Road","City or Town Road","City or Town Road","State Highway","Service Road","Major District Road","State Highway","State Highway","State Highway","City or Town Road","Village Road","State Highway","NH","State Highway","One way","NH","Residential Street","Village Road","State Highway","City or Town Road","Village Road","State Highway","Minor District Road","State Highway","State Highway","Major District Road","State Highway","State Highway","Major District Road","State Highway","City or Town Road","State Highway","Village Road","State Highway","State Highway","State Highway","Major District Road","State Highway","State Highway","Minor District Road","State Highway","State Highway","State Highway","Village Road","Village Road","State Highway","State Highway","Major District Road","State Highway","State Highway","State Highway","State Highway","State Highway","State Highway","Major District Road","State Highway","NH","State Highway","State Highway","State Highway","State Highway","Major District Road","State Highway","State Highway","State Highway","State Highway","State Highway","State Highway","State Highway","State Highway","Village Road","Village Road","State Highway","State Highway","Village Road","Others","Major District Road","Major District Road","State Highway","State Highway","Others","State Highway","State Highway","State Highway","Others","State Highway","State Highway","Others","State Highway","State Highway","Major District Road","State Highway","State Highway","Minor District Road","State Highway","State Highway","State Highway","State Highway","Others","State Highway","State Highway","State Highway","Residential Street","State Highway","State Highway","State Highway","Not Applicable","City or Town Road","Others","Others","Others","State Highway","One way","Others","State Highway","Others","One way","State Highway","Others","State Highway","One way","Others","State Highway","One way","State Highway","State Highway","One way","State Highway","State Highway","State Highway","Minor District Road","State Highway","Two way","Others","Others","State Highway","Others","State Highway","State Highway","Others","State Highway","One way","State Highway","Others","Not Applicable","Others","Others","State Highway","State Highway","State Highway","Residential Street","State Highway","One way","State Highway","Others","State Highway","State Highway","Others","State Highway","One way","State Highway","State Highway","Others","Not Applicable","Others","State Highway","State Highway","Others","Others","State Highway","One way","State Highway","State Highway","Others","State Highway","State Highway","State Highway","State Highway","State Highway","Others","State Highway","State Highway","State Highway","State Highway","State Highway","One way","State Highway","One way","State Highway","One way","One way","Others","State Highway","State Highway","State Highway","Residential Street","State Highway","State Highway","One way","State Highway","State Highway","State Highway","One way","State Highway","State Highway","State Highway","State Highway","One way","Others","One way","State Highway","State Highway","One way","State Highway","State Highway","State Highway","Others","State Highway","One way","State Highway","Others","State Highway","State Highway","One way","Others","State Highway","One way","State Highway","State Highway","One way","State Highway","NH","State Highway","State Highway","State Highway","State Highway","State Highway","State Highway","State Highway","State Highway","State Highway","State Highway","State Highway","State Highway","Others","One way","State Highway","State Highway","One way","State Highway","Village Road","Village Road","Village Road","State Highway","NH","Village Road","Others","Not Applicable","State Highway","State Highway","Others","Village Road","NH","State Highway","State Highway","NH","Others","Two way","State Highway","State Highway","State Highway","Others","Village Road","Village Road","NH","Others","Village Road","Others","Others","State Highway","Village Road","Others","NH","Others","State Highway","State Highway","State Highway","NH","State Highway","State Highway","Village Road","Others","State Highway","State Highway","Village Road","Others","State Highway","State Highway","NH","NH","NH","State Highway","State Highway","NH","NH","State Highway","City or Town Road","State Highway","Village Road","Village Road","Others","Village Road","NH","State Highway","NH","State Highway","State Highway","Village Road","State Highway","NH","Village Road","Others","NH","State Highway","Others","Others","State Highway","State Highway","State Highway","City or Town Road","NH","Village Road","NH","Others","NH","Others","Others","State Highway","State Highway","State Highway","Service Road","State Highway","Village Road","State Highway","City or Town Road","NH","Service Road","State Highway","NH","Others","State Highway","Others","Village Road","Service Road","Others","State Highway","Village Road","Village Road","State Highway","State Highway","State Highway","Major District Road","Not Applicable","State Highway","Village Road","State Highway","Others","NH","Others","State Highway","State Highway","State Highway","Others","State Highway","State Highway","State Highway","NH","State Highway","State Highway","City or Town Road","State Highway","State Highway","State Highway","State Highway","State Highway","Others","Others","State Highway","State Highway","State Highway","Village Road","Village Road","State Highway","NH","Others","NH","State Highway","State Highway","State Highway","NH","Village Road","State Highway","State Highway","Others","Minor District Road","State Highway","State Highway","Others","State Highway","Others","Others","Others","Two way","Others","NH","Others","Service Road","NH","Village Road","Others","Two way","State Highway","State Highway","Village Road","Others","State Highway","State Highway","NH","NH","NH","Village Road","NH","Two way","State Highway","Two way","Others","State Highway","State Highway","Two way","State Highway","State Highway","State Highway","State Highway","Others","State Highway","Major District Road","NH","State Highway","State Highway","Others","NH","State Highway","NH","State Highway","State Highway","Others","State Highway","State Highway","Village Road","State Highway","State Highway","Others","State Highway","State Highway","State Highway","State Highway","Others","State Highway","State Highway","State Highway","State Highway","State Highway","State Highway","State Highway","State Highway","Others","State Highway","NH","State Highway","State Highway","NH","State Highway","State Highway","Major District Road","State Highway","State Highway","Minor District Road","State Highway","NH","Major District Road","Others","State Highway","Major District Road","Major District Road","State Highway","State Highway","Two way","NH","State Highway","State Highway","NH","State Highway","State Highway","State Highway","State Highway","State Highway","State Highway","State Highway","State Highway","Two way","Major District Road","State Highway","State Highway","State Highway","State Highway","Major District Road","State Highway","NH","State Highway","Sub Arterial","State Highway","State Highway","State Highway","State Highway","Two way","Sub Arterial","Others","State Highway","Major District Road","NH","Two way","State Highway","One way","State Highway","State Highway","Two way","State Highway","Others","State Highway","State Highway","Others","Two way","Others","NH","State Highway","State Highway","Two way","State Highway","NH","Service Road","State Highway","State Highway","Others","Service Road","State Highway","NH","State Highway","State Highway","Two way","State Highway","One way","State Highway","State Highway","Major District Road","NH","NH","State Highway","Major District Road","State Highway","One way","Others","State Highway","Major District Road","State Highway","State Highway","Minor District Road","State Highway","State Highway","Others","State Highway","One way","Service Road","State Highway","NH","Two way","State Highway","Others","State Highway","State Highway","State Highway","State Highway","State Highway","State Highway","State Highway","NH","Two way","Others","State Highway","State Highway","Two way","State Highway","Major District Road","State Highway","State Highway","Major District Road","NH","Two way","State Highway","State Highway","State Highway","Others","State Highway","State Highway","State Highway","NH","State Highway","State Highway","State Highway","State Highway","Two way","State Highway","Major District Road","State Highway","State Highway","State Highway","Others","Two way","State Highway"],"yaxis":"y","type":"scatter"}],                        {"template":{"data":{"barpolar":[{"marker":{"line":{"color":"white","width":0.5},"pattern":{"fillmode":"overlay","size":10,"solidity":0.2}},"type":"barpolar"}],"bar":[{"error_x":{"color":"#2a3f5f"},"error_y":{"color":"#2a3f5f"},"marker":{"line":{"color":"white","width":0.5},"pattern":{"fillmode":"overlay","size":10,"solidity":0.2}},"type":"bar"}],"carpet":[{"aaxis":{"endlinecolor":"#2a3f5f","gridcolor":"#C8D4E3","linecolor":"#C8D4E3","minorgridcolor":"#C8D4E3","startlinecolor":"#2a3f5f"},"baxis":{"endlinecolor":"#2a3f5f","gridcolor":"#C8D4E3","linecolor":"#C8D4E3","minorgridcolor":"#C8D4E3","startlinecolor":"#2a3f5f"},"type":"carpet"}],"choropleth":[{"colorbar":{"outlinewidth":0,"ticks":""},"type":"choropleth"}],"contourcarpet":[{"colorbar":{"outlinewidth":0,"ticks":""},"type":"contourcarpet"}],"contour":[{"colorbar":{"outlinewidth":0,"ticks":""},"colorscale":[[0.0,"#0d0887"],[0.1111111111111111,"#46039f"],[0.2222222222222222,"#7201a8"],[0.3333333333333333,"#9c179e"],[0.4444444444444444,"#bd3786"],[0.5555555555555556,"#d8576b"],[0.6666666666666666,"#ed7953"],[0.7777777777777778,"#fb9f3a"],[0.8888888888888888,"#fdca26"],[1.0,"#f0f921"]],"type":"contour"}],"heatmapgl":[{"colorbar":{"outlinewidth":0,"ticks":""},"colorscale":[[0.0,"#0d0887"],[0.1111111111111111,"#46039f"],[0.2222222222222222,"#7201a8"],[0.3333333333333333,"#9c179e"],[0.4444444444444444,"#bd3786"],[0.5555555555555556,"#d8576b"],[0.6666666666666666,"#ed7953"],[0.7777777777777778,"#fb9f3a"],[0.8888888888888888,"#fdca26"],[1.0,"#f0f921"]],"type":"heatmapgl"}],"heatmap":[{"colorbar":{"outlinewidth":0,"ticks":""},"colorscale":[[0.0,"#0d0887"],[0.1111111111111111,"#46039f"],[0.2222222222222222,"#7201a8"],[0.3333333333333333,"#9c179e"],[0.4444444444444444,"#bd3786"],[0.5555555555555556,"#d8576b"],[0.6666666666666666,"#ed7953"],[0.7777777777777778,"#fb9f3a"],[0.8888888888888888,"#fdca26"],[1.0,"#f0f921"]],"type":"heatmap"}],"histogram2dcontour":[{"colorbar":{"outlinewidth":0,"ticks":""},"colorscale":[[0.0,"#0d0887"],[0.1111111111111111,"#46039f"],[0.2222222222222222,"#7201a8"],[0.3333333333333333,"#9c179e"],[0.4444444444444444,"#bd3786"],[0.5555555555555556,"#d8576b"],[0.6666666666666666,"#ed7953"],[0.7777777777777778,"#fb9f3a"],[0.8888888888888888,"#fdca26"],[1.0,"#f0f921"]],"type":"histogram2dcontour"}],"histogram2d":[{"colorbar":{"outlinewidth":0,"ticks":""},"colorscale":[[0.0,"#0d0887"],[0.1111111111111111,"#46039f"],[0.2222222222222222,"#7201a8"],[0.3333333333333333,"#9c179e"],[0.4444444444444444,"#bd3786"],[0.5555555555555556,"#d8576b"],[0.6666666666666666,"#ed7953"],[0.7777777777777778,"#fb9f3a"],[0.8888888888888888,"#fdca26"],[1.0,"#f0f921"]],"type":"histogram2d"}],"histogram":[{"marker":{"pattern":{"fillmode":"overlay","size":10,"solidity":0.2}},"type":"histogram"}],"mesh3d":[{"colorbar":{"outlinewidth":0,"ticks":""},"type":"mesh3d"}],"parcoords":[{"line":{"colorbar":{"outlinewidth":0,"ticks":""}},"type":"parcoords"}],"pie":[{"automargin":true,"type":"pie"}],"scatter3d":[{"line":{"colorbar":{"outlinewidth":0,"ticks":""}},"marker":{"colorbar":{"outlinewidth":0,"ticks":""}},"type":"scatter3d"}],"scattercarpet":[{"marker":{"colorbar":{"outlinewidth":0,"ticks":""}},"type":"scattercarpet"}],"scattergeo":[{"marker":{"colorbar":{"outlinewidth":0,"ticks":""}},"type":"scattergeo"}],"scattergl":[{"marker":{"colorbar":{"outlinewidth":0,"ticks":""}},"type":"scattergl"}],"scattermapbox":[{"marker":{"colorbar":{"outlinewidth":0,"ticks":""}},"type":"scattermapbox"}],"scatterpolargl":[{"marker":{"colorbar":{"outlinewidth":0,"ticks":""}},"type":"scatterpolargl"}],"scatterpolar":[{"marker":{"colorbar":{"outlinewidth":0,"ticks":""}},"type":"scatterpolar"}],"scatter":[{"fillpattern":{"fillmode":"overlay","size":10,"solidity":0.2},"type":"scatter"}],"scatterternary":[{"marker":{"colorbar":{"outlinewidth":0,"ticks":""}},"type":"scatterternary"}],"surface":[{"colorbar":{"outlinewidth":0,"ticks":""},"colorscale":[[0.0,"#0d0887"],[0.1111111111111111,"#46039f"],[0.2222222222222222,"#7201a8"],[0.3333333333333333,"#9c179e"],[0.4444444444444444,"#bd3786"],[0.5555555555555556,"#d8576b"],[0.6666666666666666,"#ed7953"],[0.7777777777777778,"#fb9f3a"],[0.8888888888888888,"#fdca26"],[1.0,"#f0f921"]],"type":"surface"}],"table":[{"cells":{"fill":{"color":"#EBF0F8"},"line":{"color":"white"}},"header":{"fill":{"color":"#C8D4E3"},"line":{"color":"white"}},"type":"table"}]},"layout":{"annotationdefaults":{"arrowcolor":"#2a3f5f","arrowhead":0,"arrowwidth":1},"autotypenumbers":"strict","coloraxis":{"colorbar":{"outlinewidth":0,"ticks":""}},"colorscale":{"diverging":[[0,"#8e0152"],[0.1,"#c51b7d"],[0.2,"#de77ae"],[0.3,"#f1b6da"],[0.4,"#fde0ef"],[0.5,"#f7f7f7"],[0.6,"#e6f5d0"],[0.7,"#b8e186"],[0.8,"#7fbc41"],[0.9,"#4d9221"],[1,"#276419"]],"sequential":[[0.0,"#0d0887"],[0.1111111111111111,"#46039f"],[0.2222222222222222,"#7201a8"],[0.3333333333333333,"#9c179e"],[0.4444444444444444,"#bd3786"],[0.5555555555555556,"#d8576b"],[0.6666666666666666,"#ed7953"],[0.7777777777777778,"#fb9f3a"],[0.8888888888888888,"#fdca26"],[1.0,"#f0f921"]],"sequentialminus":[[0.0,"#0d0887"],[0.1111111111111111,"#46039f"],[0.2222222222222222,"#7201a8"],[0.3333333333333333,"#9c179e"],[0.4444444444444444,"#bd3786"],[0.5555555555555556,"#d8576b"],[0.6666666666666666,"#ed7953"],[0.7777777777777778,"#fb9f3a"],[0.8888888888888888,"#fdca26"],[1.0,"#f0f921"]]},"colorway":["#636efa","#EF553B","#00cc96","#ab63fa","#FFA15A","#19d3f3","#FF6692","#B6E880","#FF97FF","#FECB52"],"font":{"color":"#2a3f5f"},"geo":{"bgcolor":"white","lakecolor":"white","landcolor":"white","showlakes":true,"showland":true,"subunitcolor":"#C8D4E3"},"hoverlabel":{"align":"left"},"hovermode":"closest","mapbox":{"style":"light"},"paper_bgcolor":"white","plot_bgcolor":"white","polar":{"angularaxis":{"gridcolor":"#EBF0F8","linecolor":"#EBF0F8","ticks":""},"bgcolor":"white","radialaxis":{"gridcolor":"#EBF0F8","linecolor":"#EBF0F8","ticks":""}},"scene":{"xaxis":{"backgroundcolor":"white","gridcolor":"#DFE8F3","gridwidth":2,"linecolor":"#EBF0F8","showbackground":true,"ticks":"","zerolinecolor":"#EBF0F8"},"yaxis":{"backgroundcolor":"white","gridcolor":"#DFE8F3","gridwidth":2,"linecolor":"#EBF0F8","showbackground":true,"ticks":"","zerolinecolor":"#EBF0F8"},"zaxis":{"backgroundcolor":"white","gridcolor":"#DFE8F3","gridwidth":2,"linecolor":"#EBF0F8","showbackground":true,"ticks":"","zerolinecolor":"#EBF0F8"}},"shapedefaults":{"line":{"color":"#2a3f5f"}},"ternary":{"aaxis":{"gridcolor":"#DFE8F3","linecolor":"#A2B1C6","ticks":""},"baxis":{"gridcolor":"#DFE8F3","linecolor":"#A2B1C6","ticks":""},"bgcolor":"white","caxis":{"gridcolor":"#DFE8F3","linecolor":"#A2B1C6","ticks":""}},"title":{"x":0.05},"xaxis":{"automargin":true,"gridcolor":"#EBF0F8","linecolor":"#EBF0F8","ticks":"","title":{"standoff":15},"zerolinecolor":"#EBF0F8","zerolinewidth":2},"yaxis":{"automargin":true,"gridcolor":"#EBF0F8","linecolor":"#EBF0F8","ticks":"","title":{"standoff":15},"zerolinecolor":"#EBF0F8","zerolinewidth":2}}},"xaxis":{"anchor":"y","domain":[0.0,1.0],"title":{"text":"Noofvehicle_involved"}},"yaxis":{"anchor":"x","domain":[0.0,1.0],"title":{"text":"Road_Type"}},"legend":{"tracegroupgap":0},"title":{"text":"\u003cb\u003eNoofvehicle_involved vs Road_Type\u003c\u002fb\u003e"}},                        {"responsive": true}                    )                };                            </script>        </div>''';

class Road extends StatelessWidget {
  const Road({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ROAD TYPE ANALYSIS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'ROAD TYPE ANALYSIS'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<SalesData> _chartData1;
  late List<SalesData> _chartData2;

  @override
  void initState() {
    _chartData1 = getChartData1();
    _chartData2 = getChartData2();
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
                  'ROAD_TYPE ANALYSIS',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30.0),
            SizedBox(
              height: 500,
              child: SfCartesianChart(
                title: const ChartTitle(
                  text: 'ROAD TYPE ANALYSIS 1',
                ),
                legend: const Legend(isVisible: false),
                series: <CartesianSeries>[
                  BarSeries<SalesData, String>(
                    dataSource: _chartData1,
                    xValueMapper: (SalesData sales, _) => sales.month,
                    yValueMapper: (SalesData sales, _) => sales.victims,
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                  ),
                ],
                primaryXAxis: const CategoryAxis(),
                primaryYAxis: const NumericAxis(
                  title: AxisTitle(text: 'Number of Victims'),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              height: 500,
              child: SfCartesianChart(
                title: const ChartTitle(text: 'ROAD TYPE ANALYSIS 2'),
                legend: const Legend(isVisible: false),
                series: <CartesianSeries>[
                  BarSeries<SalesData, String>(
                    dataSource: _chartData2,
                    xValueMapper: (SalesData sales, _) => sales.month,
                    yValueMapper: (SalesData sales, _) => sales.victims,
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                  ),
                ],
                primaryXAxis: const CategoryAxis(),
                primaryYAxis: const NumericAxis(
                  title: AxisTitle(text: 'Number of Victims'),
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            HtmlContentViewer(
              htmlContent: _htmlContent,
              initialContentHeight: MediaQuery.of(context).size.height,
              initialContentWidth: MediaQuery.of(context).size.width,
            )
          ],
        ),
      ),
    );
  }

  List<SalesData> getChartData1() {
    final List<SalesData> chartData = [
      SalesData('NH', 91494),
      SalesData('state highway', 62091),
      SalesData('city or town road', 20073),
      SalesData('village road', 16638),
      SalesData('two way', 12815),
      SalesData('others', 58839),
    ];
    return chartData;
  }

  List<SalesData> getChartData2() {
    final List<SalesData> chartData = [
      SalesData('major district road', 5594),
      SalesData('residental street', 5583),
      SalesData('minor district road', 5482),
      SalesData('service road', 4249),
      SalesData('arterial', 1610),
      SalesData('not applicable', 7011),
    ];
    return chartData;
  }
}

class SalesData {
  SalesData(this.month, this.victims);
  final String month;
  final int victims;
}
