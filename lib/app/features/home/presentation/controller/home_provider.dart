import 'package:salefny/app/core/enums/timer_bord_state.dart';
import 'package:salefny/app/core/enums/work_type.dart';
import 'package:salefny/app/core/models/custom_state.dart';
import 'package:salefny/app/features/home/data/model/my_selected_item.dart';
import 'package:salefny/generated/assets.dart';
import 'package:salefny/generated/translations.g.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider = Provider<_HomeLogic>(
  (ref) => _HomeLogic(ref: ref),
);

class _HomeLogic extends _HomeStates {
  _HomeLogic({required super.ref});

  List<MySelectedItem> selectedList = [
    MySelectedItem(title: tr.home, iconPath: Assets.svgHome),
    MySelectedItem(title: tr.office, iconPath: Assets.svgBuildings),
  ];

  void setWorkBeforeBreakState() {
    bordState.state = TimerBordState.workBeforeBreak;
  }

  void setBreakState() {
    bordState.state = TimerBordState.breakInWork;
  }

  void setWorkAfterBreakState() {
    bordState.state = TimerBordState.workAfterBreak;
  }

  void setInitialBordState() {
    bordState.state = TimerBordState.initial;
  }

  void setCheckedOutState() {
    bordState.state = TimerBordState.checkedOut;
  }

  void setWorkType(WorkType type) {
    workType.state = type;
  }

}

class _HomeStates {
  final ProviderRef ref;
  final CustomState<bool> isLoading;
  final CustomState<TimerBordState> bordState;
  final CustomState<WorkType> workType;

  _HomeStates({required this.ref})
      : isLoading = CustomState(ref, false),
        bordState = CustomState(ref, TimerBordState.initial),
        workType = CustomState(ref, WorkType.fromHome);
}
