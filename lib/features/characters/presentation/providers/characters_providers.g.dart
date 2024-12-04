// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$apiServiceHash() => r'4686b2c2860354bc3302e361cf96d5354966c414';

/// See also [apiService].
@ProviderFor(apiService)
final apiServiceProvider = AutoDisposeProvider<ApiService>.internal(
  apiService,
  name: r'apiServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$apiServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ApiServiceRef = AutoDisposeProviderRef<ApiService>;
String _$charactersServiceHash() => r'e7e0af9b03d57b02947b6fdcf060999e2c6531e9';

/// See also [charactersService].
@ProviderFor(charactersService)
final charactersServiceProvider =
    AutoDisposeProvider<CharactersService>.internal(
  charactersService,
  name: r'charactersServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$charactersServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CharactersServiceRef = AutoDisposeProviderRef<CharactersService>;
String _$getCharactersInPageHash() =>
    r'e247f08ee9c7f7563ce7de312fce92cb3bc1e038';

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

/// See also [getCharactersInPage].
@ProviderFor(getCharactersInPage)
const getCharactersInPageProvider = GetCharactersInPageFamily();

/// See also [getCharactersInPage].
class GetCharactersInPageFamily
    extends Family<AsyncValue<RickAndMortyResponse>> {
  /// See also [getCharactersInPage].
  const GetCharactersInPageFamily();

  /// See also [getCharactersInPage].
  GetCharactersInPageProvider call(
    String page,
  ) {
    return GetCharactersInPageProvider(
      page,
    );
  }

  @override
  GetCharactersInPageProvider getProviderOverride(
    covariant GetCharactersInPageProvider provider,
  ) {
    return call(
      provider.page,
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
  String? get name => r'getCharactersInPageProvider';
}

/// See also [getCharactersInPage].
class GetCharactersInPageProvider
    extends AutoDisposeFutureProvider<RickAndMortyResponse> {
  /// See also [getCharactersInPage].
  GetCharactersInPageProvider(
    String page,
  ) : this._internal(
          (ref) => getCharactersInPage(
            ref as GetCharactersInPageRef,
            page,
          ),
          from: getCharactersInPageProvider,
          name: r'getCharactersInPageProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getCharactersInPageHash,
          dependencies: GetCharactersInPageFamily._dependencies,
          allTransitiveDependencies:
              GetCharactersInPageFamily._allTransitiveDependencies,
          page: page,
        );

  GetCharactersInPageProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.page,
  }) : super.internal();

  final String page;

  @override
  Override overrideWith(
    FutureOr<RickAndMortyResponse> Function(GetCharactersInPageRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetCharactersInPageProvider._internal(
        (ref) => create(ref as GetCharactersInPageRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        page: page,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<RickAndMortyResponse> createElement() {
    return _GetCharactersInPageProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetCharactersInPageProvider && other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetCharactersInPageRef
    on AutoDisposeFutureProviderRef<RickAndMortyResponse> {
  /// The parameter `page` of this provider.
  String get page;
}

class _GetCharactersInPageProviderElement
    extends AutoDisposeFutureProviderElement<RickAndMortyResponse>
    with GetCharactersInPageRef {
  _GetCharactersInPageProviderElement(super.provider);

  @override
  String get page => (origin as GetCharactersInPageProvider).page;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
