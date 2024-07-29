enum NotificationState { warning, normal, danger, safe }

enum NotificationType { info, paymentRequestRejected, paymentRequestApproved }

NotificationState toNotificationState(String state) {
  final res = NotificationState.values.firstWhere(
    (s) => s.toString().split('.').last == state,
  );
  return res;
}

NotificationType toNotificationType(String type) {
  final res = NotificationType.values.firstWhere(
    (s) => s.toString().split('.').last == type,
  );
  return res;
}
