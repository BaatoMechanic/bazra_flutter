import 'package:bato_mechanic/src/features/services/data/service_type_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/service/service.dart';

part 'service_type_service.g.dart';

@riverpod
Future<Service> fetchRepairRequestServiceType(
        FetchRepairRequestServiceTypeRef ref, String repairRequestIdx) =>
    ref
        .watch(serviceTypeRepositoryProvider)
        .fetchRepairRequestServiceType(repairRequestIdx);
