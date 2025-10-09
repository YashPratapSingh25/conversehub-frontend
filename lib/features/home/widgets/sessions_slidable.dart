import 'package:conversehub/features/home/application/home_provider.dart';
import 'package:conversehub/features/home/domain/session_schema.dart';
import 'package:conversehub/features/home/widgets/alert_dialog_skeleton.dart';
import 'package:conversehub/features/home/widgets/session_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SessionsSlidable extends StatelessWidget {
  final ColorScheme _colorScheme;
  final HomeProvider _homeProvider;
  final SessionSchema _session;
  const SessionsSlidable({
    super.key,
    required ColorScheme colorScheme,
    required HomeProvider homeProvider,
    required SessionSchema session
  }) : _colorScheme = colorScheme, _homeProvider = homeProvider, _session = session;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(_session.id),
      endActionPane: ActionPane(
          extentRatio: 0.25,
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialogSkeleton(
                      colorScheme: _colorScheme,
                      homeProvider: _homeProvider,
                      mode: "deleteSession",
                      data: _session,
                    );
                  },
                );
              },
              backgroundColor: _colorScheme.error,
              foregroundColor: _colorScheme.onError,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(12),
            )
          ]
      ),
      child: SessionCard(
        title: _session.sessionName,
        mode: _session.mode,
        dateTime: _session.updatedAt,
        colorScheme: _colorScheme,
      ),
    );
  }
}
