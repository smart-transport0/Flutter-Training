class Utilities {
  String currentDateTime() {
    var currentDateTime = DateTime.now();
    return currentDateTime.year.toString() +
        correctData(currentDateTime.month.toString()) +
        correctData(currentDateTime.day.toString()) +
        correctData(currentDateTime.hour.toString()) +
        correctData(currentDateTime.minute.toString()) +
        correctData(currentDateTime.second.toString());
  }

  String correctData(String inputData) {
    if (inputData.length != 2) {
      String newValue = '0' + inputData;
      return newValue;
    }
    return inputData;
  }

  String remove91(String with91) {
    String without91 = with91.substring(4);
    return without91;
  }

  String add91(String without91) {
    return "+91 ${without91}";
  }
  
}
