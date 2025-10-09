import 'dart:math';
import 'package:conversehub/features/home/domain/session_schema.dart';
import 'package:conversehub/features/home/widgets/session_card.dart';
import 'package:conversehub/features/home/widgets/sessions_slidable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../application/home_provider.dart';
import 'alert_dialog_actions.dart';
import 'alert_dialog_header.dart';

class SessionsList extends StatelessWidget {
  final int _itemCount;
  final ColorScheme _colorScheme;
  final HomeProvider _homeProvider;
  const SessionsList({
    super.key,
    required int itemCount,
    required ColorScheme colorScheme,
    required HomeProvider homeProvider
  }) : _itemCount = itemCount, _colorScheme = colorScheme, _homeProvider = homeProvider;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: min(_homeProvider.sessions!.length, _itemCount),
      itemBuilder: (context, index) {
        SessionSchema session = _homeProvider.sessions![index];
        return Column(
          children: [
            SessionsSlidable(
              colorScheme: _colorScheme,
              homeProvider: _homeProvider,
              session: session
            ),
            const SizedBox(height: 8)
          ],
        );
      },
    );
  }
}

