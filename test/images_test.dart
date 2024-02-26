import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:lazyload_app/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.backfire).existsSync(), isTrue);
    expect(File(Images.fastfuriosX).existsSync(), isTrue);
    expect(File(Images.fireGamer).existsSync(), isTrue);
    expect(File(Images.first).existsSync(), isTrue);
    expect(File(Images.five).existsSync(), isTrue);
    expect(File(Images.fore).existsSync(), isTrue);
    expect(File(Images.free).existsSync(), isTrue);
    expect(File(Images.logo).existsSync(), isTrue);
    expect(File(Images.moviePlacholder).existsSync(), isTrue);
    expect(File(Images.napoleon).existsSync(), isTrue);
    expect(File(Images.six).existsSync(), isTrue);
    expect(File(Images.soldat).existsSync(), isTrue);
    expect(File(Images.sozdatel).existsSync(), isTrue);
    expect(File(Images.two).existsSync(), isTrue);
    expect(File(Images.uravnitel).existsSync(), isTrue);
  });
}
