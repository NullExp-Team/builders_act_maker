import 'dart:async';

import 'package:fluent_ui/fluent_ui.dart';

class MessageBoxButton extends StatelessWidget {
  const MessageBoxButton({
    super.key,
    this.succsessMessage,
    this.failureMessage,
    required this.callBack,
    required this.child,
  });

  final String? succsessMessage;
  final String? failureMessage;
  final FutureOr<bool> Function() callBack;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final flyoutController = FlyoutController();
    return FlyoutTarget(
      controller: flyoutController,
      child: Button(
        child: child,
        onPressed: () async {
          final isSuccess = await callBack();
          final message = isSuccess ? succsessMessage : failureMessage;
          if (message != null) {
            flyoutController.showFlyout(
              barrierDismissible: false,
              dismissOnPointerMoveAway: true,
              builder: (context) {
                return FlyoutContent(
                  child: Text(
                    message,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
