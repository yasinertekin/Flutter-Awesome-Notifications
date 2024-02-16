import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:notification_case/feature/counter/view_model/counter_view_model.dart';
import 'package:notification_case/product/notification_service.dart';

@immutable

/// Locators
abstract final class Locators {
  const Locators._();

  /// GetIt instance
  static final _getIt = GetIt.instance;

  /// CounterViewModel Getter
  static CounterViewModel get counterViewModel => _getIt<CounterViewModel>();

  /// Register dependencies
  static Future<void> register() async {
    // Register AwesomeNotifications
    _getIt
      ..registerLazySingleton<AwesomeNotifications>(() {
        final awesome = AwesomeNotifications();
        awesome.isNotificationAllowed().then((isAllowed) {
          if (!isAllowed) {
            awesome.requestPermissionToSendNotifications();
          }
        });
        return awesome;
      })

// Register NotificationService
      ..registerLazySingleton<INotificationService>(
        () => NotificationService(
          _getIt<AwesomeNotifications>(),
        ),
      )

// Register CounterViewModel
      ..registerFactory<CounterViewModel>(
        () => CounterViewModel(
          _getIt<INotificationService>(),
        ),
      );
  }
}
