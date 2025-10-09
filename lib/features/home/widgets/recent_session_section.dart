import 'package:conversehub/features/home/presentation/past_sessions_page.dart';
import 'package:conversehub/features/home/widgets/empty_session_card.dart';
import 'package:conversehub/features/home/widgets/sessions_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../application/home_provider.dart';

class RecentSessionSection extends StatefulWidget {
  final ColorScheme _colorScheme;
  final HomeProvider _homeProvider;
  const RecentSessionSection({
    super.key,
    required ColorScheme colorScheme,
    required HomeProvider homeProvider
  })  : _colorScheme = colorScheme, _homeProvider = homeProvider;

  @override
  State<RecentSessionSection> createState() => _RecentSessionSectionState();
}

class _RecentSessionSectionState extends State<RecentSessionSection> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget._homeProvider.getSessions();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recent Sessions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: widget._colorScheme.onSurface,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const PastSessionsPage(),));
              },
              child: Text(
                'View All',
                style: TextStyle(color: widget._colorScheme.primary),
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        Consumer<HomeProvider>(
          builder: (context, homeProvider, child) {
            if (homeProvider.isLoading){
              return EmptySessionCard(
                colorScheme: widget._colorScheme,
                text: "Loading Sessions...",
              );
            }
            else if (homeProvider.sessions == null || widget._homeProvider.sessions!.isEmpty) {
              return EmptySessionCard(
                colorScheme: widget._colorScheme,
                text: "No sessions created. Start a session to get started",
              );
            }
            else {
              return SessionsList(
                  itemCount: 3,
                  colorScheme: widget._colorScheme,
                  homeProvider: widget._homeProvider
              );
            }
          },
        ),
      ],
    );
  }
}