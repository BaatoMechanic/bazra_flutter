import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/domain/mechanic.dart';

part 'mechanic_tip.freezed.dart';
part 'mechanic_tip.g.dart';

List<MechanicTip> mechanicTipsFromJson(List<dynamic> jsonList) =>
    List<MechanicTip>.from(jsonList.map((x) => MechanicTip.fromJson(x)));

@freezed
class MechanicTip with _$MechanicTip {
  const factory MechanicTip({
    required String idx,
    required String tip,
    // required Map<String, dynamic> mechanic,
    required Mechanic mechanic,
  }) = _MechanicTip;

  factory MechanicTip.fromJson(Map<String, dynamic> json) =>
      _$MechanicTipFromJson(json);
}
