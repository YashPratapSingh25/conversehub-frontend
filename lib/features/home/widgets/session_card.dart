import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../core/ui_helpers/get_icon.dart';

class SessionCard extends StatelessWidget {
  final String? _title;
  final String? _mode;
  final DateTime? _dateTime;
  final ColorScheme _colorScheme;
  const SessionCard({
    super.key,
    String? title,
    String? mode,
    DateTime? dateTime,
    required ColorScheme colorScheme
  }) : _title = title, _mode = mode, _dateTime = dateTime, _colorScheme = colorScheme;

  String? _friendlyDatetime(DateTime? utcDatetime){
    DateTime? localDatetime = utcDatetime?.toLocal();
    String? friendlyDatetime = timeago.format(localDatetime!);
    return friendlyDatetime;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _colorScheme.secondary,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _colorScheme.outline.withOpacity(0.5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              getIcon(_mode),
              color: _colorScheme.primary,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (_title != null) Text(
                  _title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: _colorScheme.onSurface,
                  ),
                ),
                Text(
                  "${_friendlyDatetime(_dateTime)}",
                  style: TextStyle(
                    fontSize: 12,
                    color: _colorScheme.tertiary,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.chevron_right,
            color: _colorScheme.tertiary,
          ),
        ],
      ),
    );
  }
}
