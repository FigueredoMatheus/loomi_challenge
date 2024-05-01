import 'flavors.dart';

import 'main.dart' as runner;

Future<void> main() async {
  FlavorSettings.appFlavor = Flavor.dev;
  await runner.main();
}
