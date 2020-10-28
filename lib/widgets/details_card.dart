import 'package:flutter/material.dart';
import 'package:study/constants.dart';
import 'package:study/ui/sizeInfo.dart';
import 'package:study/ui/ui_utils.dart';

class BookDetailsCard extends StatelessWidget {
  const BookDetailsCard({
    @required this.edition,
    @required this.name,
    @required this.auths,
    @required this.poster,
  });
  final int edition;
  final String name;
  final String auths;
  final String poster;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return LayoutBuilder(
      builder: (context, boxSizing) {
        var sizingInformation = SizingInformation(
          orientation: mediaQuery.orientation,
          deviceType: getDeviceType(mediaQuery),
          screenSize: mediaQuery.size,
          localWidgetSize: Size(boxSizing.maxWidth, boxSizing.maxHeight),
        );
        return Row(
          children: <Widget>[
            Material(
              elevation: 3,
              color: kWhitColor,
              child: Container(
                padding: EdgeInsets.all(boxSizing.maxWidth * .03),
                height: 130,
                child: Row(
                  children: <Widget>[
                    Image.network(
                      poster,
                      fit: BoxFit.contain,
                      width: sizingInformation.localWidgetSize.width * .18,
                    ),
                    SizedBox(
                      width: sizingInformation.localWidgetSize.width * .04,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: sizingInformation.screenSize.width * .0),
                      width: sizingInformation.localWidgetSize.width * .72,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "$name",
                            style: Theme.of(context).textTheme.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "Edition: $edition",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.caption,
                          ),
                          Text(
                            auths,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // SizedBox(
            //   width: 15,
            // ),
          ],
        );
      },
    );
  }
}
