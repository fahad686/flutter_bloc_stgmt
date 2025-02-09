String getWeatherImage(String condition) {
  switch (condition) {
    case "Clear":
      return "assets/images/sunny.png";
    case "Rain":
      return "assets/images/rainy.png";
    case "Hot":
      return "assets/images/heat.png";
    default:
      return "assets/images/sunny.png";
  }
}
