JSON minify
===

Delete comments in json data.
For someone who wants to parse commented json from json file.

Port from [JSON.minify](https://github.com/getify/JSON.minify)

##Install

### Depend on it

Add this to your package's pubspec.yaml file:

```yaml
dependencies:
  json_minify: ">=1.0.0 <2.0.0"
```

### Install it

```sh
pub get
```

##Usage

```dart
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
```

##License

Copyright (C) 2014 ila

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
