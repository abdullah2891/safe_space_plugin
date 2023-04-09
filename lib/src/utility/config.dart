class Config {
  static Config? _instance;
  factory Config() {
    _instance ??= Config._(true);
    return _instance!;
  }

  final bool _isDemo;
  Config._(this._isDemo);

  bool get isDemo => _isDemo;
}
