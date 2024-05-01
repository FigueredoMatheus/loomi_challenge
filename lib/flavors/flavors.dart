enum Flavor {
  dev,
  homo,
  prod,
}

class FlavorSettings {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static bool get isDev => FlavorSettings.appFlavor == Flavor.dev;
  static bool get isHomo => FlavorSettings.appFlavor == Flavor.homo;
  static bool get isProd => FlavorSettings.appFlavor == Flavor.prod;

  static String get appSubdomain {
    switch (appFlavor) {
      case Flavor.homo:
        return 'homo';
      case Flavor.prod:
        return 'prod';
      case Flavor.dev:
      default:
        return 'dev';
    }
  }

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Loomi Challenge Dev';
      case Flavor.homo:
        return 'Loomi Challenge Homo';
      case Flavor.prod:
        return 'Loomi Challenge';
      default:
        return 'title';
    }
  }
}
