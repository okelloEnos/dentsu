//980724
DateTime parseBirthDate(String input) {
  final formattedInput = _formatDate(input);
  return _parseDate(formattedInput, DateTime.now().year - 2000);
}
DateTime parseExpiryDate(String input) {
final formattedInput = _formatDate(input);
return _parseDate(formattedInput, 70);
}

String _formatDate(String input) => _trim(input);

String _trim(String input) =>
    input.replaceAngleBracketsWithSpaces().trim();

DateTime _parseDate(String input, int milestoneYear) {
  final parsedYear = int.parse(input.substring(0, 2));
  final centennial = (parsedYear > milestoneYear) ? '19' : '20';
  return DateTime.parse(centennial + input);
}

extension _MRZStringExtensions on String {
  String replaceAngleBracketsWithSpaces() => replaceAll('<', ' ');
}