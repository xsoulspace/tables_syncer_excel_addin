import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:life_hooks/life_hooks.dart';
import 'package:ts_core/ts_core.dart';
import 'package:ts_design_core/ts_design_core.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

part 'info_screen_state.dart';

class InfoScreen extends HookWidget {
  const InfoScreen({super.key});
  static const privacyPolicyLink =
      'https://github.com/xsoulspace/sheets_manager_excel_addin/blob/develop/PRIVACY_POLICY.md';
  static const githubLink =
      'https://github.com/xsoulspace/sheets_manager_excel_addin';
  static const discordLink = 'https://discord.gg/y54DpJwmAn';
  static const boostyLink = 'https://boosty.to/arenukvern';
  static const cloudTipsLink = 'https://pay.cloudtips.ru/p/1629cd27';
  static const termsOfUseLink =
      'https://github.com/xsoulspace/sheets_manager_excel_addin/blob/develop/TERMS_AND_CONDITIONS.md';
  @override
  Widget build(final BuildContext context) {
    final state = useInfoScreenState();
    final uiTheme = UiTheme.of(context);
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).about)),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: [
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                uiTheme.verticalBoxes.large,
                Text(
                  S.current.purpose,
                  style: textTheme.bodyMedium,
                ),
                uiTheme.verticalBoxes.extraLarge,
                Text(
                  S.current.contributingTitle,
                  style: textTheme.titleLarge,
                ),
                uiTheme.verticalBoxes.medium,
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(S.current.oss),
                    Text(S.current.all),
                    const UrlButton(
                      text: 'comments',
                      url:
                          'https://github.com/xsoulspace/sheets_manager_excel_addin/issues',
                    ),
                    Text(S.current.and),
                    const UrlButton(
                      text: 'pull requests',
                      url:
                          'https://github.com/xsoulspace/sheets_manager_excel_addin/issues',
                    ),
                    Text(S.current.areWelcome),
                  ],
                ),
                uiTheme.verticalBoxes.large,
                Text(
                  S.current.gettingHelpTitle,
                  style: textTheme.titleLarge,
                ),
                uiTheme.verticalBoxes.medium,
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(S.current.gettingHelp),
                    const UrlButton(
                      text: 'Discord Community',
                      url: 'https://discord.gg/y54DpJwmAn',
                    ),
                  ],
                ),
                uiTheme.verticalBoxes.large,
                Text(
                  S.current.donations,
                  style: textTheme.titleLarge,
                ),
                uiTheme.verticalBoxes.medium,
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(S.current.considerSponsor),
                    const UrlButton(text: 'Boosty', url: boostyLink),
                    Text(S.current.or),
                    const UrlButton(text: 'CloudTips', url: cloudTipsLink),
                  ],
                ),
                uiTheme.verticalBoxes.large,
                Text(
                  S.current.thankYouTitle,
                  style: textTheme.titleLarge,
                ),
                uiTheme.verticalBoxes.medium,
                Text(S.current.thankYou),
                uiTheme.verticalBoxes.large,
                uiTheme.verticalBoxes.large,
                Text(
                  S.current.contributors,
                  style: textTheme.titleLarge,
                ),
                uiTheme.verticalBoxes.medium,
                ...[
                  _ContributorModel(
                    title: '@mixev - thank you for testing',
                    url: 'https://github.com/mixev',
                  )
                ].map(
                  (final e) => _ContributorTile(
                    contributor: e,
                  ),
                )
              ],
            ),
          ),
          uiTheme.verticalBoxes.large,
          const Divider(),
          uiTheme.verticalBoxes.extraLarge,
          Padding(
            padding: const EdgeInsets.only(left: 14.0),
            child: Text(
              'Copyright © 2019-${DateTime.now().year} '
              'Anton Malofeev (Arenukvern)',
            ),
          ),
          uiTheme.verticalBoxes.extraLarge,
          Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 8,
              children: [
                UrlButton(
                  text: S.current.privacyPolicy,
                  url: privacyPolicyLink,
                ),
                const _TextDivider(),
                UrlButton(
                  text: S.current.termsOfUse,
                  url: termsOfUseLink,
                ),
                const _TextDivider(),
                const Text('Made with Flutter & ❤'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> launchUrl(final String url) async {
  final uri = Uri.parse(url);
  if (await url_launcher.canLaunchUrl(uri)) {
    await url_launcher.launchUrl(uri);
  }
}

class _TextDivider extends StatelessWidget {
  const _TextDivider();

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Text(
      '|',
      style: textTheme.bodyMedium?.copyWith(
        color: theme.colorScheme.primary.withOpacity(0.2),
      ),
    );
  }
}

class _ContributorModel {
  _ContributorModel({
    required this.title,
    required this.url,
  });
  final String title;
  final String url;
}

class _ContributorTile extends StatelessWidget {
  const _ContributorTile({required this.contributor});
  final _ContributorModel contributor;
  @override
  Widget build(final BuildContext context) {
    return Row(
      children: [
        Text(contributor.title),
        UrlButton(text: 'GitHub', url: contributor.url),
      ],
    );
  }
}

class UrlButton extends StatelessWidget {
  const UrlButton({required this.text, this.url, super.key});
  final String text;
  final String? url;
  @override
  Widget build(final BuildContext context) {
    final url = this.url;

    return TextButton(
      onPressed: url == null ? null : () async => launchUrl(url),
      child: Text(text),
    );
  }
}
