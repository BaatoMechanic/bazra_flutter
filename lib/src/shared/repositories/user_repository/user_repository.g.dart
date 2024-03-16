// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userRepositoryHash() => r'0a5f94b49f085b0cd146c449d1db23dd99032a98';

/// See also [userRepository].
@ProviderFor(userRepository)
final userRepositoryProvider = AutoDisposeProvider<UserRepository>.internal(
  userRepository,
  name: r'userRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserRepositoryRef = AutoDisposeProviderRef<UserRepository>;
String _$fetchUserInfoHash() => r'b2ce6c3f0c221204548d244a857723605bf7934c';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [fetchUserInfo].
@ProviderFor(fetchUserInfo)
const fetchUserInfoProvider = FetchUserInfoFamily();

/// See also [fetchUserInfo].
class FetchUserInfoFamily extends Family<AsyncValue<User>> {
  /// See also [fetchUserInfo].
  const FetchUserInfoFamily();

  /// See also [fetchUserInfo].
  FetchUserInfoProvider call(
    String userIdx,
  ) {
    return FetchUserInfoProvider(
      userIdx,
    );
  }

  @override
  FetchUserInfoProvider getProviderOverride(
    covariant FetchUserInfoProvider provider,
  ) {
    return call(
      provider.userIdx,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchUserInfoProvider';
}

/// See also [fetchUserInfo].
class FetchUserInfoProvider extends AutoDisposeFutureProvider<User> {
  /// See also [fetchUserInfo].
  FetchUserInfoProvider(
    String userIdx,
  ) : this._internal(
          (ref) => fetchUserInfo(
            ref as FetchUserInfoRef,
            userIdx,
          ),
          from: fetchUserInfoProvider,
          name: r'fetchUserInfoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchUserInfoHash,
          dependencies: FetchUserInfoFamily._dependencies,
          allTransitiveDependencies:
              FetchUserInfoFamily._allTransitiveDependencies,
          userIdx: userIdx,
        );

  FetchUserInfoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userIdx,
  }) : super.internal();

  final String userIdx;

  @override
  Override overrideWith(
    FutureOr<User> Function(FetchUserInfoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchUserInfoProvider._internal(
        (ref) => create(ref as FetchUserInfoRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userIdx: userIdx,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<User> createElement() {
    return _FetchUserInfoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchUserInfoProvider && other.userIdx == userIdx;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userIdx.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchUserInfoRef on AutoDisposeFutureProviderRef<User> {
  /// The parameter `userIdx` of this provider.
  String get userIdx;
}

class _FetchUserInfoProviderElement
    extends AutoDisposeFutureProviderElement<User> with FetchUserInfoRef {
  _FetchUserInfoProviderElement(super.provider);

  @override
  String get userIdx => (origin as FetchUserInfoProvider).userIdx;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
