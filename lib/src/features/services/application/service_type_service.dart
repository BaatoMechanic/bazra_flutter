import 'package:bato_mechanic/src/features/services/data/service_type_repository.dart';
import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
import 'package:bato_mechanic/src/features/vehicle_part/data/vehicle_parts_repository.dart';
import 'package:bato_mechanic/src/utils/model_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/service/service.dart';

part 'service_type_service.g.dart';

@riverpod
Future<Service> fetchRepairRequestServiceType(
        FetchRepairRequestServiceTypeRef ref, String repairRequestIdx) =>
    ref
        .watch(serviceTypeRepositoryProvider)
        .fetchRepairRequestServiceType(repairRequestIdx);
