import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Text TeXView")),
      body: MyTeXView(),
    );
  }
}

class MyTeXView extends StatelessWidget {
  Widget build(BuildContext context) {
    return TeXView(
      child: TeXViewColumn(
        children: [
          TeXViewInkWell(
            id: "id_0",
            child: TeXViewColumn(
              children: [
                TeXViewDocument(r"""<h2>Flutter \( \rm\\TeX \)</h2>""",
                    style: TeXViewStyle(textAlign: TeXViewTextAlign.Center)),
                TeXViewContainer(
                  child: TeXViewImage.network(
                      'https://raw.githubusercontent.com/shah-xad/flutter_tex/master/example/assets/flutter_tex_banner.png'),
                  style: TeXViewStyle(
                    margin: TeXViewMargin.all(10),
                    borderRadius: TeXViewBorderRadius.all(20),
                  ),
                ),
                TeXViewDocument(
                  r"""<p>                                
                       When \(a \ne 0 \), there are two solutions to \(ax^2 + bx + c = 0\) and they are
                       $$x_{1,2} = {-b \pm \sqrt{b^2-4ac} \over 2a}.$$</p>""",
                  style: TeXViewStyle.fromCSS(
                      'font-size: 20pt; padding: 15px; color: white; background: green'),
                )
              ],
            ),
          ),
        ],
      ),
      style: TeXViewStyle(
        elevation: 10,
        borderRadius: TeXViewBorderRadius.all(25),
        border: TeXViewBorder.all(TeXViewBorderDecoration(
            borderColor: Colors.blue,
            borderStyle: TeXViewBorderStyle.Solid,
            borderWidth: 5)),
        backgroundColor: Colors.white,
      ),
    );
  }
}
