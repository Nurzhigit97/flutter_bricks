import 'package:html/parser.dart' as html_parser;

/// Utility functions for string manipulation
class StringUtils {
  /// Cleans markdown wrapper from AI chat message
  static String cleanMessageInAIChat(String raw) {
    // Убираем \r и \n по краям
    var result = raw.trim();

    // Убираем тройные бэктики с "markdown" или без
    final markdownPattern = RegExp(r'^```(?:markdown)?\s*([\s\S]*?)\s*```$');
    final match = markdownPattern.firstMatch(result);
    if (match != null) {
      result = match.group(1) ?? result;
    }

    return result.trim();
  }

  static String htmlToPlainText(String html) {
    return html_parser.parse(html).body?.text ?? '';
  }
}
