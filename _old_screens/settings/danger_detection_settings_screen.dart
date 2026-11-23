import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class DangerDetectionSettingsScreen extends StatefulWidget {
  const DangerDetectionSettingsScreen({super.key});

  @override
  State<DangerDetectionSettingsScreen> createState() => _DangerDetectionSettingsScreenState();
}

class _DangerDetectionSettingsScreenState extends State<DangerDetectionSettingsScreen> {
  bool _enabled = true;
  bool _siren = true;
  bool _smokeAlarm = true;
  bool _honk = false;
  bool _glassBrk = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Scaffold(
      backgroundColor: colors.bgGrouped,
      appBar: AppBar(
        title: Text('Danger Detection', style: TextStyle(color: colors.text, fontWeight: FontWeight.bold)),
        backgroundColor: colors.bgGrouped,
        elevation: 0,
        leading: BackButton(color: colors.text),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('Enable Danger Alerts', style: TextStyle(color: colors.text)),
            value: _enabled,
            activeColor: colors.accent,
            onChanged: (v) => setState(() => _enabled = v),
          ),
          if (_enabled) ...[
            const Divider(),
            SwitchListTile(
              title: Text('Siren', style: TextStyle(color: colors.text)),
              value: _siren,
              activeColor: colors.accent,
              onChanged: (v) => setState(() => _siren = v),
            ),
            SwitchListTile(
              title: Text('Smoke Alarm', style: TextStyle(color: colors.text)),
              value: _smokeAlarm,
              activeColor: colors.accent,
              onChanged: (v) => setState(() => _smokeAlarm = v),
            ),
            SwitchListTile(
              title: Text('Car Horn / Honk', style: TextStyle(color: colors.text)),
              value: _honk,
              activeColor: colors.accent,
              onChanged: (v) => setState(() => _honk = v),
            ),
            SwitchListTile(
              title: Text('Glass Break', style: TextStyle(color: colors.text)),
              value: _glassBrk,
              activeColor: colors.accent,
              onChanged: (v) => setState(() => _glassBrk = v),
            ),
          ],
        ],
      ),
    );
  }
}
