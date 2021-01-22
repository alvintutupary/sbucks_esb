import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sbucks/src/utils/size_config.dart';
import 'package:sbucks/src/screens/home_screen/home_screen_widgets/home_news.dart';
import 'package:provider/provider.dart';
import 'package:sbucks/src/models/content_model.dart';
import 'package:sbucks/src/blocs/content_bloc.dart';
import 'package:sbucks/src/utils/constant.dart';
import 'package:sbucks/src/widgets/card_image.dart';

class BannerSlider extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BannerSliderState();
  }
}

class _BannerSliderState extends State<BannerSlider> {
  int _current = 0;
  List<Widget> imageSliders(BuildContext context, List<ContentModel> datas) =>
      datas
          .map((item) => Container(
                child: Container(
                  margin: EdgeInsets.all(5.scs),
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      child: Stack(
                        children: <Widget>[
                          InkWell(
                            child: item.images != null && item.images.length > 0
                                ? Image.network(
                                    item.images[0].imageUrl,
                                    fit: BoxFit.cover,
                                    width: 1000.scw,
                                  )
                                : Image.asset(
                                    AppConstant.kEmptyImage,
                                    fit: BoxFit.cover,
                                    width: 1000.scw,
                                    height: 100.sch,
                                  ),
                            onTap: () => Navigator.pushNamed(
                                context, HomeNews.kRouteName,
                                arguments: item),
                          )
                        ],
                      )),
                ),
              ))
          .toList();

  Future<Widget> buildContent() async {
    final _contentBloc = Provider.of<ContentBloc>(context, listen: false);

    List<ContentModel> datas = _contentBloc.contents;
    return Column(children: [
      datas == null && datas.length > 0
          ? CarouselSlider(
              items: imageSliders(context, datas),
              options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 3.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
            )
          : Image.asset(
              AppConstant.kEmptyImage,
              fit: BoxFit.cover,
              width: 1000.scw,
            ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: datas.map((path) {
          int index = datas.indexOf(path);
          return Container(
            width: 8.scs,
            height: 8.scs,
            margin: EdgeInsets.symmetric(vertical: 5.sch, horizontal: 2.scw),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _current == index
                  ? Color.fromRGBO(0, 0, 0, 0.9)
                  : Color.fromRGBO(0, 0, 0, 0.4),
            ),
          );
        }).toList(),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: buildContent(),
      builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
        if (snapshot.hasData) return snapshot.data;
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
