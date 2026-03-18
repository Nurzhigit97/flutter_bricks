import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_markdown_latex/flutter_markdown_latex.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:{{packageName}}/shared/core/helper/extenstions.dart';

class MathContentWidget extends StatelessWidget {
  final String formula;
  final bool selectable;
  final WrapAlignment? textAlign;
  const MathContentWidget({
    super.key,
    required this.formula,
    this.textAlign,
    this.selectable = false,
  });

  /// Очистка пробелов вокруг $$
  String preprocessMarkdown(String data) {
    final cleaned = data.replaceAllMapped(
      RegExp(r'\$\$\s*(.*?)\s*\$\$', dotAll: true),
      (match) => r'$$' + match.group(1)! + r'$$',
    );

    final lines = cleaned.split("\n");
    return lines
        .map((line) {
          if (line.trim().startsWith("|") || line.contains("|")) {
            return line;
          }
          return "$line  ";
        })
        .join("\n");
  }

  @override
  Widget build(BuildContext context) {
    return Markdown(
      data: preprocessMarkdown(formula),
      selectable: selectable,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      builders: {'latex': LatexElementBuilder(textScaleFactor: 1.2)},
      extensionSet: md.ExtensionSet(
        [LatexBlockSyntax(), const md.TableSyntax()],
        [LatexInlineSyntax(), md.LinkSyntax()],
      ),
      styleSheet: MarkdownStyleSheet.fromTheme(context.theme).copyWith(
        horizontalRuleDecoration: const BoxDecoration(border: null),
        textAlign: textAlign ?? WrapAlignment.start,
        tableColumnWidth: const IntrinsicColumnWidth(),
      ),
    );
  }
}
