import 'package:flutter/material.dart';
import 'package:sbucks/src/utils/size_config.dart';
import 'package:sbucks/src/widgets/rounded_border_button.dart';
import 'package:sbucks/src/screens/home_screen/home_screen_widgets/home_news.dart';
import 'package:provider/provider.dart';
import 'package:sbucks/src/blocs/content_bloc.dart';
import 'package:sbucks/src/utils/constant.dart';
import 'package:sbucks/src/models/content_model.dart';

Future<Widget> _buildMenuList(
  BuildContext context,
) async {
  final contentBloc = Provider.of<ContentBloc>(context, listen: false);
  final result = await contentBloc.fetchContentbyType(AppConstant.kWhatsNew);
  double imageSize = 85.scs;

  List<ContentModel> datas = result.body;

  return ListView.builder(
      itemCount: datas.length,
      itemBuilder: (context, index) {
        bool isLeft = index % 2 == 0;
        return Padding(
          padding: EdgeInsets.all(8.scs),
          child: Row(
            children: [
              circleImage(!isLeft, imageSize, datas[index].images[0].imageUrl),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(3.scs),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 250.scw,
                          child: Text(
                            datas[index].titleEn,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 15.scs),
                          ),
                        ),
                        SizedBox(
                          width: 250.scw,
                          child: Text(
                            datas[index].summaryEn,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 12.scs),
                          ),
                        ),
                      ],
                    ),
                  ),
                  RoundedBorderButton(
                    text: "View Detail",
                    onPressed: () => Navigator.pushNamed(
                        context, HomeNews.kRouteName,
                        arguments: datas[index]),
                    color: isLeft ? Colors.brown[900] : Colors.amber[100],
                    borderColor: isLeft ? Colors.white : Colors.brown[900],
                    hPadding: 15.scs,
                    vPadding: 15.scs,
                    textColor: isLeft ? Colors.white : Colors.brown[900],
                    textSize: 15.scs,
                    borderThick: 2.scs,
                    radius: 15,
                  ),
                ],
              ),
              circleImage(isLeft, imageSize, datas[index].images[0].imageUrl),
            ],
          ),
        );
      });
}

Widget circleImage(
  bool isShow,
  double imageSize,
  String imagePath,
) =>
    isShow
        ? Container(
            width: imageSize,
            height: imageSize,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: imagePath != null
                      ? Image.network(imagePath)
                      : AssetImage(AppConstant.kEmptyImage),
                )),
          )
        : Container();

class MenuList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MenuListState();
  }
}

class _MenuListState extends State<MenuList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        builder: (context, snapshot) => snapshot.hasData
            ? snapshot.data
            : Center(
                child: CircularProgressIndicator(),
              ),
        future: _buildMenuList(context));
  }
}
