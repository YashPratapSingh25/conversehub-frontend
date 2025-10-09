import 'package:conversehub/features/home/data/home_repository.dart';
import 'package:conversehub/features/home/widgets/home_fab.dart';
import 'package:conversehub/features/home/widgets/quick_start_section.dart';
import 'package:conversehub/features/home/widgets/recent_session_section.dart';
import 'package:conversehub/features/home/widgets/sessions_list.dart';
import 'package:conversehub/features/home/widgets/welcome_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../application/home_provider.dart';
import '../widgets/home_page_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: HomePageAppbar(colorScheme: colorScheme)
      ),
      floatingActionButton: HomeFab(colorScheme: colorScheme, homeProvider: homeProvider,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WelcomeHeader(
                colorScheme: colorScheme,
                heading: "Welcome ${homeProvider.firstName?.split(" ")[0]}",
                subheading: "Ready to enhance your communication skills ?",
              ),

              const SizedBox(height: 32),

              QuickStartSection(colorScheme: colorScheme, homeProvider: homeProvider,),

              const SizedBox(height: 32),

              RecentSessionSection(colorScheme: colorScheme, homeProvider: homeProvider),

              const SizedBox(height: 32),

              // Progress Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Progress (Work in Progress)',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 16),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: colorScheme.secondary,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: colorScheme.outline,
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildProgressStat('12', 'Sessions', Icons.chat_bubble_outline, colorScheme),
                            _buildProgressStat('87%', 'Confidence', Icons.trending_up, colorScheme),
                            _buildProgressStat('5', 'Streak', Icons.local_fire_department_outlined, colorScheme),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressStat(String value, String label, IconData icon, ColorScheme colorScheme) {
    return Column(
      children: [
        Icon(
          icon,
          size: 24,
          color: colorScheme.primary,
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: colorScheme.tertiary, // Light gray
          ),
        ),
      ],
    );
  }
}