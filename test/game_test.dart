import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_uzay_istilacilari/oyun_uzay_istilacilari.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(istilaConfig.title.length, 33);
    expect(istilaConfig.tagline.length, 33);
    for (final s in istilaConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler üretilir ve bot tarafından geçilir', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(istilaRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: istilaId, optionalMechanics: istilaRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(istilaRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
