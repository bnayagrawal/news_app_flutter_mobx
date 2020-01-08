// In seconds
const int ONE_DAY = 86400;
const int ONE_HOUR = 3600;
const int ONE_MINUTE = 60;

String relativeTimeString(DateTime dateTime) {
  // IF RELATIVE TIMING IS USED THEN IT NEEDS TO BE RECOMPUTED EVERY SECOND
  /*int differenceInSeconds = DateTime.now().difference(dateTime).inSeconds;
  int days = differenceInSeconds ~/ ONE_DAY;

  if(days > 0)
    return '$days days ago';
  else {
    int hours = differenceInSeconds ~/ ONE_HOUR;
    int minutes = (differenceInSeconds - (hours * ONE_HOUR)) ~/ ONE_MINUTE;
    int seconds = (differenceInSeconds - hours * ONE_HOUR) - minutes * ONE_MINUTE;

    if(hours < 1)
      return '$minutes minutes ago';
    else if(minutes < 1)
      return '$seconds seconds ago';
    else
      return '${hours}h $minutes minutes ago';
  }*/

  return '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
}
