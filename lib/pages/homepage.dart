import 'package:flutter/material.dart';
import 'package:portfolio/pages/about_page.dart';
import 'package:portfolio/widgets/appbaractions.dart';
import 'package:portfolio/widgets/carousel/carousel.dart';

class Homepage extends StatelessWidget{
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text(
          "Lucas Calcada",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(16.0)
          )
        ),
        actions: const [
          AppbarActions(
            title: "Sobre",
            popupContent: AboutPage(),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 16.0),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      "Lucas Calçada",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      "Engineering Student and Developer",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .2,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(999999)),
                    child: Image.asset("assets/profile_placeholder.png")
                  ),
                )
              ],
            ),
            const Spacer(),
            const Carousel()
          ],
        ),
      ),
    );
  }
}