// convert DAteTIme object to a string yyy/mm/dd

String convertDateTimeToString (DateTime dateTime) {
  String year = dateTime.year.toString();

  //month in the format -> mm
  String month= dateTime.month.toString();
  if (month.length == 1) {
    month = '0$month';
  }

  //day in the format -> dd
  String day = dateTime.day.toString();
  if (day.length ==1){
    day= '0$day';
  }

  //final format ->yyymmdd
  String yyymmdd = year +month+day;


  return yyymmdd;

/*
DateTime.now ()-> 2023/2/11/hour/minutes/seconds
2023211
*/

}