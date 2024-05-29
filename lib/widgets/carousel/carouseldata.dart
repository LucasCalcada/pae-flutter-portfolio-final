class CarouselData{
  String iconURL = '';
  String title = '';
  String description = '';

  CarouselData(String urlString, String titleString, String descriptionString){
    iconURL = urlString;
    title = titleString;
    description = descriptionString;
  }

  static CarouselData fromJSON(Map<String, dynamic> data){
    String url = data["iconURL"] as String;
    String title = data["title"] as String;
    String description = data["description"] as String;
    return CarouselData(url, title, description);
  }
}