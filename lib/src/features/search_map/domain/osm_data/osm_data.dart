import 'package:freezed_annotation/freezed_annotation.dart';

part 'osm_data.freezed.dart';
// part 'osm_data.g.dart';

@freezed
class OSMData with _$OSMData {
  const factory OSMData({
    required String displayname,
    required double latitude,
    required double longitude,
  }) = _OSMdata;

  // factory OSMData.fromMap(Map<String, dynamic> json) => _$OSMDataFromJson(json);
}
