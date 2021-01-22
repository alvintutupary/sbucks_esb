class EnvironmentConfig {
  static const API_URL = String.fromEnvironment(
    'API_URL',
    defaultValue: 'https://dev.esb.co.id/esb-sbux-card/web',
  );
  static const LOG_EVENTS = bool.fromEnvironment(
    'LOG_EVENTS',
    defaultValue: true,
  );
}
