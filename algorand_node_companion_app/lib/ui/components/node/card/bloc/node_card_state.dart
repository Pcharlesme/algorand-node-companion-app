import 'package:equatable/equatable.dart';
import 'package:nodex_companion_app/models/models.dart';
import 'package:nodex_companion_app/node/menu/node_menu.dart';
import 'package:nodex_companion_app/node/nodex_client.dart';
import 'package:nodex_companion_app/node/property/node_properties.dart';

class NodeCardState extends Equatable {
  final Node node;
  final NodeXClient client;
  final NodeMenu menu;
  final NodeProperties properties;

  NodeCardState({
    required this.node,
    required this.client,
    required this.menu,
    required this.properties,
  });

  NodeCardState copyWith({
    Node? node,
    NodeMenu? menu,
    NodeProperties? properties,
  }) {
    return NodeCardState(
      node: node ?? this.node,
      client: client,
      menu: menu ?? this.menu,
      properties: properties ?? this.properties,
    );
  }

  @override
  List<Object?> get props => [node, menu, properties];
}
