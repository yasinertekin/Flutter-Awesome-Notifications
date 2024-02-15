import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

/// Notification service interface
abstract class INotificationService {
  /// Constructor
  INotificationService(this.awesomeNotifications);

  /// Awesome notifications instance
  final AwesomeNotifications awesomeNotifications;

  /// Request user permissions
  Future<void> requestUserPermissions();

  /// Schedule notification
  Future<void> scheduledNotification(
    DateTime dateTime,
    String title,
    String body,
    String icon,
  );

  /// Initialize notifications
  Future<void> initializeNotifications();

  /// Show notification
  Future<void> showNotification(
    String title,
    String body,
  );
}

/// Notification service

class NotificationService implements INotificationService {
  /// Constructor
  NotificationService(this.awesomeNotifications);

  /// Awesome notifications instance
  @override
  final AwesomeNotifications awesomeNotifications;

  /// Request user permissions
  @override
  Future<void> requestUserPermissions() async {
    await awesomeNotifications.requestPermissionToSendNotifications(
      channelKey: 'basic_channel',
    );
  }

  /// Schedule notification
  @override
  Future<void> scheduledNotification(
    DateTime dateTime,
    String title,
    String body,
    String icon,
  ) async {
    await awesomeNotifications.createNotification(
      content: NotificationContent(
        id: 3,
        channelKey: 'basic_channel',
        title: title,
        body: body,
        largeIcon: icon,
      ),
      schedule: NotificationCalendar.fromDate(
        date: dateTime,
      ),
    );
  }

  @override
  Future<void> initializeNotifications() {
    return awesomeNotifications.initialize(
      null,
      [
        NotificationChannel(
          channelKey: 'basic_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          defaultColor: const Color(0xFF9D50DD),
          ledColor: Colors.white,
          playSound: true,
          enableVibration: true,
          importance: NotificationImportance.High,
        ),
      ],
    );
  }

  @override
  Future<void> showNotification(String title, String body) {
    return awesomeNotifications.createNotification(
      content: NotificationContent(
        id: 3,
        channelKey: 'basic_channel',
        title: title,
        body: body,
      ),
    );
  }
}
