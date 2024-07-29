enum TimerBordState {
  initial,
  workBeforeBreak,
  breakInWork,
  workAfterBreak,
  checkedOut;

  TimerBordState next() {
    switch (this) {
      case initial:
        return workBeforeBreak;
      case workBeforeBreak:
        return breakInWork;
      case breakInWork:
        return workAfterBreak;
      case workAfterBreak:
        return checkedOut;
      case checkedOut:
        return initial;
    }
  }

  bool get isInitial => this == TimerBordState.initial;

  bool get isWorkBeforeBreak => this == TimerBordState.workBeforeBreak;

  bool get isBreakInWork => this == TimerBordState.breakInWork;

  bool get isWorkAfterBreak => this == TimerBordState.workAfterBreak;

  bool get isCheckedOut => this == TimerBordState.checkedOut;
}
