import 'package:flutter_driver/flutter_driver.dart';
import 'package:integration_test/integration_test_driver.dart';

Future<void> main() {
  return integrationDriver(responseDataCallback: (data) async {
    if (data != null) {
      final timeLine =
          Timeline.fromJson(data['scrolling_summary'] as Map<String, dynamic>);
      final summary = TimelineSummary.summarize(timeLine);

      await summary.writeTimelineToFile(
        'scrolling_summary',
        pretty: true,
        includeSummary: true,
      );
    }
  });
}
