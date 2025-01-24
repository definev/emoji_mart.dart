import 'package:emoji_mart_data/src/constant.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Testing parsing icon sets', () async {
    TestWidgetsFlutterBinding.ensureInitialized();
    final sets = ['all', 'apple', 'facebook', 'google', 'native', 'twitter'];
    final versions = [
      '1',
      '2',
      '3',
      '4',
      '5',
      '11',
      '12',
      '12.1',
      '13',
      '13.1',
      '14',
      '15'
    ];

    for (final version in versions) {
      for (final set in sets) {
        final data = await emojiMartDataFromSet(version, set, prefix: 'sets');
        expect(data, isNotNull);
      }
    }
  });
}
