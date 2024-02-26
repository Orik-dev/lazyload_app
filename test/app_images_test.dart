import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:lazyload_app/resources/resources.dart';

void main() {
  test('app_images assets test', () {
    expect(File(AppImages.backfire).existsSync(), isTrue);
    expect(File(AppImages.fastfuriosX).existsSync(), isTrue);
    expect(File(AppImages.fireGamer).existsSync(), isTrue);
    expect(File(AppImages.first).existsSync(), isTrue);
    expect(File(AppImages.five).existsSync(), isTrue);
    expect(File(AppImages.fore).existsSync(), isTrue);
    expect(File(AppImages.free).existsSync(), isTrue);
    expect(File(AppImages.logo).existsSync(), isTrue);
    expect(File(AppImages.moviePlacholder).existsSync(), isTrue);
    expect(File(AppImages.napoleon).existsSync(), isTrue);
    expect(File(AppImages.six).existsSync(), isTrue);
    expect(File(AppImages.soldat).existsSync(), isTrue);
    expect(File(AppImages.sozdatel).existsSync(), isTrue);
    expect(File(AppImages.trailerBackground).existsSync(), isTrue);
    expect(File(AppImages.trailerPreview).existsSync(), isTrue);
    expect(File(AppImages.two).existsSync(), isTrue);
    expect(File(AppImages.uravnitel).existsSync(), isTrue);
  });
}
