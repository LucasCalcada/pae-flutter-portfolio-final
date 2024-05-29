import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/widgets/carousel/carouseldata.dart';
import 'package:portfolio/widgets/carousel/icon.dart';

class Carousel extends StatefulWidget{
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel>{
  List<Widget> skillData = [];

  Future<void> loadSkills() async{
    final String content = await rootBundle.loadString("assets/skills.json");
    List<Widget> skills = [];
    List<dynamic> dataList = json.decode(content);
    for(int i = 0; i < dataList.length; i++){
      CarouselData data = CarouselData.fromJSON(dataList[i]);
      skills.add(CarouselIcon(data: data));
    }
    setState(() {
      skillData = skills;
    });
  }

  @override
  initState(){
    super.initState();
    loadSkills();
  }
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16.0)
              )
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
                bottom: 4.0,
                left: 16.0,
                right: 16.0
              ),
              child: Text(
                "Habilidades/Ferramentas",
                style: Theme.of(context).textTheme.titleMedium
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
            ),
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(8.0),
              children: [
                ...skillData,
                //for(int i = 0; i < 10; i++) CarouselIcon(data: testData),
              ],
            ),
          ),
        ],
      ),
    );
  }
}