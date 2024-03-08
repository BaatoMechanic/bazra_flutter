// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviews_and_rating_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchMechanicReviewsHash() =>
    r'7831b973cc262f4f540e3ba833ba565aed19b057';

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

/// See also [fetchMechanicReviews].
@ProviderFor(fetchMechanicReviews)
const fetchMechanicReviewsProvider = FetchMechanicReviewsFamily();

/// See also [fetchMechanicReviews].
class FetchMechanicReviewsFamily
    extends Family<AsyncValue<List<ReviewAndRating>>> {
  /// See also [fetchMechanicReviews].
  const FetchMechanicReviewsFamily();

  /// See also [fetchMechanicReviews].
  FetchMechanicReviewsProvider call(
    String mechanicIdx,
  ) {
    return FetchMechanicReviewsProvider(
      mechanicIdx,
    );
  }

  @override
  FetchMechanicReviewsProvider getProviderOverride(
    covariant FetchMechanicReviewsProvider provider,
  ) {
    return call(
      provider.mechanicIdx,
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
  String? get name => r'fetchMechanicReviewsProvider';
}

/// See also [fetchMechanicReviews].
class FetchMechanicReviewsProvider
    extends AutoDisposeFutureProvider<List<ReviewAndRating>> {
  /// See also [fetchMechanicReviews].
  FetchMechanicReviewsProvider(
    String mechanicIdx,
  ) : this._internal(
          (ref) => fetchMechanicReviews(
            ref as FetchMechanicReviewsRef,
            mechanicIdx,
          ),
          from: fetchMechanicReviewsProvider,
          name: r'fetchMechanicReviewsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchMechanicReviewsHash,
          dependencies: FetchMechanicReviewsFamily._dependencies,
          allTransitiveDependencies:
              FetchMechanicReviewsFamily._allTransitiveDependencies,
          mechanicIdx: mechanicIdx,
        );

  FetchMechanicReviewsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.mechanicIdx,
  }) : super.internal();

  final String mechanicIdx;

  @override
  Override overrideWith(
    FutureOr<List<ReviewAndRating>> Function(FetchMechanicReviewsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchMechanicReviewsProvider._internal(
        (ref) => create(ref as FetchMechanicReviewsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        mechanicIdx: mechanicIdx,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ReviewAndRating>> createElement() {
    return _FetchMechanicReviewsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchMechanicReviewsProvider &&
        other.mechanicIdx == mechanicIdx;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, mechanicIdx.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchMechanicReviewsRef
    on AutoDisposeFutureProviderRef<List<ReviewAndRating>> {
  /// The parameter `mechanicIdx` of this provider.
  String get mechanicIdx;
}

class _FetchMechanicReviewsProviderElement
    extends AutoDisposeFutureProviderElement<List<ReviewAndRating>>
    with FetchMechanicReviewsRef {
  _FetchMechanicReviewsProviderElement(super.provider);

  @override
  String get mechanicIdx =>
      (origin as FetchMechanicReviewsProvider).mechanicIdx;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
