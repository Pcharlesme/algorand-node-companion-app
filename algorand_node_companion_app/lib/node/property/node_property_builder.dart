import 'package:nodex_companion_app/node/property/node_properties.dart';
import 'package:nodex_companion_app/node/property/node_property_item.dart';
import 'package:nodex_companion_app/shared/shared.dart';
import 'package:nodex_companion_app/themes/themes.dart';
import 'package:nodex_companion_app/utils/string_utils.dart';

/// A class used to separate the construction of complex properties based on the status of a node.
class NodePropertyBuilder {
  final NodeInformation information;

  NodePropertyBuilder({required this.information});

  NodeProperties build() {
    final properties = NodeProperties();
    final status = information.status;
    final registered = information.registered;

    properties.addProperty(NodePropertyItem(
      key: 'status',
      title: 'Status',
      value: information.status.text,
      color: getStatusColor(information),
    ));

    // TODO Add sorting parameter
    if (status == NodeStatus.PARTICIPATING) {
      properties.addProperty(NodePropertyItem(
        key: 'registered',
        title: 'Registered',
        value:
            registered ? information.account?.toShortenedAddress() : 'Offline',
      ));
    }

    properties.addProperty(NodePropertyItem(
      key: 'version',
      title: 'Version',
      value: information.currentVersion?.toString(),
    ));

    properties.addProperty(NodePropertyItem(
      key: 'network',
      title: 'Network',
      value: information.network.name,
    ));

    if (status == NodeStatus.RUNNING) {
      properties.addProperty(NodePropertyItem(
        key: 'latest-block',
        title: 'Latest block',
        value: information.latestBlock?.toString(),
      ));
    }

    if (status == NodeStatus.SYNCING ||
        status == NodeStatus.SYNCING_FAST_CATCHUP) {
      properties.addProperty(NodePropertyItem(
        key: 'latest-block',
        title: 'Latest block',
        value: information.latestBlock?.toString(),
      ));

      properties.addProperty(NodePropertyItem(
        key: 'sync-time',
        title: 'Sync time',
        value: '${information.syncTime}s',
      ));
    }

    if (status == NodeStatus.PARTICIPATING) {
      properties.addProperty(NodePropertyItem(
        key: 'votes-broadcast',
        title: '# votes',
        value: information.voted.toString(),
      ));

      properties.addProperty(NodePropertyItem(
        key: 'sync-time',
        title: 'Sync time',
        value: '${information.syncTime}s',
      ));
    }

    return properties;
  }

  Color? getStatusColor(NodeInformation information) {
    final status = information.status;
    final registered = information.registered;

    if (status == NodeStatus.PARTICIPATING) {
      return registered ? Palette.positiveColor : const Color(0xFFF0694A);
    }

    return Palette.primaryTextColor;
  }
}