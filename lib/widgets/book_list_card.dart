import 'package:flutter/material.dart';
import 'package:study/constants.dart';
import 'package:study/models/card_hight.dart';
import 'package:study/ui/sizeInfo.dart';
import 'package:study/ui/ui_utils.dart';

class BookListCard extends StatelessWidget {
  const BookListCard({
    @required this.edition,
    @required this.name,
    @required this.auths,
    @required this.poster,
    @required this.press,
  });
  final int edition;
  final String name;
  final String auths;
  final String poster;
  final Function press;

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
        double cardHeight = getCardHight(sizingInformation);
        return Material(
          color: kWhitColor,
          child: InkWell(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(boxSizing.maxWidth * .03),
              height: sizingInformation.screenSize.width * cardHeight,
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
                    width: sizingInformation.localWidgetSize.width * .72,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "$name ($edition)",
                          style: Theme.of(context).textTheme.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          auths,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.caption,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
