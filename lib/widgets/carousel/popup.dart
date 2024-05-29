import 'package:flutter/material.dart';
import 'package:portfolio/widgets/carousel/carouseldata.dart';
import 'package:auto_size_text/auto_size_text.dart';

class CarouselIconPopup extends StatelessWidget{
  final CarouselData data;

  const CarouselIconPopup({
    super.key,
    required this.data
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(8.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .1,
              child: AspectRatio(
                aspectRatio: 1,
                child: Image(
                  image: AssetImage(data.iconURL),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const Spacer(),
            Column(
              children: [
                Text(
                  data.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16.0),
                Expanded(
                  child: AutoSizeText(
                    data.description, 
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}