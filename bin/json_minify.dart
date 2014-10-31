library json_minify;

String jsonMinify(String json) {
  RegExp tokenizer = new RegExp(r'(")|(//)|(/\*)|(\*/)|(\n)|(\r)');
  RegExp replace = new RegExp(r'(\n|\r|\s)*');
  RegExp magic = new RegExp(r'(\\)*$');
  RegExp single = new RegExp(r'(\n|\r|\s)');

  bool inString = false;
  bool inMultiLineComment = false;
  bool inSingleLineComment = false;

  String tmp = "";
  String tmp2 = "";
  String lc = '';
  String rc = '';
  int from = 0;
  List newStr = [];

  Match mm;

  Iterable<Match> matches = tokenizer.allMatches(json);

  if (matches.length == 0) return json;

  matches.forEach((Match m) {

    lc = json.substring(0, m.start);
    rc = json.substring(m.end, json.length);
    tmp = json.substring(m.start, m.end);

    if (!inMultiLineComment && !inSingleLineComment) {
      tmp2 = lc.substring(from);
      if (!inString) {
        tmp2.replaceFirst(replace, '');
      }
      newStr.add(tmp2);
    }
    from = m.end;

    if (tmp[0] == '"' && !inMultiLineComment && !inSingleLineComment) {
      mm = magic.firstMatch(lc);
      if (!inString || mm == null || (mm.end - mm.start) % 2 == 0) {	// start of string with ", or unescaped " character found to end string
        inString = !inString;
      }
      from--; // include " character in next catch
      rc = json.substring(from);
    } else if (tmp.startsWith("/*") && !inString && !inMultiLineComment && !inSingleLineComment) {
      inMultiLineComment = true;
    } else if (tmp.startsWith("*/") && !inString && inMultiLineComment && !inSingleLineComment) {
      inMultiLineComment = false;
    } else if (tmp.startsWith("//") && !inString && !inMultiLineComment && !inSingleLineComment) {
      inSingleLineComment = true;
    } else if ((tmp[0] == "\n" || tmp[0] == "\r") && !inString && !inMultiLineComment && inSingleLineComment) {
      inSingleLineComment = false;
    } else if (!inMultiLineComment && !inSingleLineComment && !single.hasMatch(tmp[0])) {
      newStr.add(tmp);
    }

  });
  newStr.add(rc);

  StringBuffer sb = new StringBuffer();
  newStr.forEach((String s) {
    if (s.trim() == '') return;
    sb.write(s);
  });
  return sb.toString();
}
