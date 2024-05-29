import 'package:flutter/material.dart';
import 'package:portfolio/widgets/carousel/carouseldata.dart';
import 'package:portfolio/widgets/carousel/popup.dart';

class CarouselIcon extends StatelessWidget{
  final CarouselData data;
  const CarouselIcon({
    super.key,
    required this.data
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: AspectRatio(
        aspectRatio: 1,
        child: SizedBox(
          height: double.infinity,
          child: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width * 0.8,
                  maxWidth: MediaQuery.of(context).size.width * 0.8,
                  minHeight: MediaQuery.of(context).size.height * 0.2,
                  maxHeight: MediaQuery.of(context).size.height * 0.2
                ),
                builder: (BuildContext context){
                  return CarouselIconPopup(
                    data: data
                  );
                }
              );
            },
            child: Image(
              image: AssetImage(data.iconURL),
              fit: BoxFit.contain,
              filterQuality: FilterQuality.high,
            ),
          ),
        ),
      ),
    );
  }
}