import 'package:flutter/material.dart';

class AppbarActions extends StatelessWidget{
  final String title;
  final StatelessWidget popupContent;

  const AppbarActions({
    super.key,
    //required this.routeName,
    this.title = "Button",
    required this.popupContent
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: (){
          showModalBottomSheet(
            context: context,
            constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width * 0.8,
                maxWidth: MediaQuery.of(context).size.width * 0.8,
                minHeight: MediaQuery.of(context).size.height * 0.5,
                maxHeight: MediaQuery.of(context).size.height * 0.5
            ),
            builder: (BuildContext context){
              return popupContent.build(context);
            }
          );
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0)
            )
          )
        ),
        child: Text(
          title,
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
    );
  }
}