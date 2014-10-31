import 'bin/json_minify.dart';

main() {
  String s = '''
{
  /* adb */
  // abcd
  "a": 1,
  "b": "/* aaaabbbb */",
  "c": "/* 中文 */",
  /* 中文
  */
  "d": "中文",
}
''';

  print(jsonMinify(s));
}