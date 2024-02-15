import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:notification_case/feature/counter/view_model/counter_view_model.dart';
import 'package:notification_case/feature/notification_service.dart';

@immutable

/// Locators
final class Locators {
  const Locators._();

  /// GetIt instance
  static final getIt = GetIt.instance;

  /// CounterViewModel Getter
  static CounterViewModel get counterViewModel => getIt<CounterViewModel>();

  /// Register dependencies
  static Future<void> register() async {
    // Register CounterViewModel
    getIt
      ..registerFactory<CounterViewModel>(
        () => CounterViewModel(
          getIt<INotificationService>(),
        ),
      )

      // Register NotificationService
      ..registerLazySingleton<INotificationService>(
        () => NotificationService(
          getIt<AwesomeNotifications>(),
        ),
      )

      // Register AwesomeNotifications
      ..registerLazySingleton<AwesomeNotifications>(
        AwesomeNotifications.new,
      );
  }
}
