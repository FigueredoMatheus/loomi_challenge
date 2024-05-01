import 'flavors.dart';

import 'main.dart' as runner;

Future<void> main() async {
  FlavorSettings.appFlavor = Flavor.homo;
  await runner.main();
}
