import 'package:conversehub/features/home/application/home_provider.dart';
import 'package:conversehub/features/home/widgets/home_fab.dart';
import 'package:conversehub/features/home/widgets/sessions_list.dart';
import 'package:conversehub/features/home/widgets/welcome_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/home_page_appbar.dart';

class PastSessionsPage extends StatelessWidget {
  const PastSessionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final HomeProvider homeProvider = Provider.of<HomeProvider>(context, listen: false);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: HomePageAppbar(colorScheme: colorScheme)
      ),
      floatingActionButton: HomeFab(colorScheme: colorScheme, homeProvider: homeProvider,),
      body: Consumer<HomeProvider>(
        builder: (context, homeProvider, child) {
          if(homeProvider.sessions == null || homeProvider.sessions!.isEmpty){
            return Center(
              child: Text(
                "No sessions created. Start a session to get started",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
              ),
            );
          }
          else{
            return SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WelcomeHeader(
                    colorScheme: colorScheme,
                    heading: "Your Past Sessions",
                  ),
                  const SizedBox(height: 32),
                  SessionsList(
                    itemCount: homeProvider.sessions!.length,
                    colorScheme: colorScheme,
                    homeProvider: homeProvider,
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
