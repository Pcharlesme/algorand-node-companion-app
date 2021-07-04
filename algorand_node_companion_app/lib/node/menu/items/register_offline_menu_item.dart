import 'dart:async';

import 'package:heroicons/heroicons.dart';
import 'package:nodex_companion_app/node/menu/node_menu_component.dart';
import 'package:nodex_companion_app/themes/themes.dart';
import 'package:nodex_companion_app/ui/components/node/card/bloc/node_card_bloc.dart';
import 'package:nodex_companion_app/ui/screens/screens.dart';
import 'package:provider/provider.dart';

class RegisterOfflineMenuItem extends NodeMenuComponent {
  RegisterOfflineMenuItem()
      : super(
          key: 'register-offline',
          title: 'Register offline',
          icon: HeroIcon(
            HeroIcons.statusOffline,
            color: Palette.secondaryTextColor,
          ),
        );

  @override
  Future<bool> onTap(BuildContext context, {Function? error}) async {
    final node = context.read<NodeCardBloc>().state.node;
    router.navigateTo(
      context,
      NodeFormScreen.routeName,
      routeSettings: RouteSettings(arguments: node),
    );
    return Future.value(true);
  }
}
