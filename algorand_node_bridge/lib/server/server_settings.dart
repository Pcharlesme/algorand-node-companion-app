import 'dart:io';

class ServerSettings {
  final String? _workingDirectory;
  String ipAddress;
  int port;
  bool debug;

  ServerSettings({
    String? workingDirectory,
    this.ipAddress = '127.0.0.1',
    this.port = 4042,
    this.debug = false,
  }) : _workingDirectory = workingDirectory;

  /// Get the working directory where the node lives.
  String get workingDirectory => _workingDirectory ?? '$homePath/node';

  /// Get the home path of the user directory.
  String get homePath =>
      Platform.environment['HOME'] ?? Platform.environment['USERPROFILE'] ?? '';
}
