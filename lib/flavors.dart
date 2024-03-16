enum Flavor {
  dev,
  staging,
  prod,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'KR Dev';
      case Flavor.staging:
        return 'BM Staging';
      case Flavor.prod:
        return 'BM Prod';
      default:
        return 'title';
    }
  }

}
