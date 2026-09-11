import 'package:flutter_test/flutter_test.dart';
import 'package:mindful/models/permissions_model.dart';

void main() {
  group('PermissionsModel.haveAllRequiredPermissions', () {
    test('is true when required permissions are granted', () {
      const perms = PermissionsModel(
        haveUsageAccessPermission: true,
        haveDisplayOverlayPermission: true,
        haveAlarmsPermission: true,
        haveNotificationPermission: false,
      );

      expect(perms.haveAllRequiredPermissions, isTrue);
    });

    test('is false when usage access permission is denied', () {
      const perms = PermissionsModel(
        haveUsageAccessPermission: false,
        haveDisplayOverlayPermission: true,
        haveAlarmsPermission: true,
      );

      expect(perms.haveAllRequiredPermissions, isFalse);
    });

    test('is false when display overlay or alarms permissions are denied', () {
      const noOverlayPerms = PermissionsModel(
        haveUsageAccessPermission: true,
        haveDisplayOverlayPermission: false,
        haveAlarmsPermission: true,
      );
      const noAlarmPerms = PermissionsModel(
        haveUsageAccessPermission: true,
        haveDisplayOverlayPermission: true,
        haveAlarmsPermission: false,
      );

      expect(noOverlayPerms.haveAllRequiredPermissions, isFalse);
      expect(noAlarmPerms.haveAllRequiredPermissions, isFalse);
    });
  });
}
