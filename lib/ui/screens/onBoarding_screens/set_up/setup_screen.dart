import 'package:flutter/material.dart';
import 'package:hope/core/assets/app_assets.dart';
import 'package:hope/core/providers/theme_provider.dart';
import 'package:hope/ui/screens/onBoarding_screens/on_boarding/onboarding_screen.dart';
import 'package:hope/ui/shared_widgets/theme_switch.dart';
import 'package:provider/provider.dart';

class SetupScreen extends StatelessWidget {
  static const String routeName = "/SetupScreen";

  late ThemeProvider themeProvider;

  // late AppLocalizations appLocalizations;

  SetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of<ThemeProvider>(context);
    // appLocalizations =
    //     AppLocalizations.of(context) ?? AppLocalizations.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                // child: Image.asset(themeProvider.isDark()
                //     ? AppAssets.onBoardingDark
                //     : AppAssets.onBoardingLight),
                child: Image.asset(AppAssets.setup),
              ),
              const SizedBox(height: 16),
              Text(
                "Personalize Your Experience",
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 16),
              Text(
                "Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.",
                //  appLocalizations.setupScreenDescription,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Language",
                    // appLocalizations.language,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  //  LanguageSwitch()
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Theme",
                    //   appLocalizations.theme,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  ThemeSwitch(),
                ],
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, OnBoardingScreen.routeName);
                },
                child: const Text("Let's start"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
