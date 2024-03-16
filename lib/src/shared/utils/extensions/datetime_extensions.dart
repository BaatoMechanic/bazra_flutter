
extension DateTimeExtensions on DateTime {
  String toAgo() {
    // Returns in format like 1 year ago or  2 months ago or 4 days ago
    String returnValue = '';
    Duration diff = DateTime.now().difference(this);

    if (diff.inDays > 0) {
      if (diff.inDays > 30) {
        returnValue =
            "${diff.inDays ~/ 30} ${diff.inDays ~/ 30 == 1 ? 'month' : 'months'}";
      }
      if (diff.inDays > 365) {
        returnValue =
            "${diff.inDays ~/ 365} ${diff.inDays ~/ 365 == 1 ? 'year' : 'years'}";
      }

      returnValue = "${diff.inDays} ${diff.inDays == 1 ? 'day' : 'days'}";
    } else if (diff.inHours > 0) {
      returnValue = "${diff.inHours} ${diff.inHours == 1 ? 'hour' : 'hours'}";
    } else if (diff.inMinutes > 0) {
      returnValue =
          "${diff.inMinutes} ${diff.inMinutes == 1 ? 'minute' : 'minutes'}";
    }

    return "$returnValue ago";
  }
}
