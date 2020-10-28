import 'package:flutter/material.dart';
import 'package:study/constants.dart';
import 'package:study/models/card_hight.dart';
import 'package:study/ui/sizeInfo.dart';

class BookCardSmall extends StatelessWidget {
  const BookCardSmall({
    Key key,
    @required this.sizingInformation,
    @required this.edition,
    @required this.name,
    @required this.auths,
    @required this.poster,
    @required this.press,
  }) : super(key: key);

  final SizingInformation sizingInformation;
  final int edition;
  final String name;
  final String auths;
  final String poster;
  final Function press;

  @override
  Widget build(BuildContext context) {
    double cardHeight = getCardHightSmall(sizingInformation);
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Material(
        color: kWhitColor,
        child: InkWell(
          onTap: press,
          child: Container(
            padding:
                EdgeInsets.all(sizingInformation.localWidgetSize.width * .03),
            height: sizingInformation.localWidgetSize.width * cardHeight,
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
                  width: sizingInformation.screenSize.width * .4,
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
      ),
    );
  }
}
