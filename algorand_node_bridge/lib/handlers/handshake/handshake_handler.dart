import 'dart:async';
import 'dart:io';

import 'package:json_rpc_2/json_rpc_2.dart';
import 'package:nodex_server/controllers/node_controller.dart';
import 'package:nodex_server/handlers/handlers.dart';

/// Accept a handshake from the client.
class HandshakeHandler extends Handler {
  @override
  String get name => 'handshake';

  @override
  Future<Map<String, dynamic>> resolve(Node node, Parameters params) async {
    // Run a goal command to check if goal is running
    await node.shell.run('./goal license');

    // Get the OS (with the specific distribution)
    final operatingSystem = await node.operatingSystem;

    final data = {
      'operating-system': operatingSystem,
      'operating-system-version': Platform.operatingSystemVersion,
    };

    return data;
  }
}
