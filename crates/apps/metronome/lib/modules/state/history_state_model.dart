import 'package:mobx/mobx.dart';

import '../history/session_entity.dart';

part 'history_state_model.g.dart';

// ignore: library_private_types_in_public_api
class HistoryStateModel = _HistoryStateModel with _$HistoryStateModel;

abstract class _HistoryStateModel with Store {
  @observable
  ObservableList<AggregatedSession> sessions = ObservableList.of([]);
}
