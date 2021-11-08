class PreLoadConfig {
  String? name;
  bool? preLoad;

  PreLoadConfig({
    this.name,
    this.preLoad,
  });

  factory PreLoadConfig.initial() => PreLoadConfig(
        name: '',
        preLoad: false,
      );
}
