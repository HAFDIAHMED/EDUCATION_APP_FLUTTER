import 'package:flutter/material.dart';
import 'package:study/provider/solution_provider.dart';
import 'package:study/widgets/drawer.dart';
import 'package:study/widgets/my_appbar.dart';
import 'package:matrix_gesture_detector/matrix_gesture_detector.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:provider/provider.dart';

class BookSolutionScreen extends StatefulWidget {
  final int problemId;
  final String number;

  const BookSolutionScreen({
    Key key,
    @required this.problemId,
    @required this.number,
  }) : super(key: key);
  @override
  _BookSolutionScreenState createState() => _BookSolutionScreenState();
}

class _BookSolutionScreenState extends State<BookSolutionScreen> {
  @override
  Widget build(BuildContext context) {
    Provider.of<SolutionProvider>(context).fatchSolution(widget.problemId);
    return LayoutBuilder(
      builder: (context, boxsizing) {
        return SafeArea(
          child: Scaffold(
            appBar: defaultAppBar(
              title: "Problem: ${widget.number}",
              context: context,
            ),
            drawer: MyDrawer(),
            body: Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 16),
              child: ListView(
                children: <Widget>[
                  ZoomableWidget(
                    // child: Image.network(
                    //   "https://i.imgur.com/4LZUewS.jpg",
                    //   fit: BoxFit.contain,
                    // ),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: boxsizing.maxHeight - 20,
                          width: boxsizing.maxWidth,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        FadeInImage.memoryNetwork(
                          width: boxsizing.maxWidth,
                          placeholder: kTransparentImage,
                          image: 'https://i.imgur.com/4LZUewS.jpg',
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ZoomableWidget extends StatefulWidget {
  final Widget child;

  const ZoomableWidget({Key key, this.child}) : super(key: key);
  @override
  _ZoomableWidgetState createState() => _ZoomableWidgetState();
}

class _ZoomableWidgetState extends State<ZoomableWidget> {
  Matrix4 matrix = Matrix4.identity();
  Matrix4 zerada = Matrix4.identity();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        setState(() {
          matrix = zerada;
        });
      },
      child: MatrixGestureDetector(
        shouldRotate: false,
        onMatrixUpdate: (Matrix4 m, Matrix4 tm, Matrix4 sm, Matrix4 rm) {
          setState(() {
            matrix = m;
          });
        },
        child: Transform(
          transform: matrix,
          child: widget.child,
        ),
      ),
    );
  }
}
