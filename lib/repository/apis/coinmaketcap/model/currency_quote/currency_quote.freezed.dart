// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'currency_quote.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CurrencyQuote _$CurrencyQuoteFromJson(Map<String, dynamic> json) {
  return _CurrencyQuote.fromJson(json);
}

/// @nodoc
mixin _$CurrencyQuote {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get symbol => throw _privateConstructorUsedError;
  String? get slug => throw _privateConstructorUsedError;
  List<Tag>? get tags => throw _privateConstructorUsedError;
  Platform? get platform => throw _privateConstructorUsedError;
  Map<String, Quote>? get quote => throw _privateConstructorUsedError;
  @JsonKey(name: 'num_market_pairs')
  int? get numMarketPairs => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_added')
  DateTime? get dateAdded => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_supply')
  int? get maxSupply => throw _privateConstructorUsedError;
  @JsonKey(name: 'circulating_supply')
  double? get circulatingSupply => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_supply')
  double? get totalSupply => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  int? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'cmc_rank')
  int? get cmcRank => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_fiat')
  int? get isFiat => throw _privateConstructorUsedError;
  @JsonKey(name: 'self_reported_circulating_supply')
  dynamic get selfReportedCirculatingSupply =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'self_reported_market_cap')
  dynamic get selfReportedMarketCap => throw _privateConstructorUsedError;
  @JsonKey(name: 'tvl_ratio')
  dynamic get tvlRatio => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_updated')
  DateTime? get lastUpdated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CurrencyQuoteCopyWith<CurrencyQuote> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyQuoteCopyWith<$Res> {
  factory $CurrencyQuoteCopyWith(
          CurrencyQuote value, $Res Function(CurrencyQuote) then) =
      _$CurrencyQuoteCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String? name,
      String? symbol,
      String? slug,
      List<Tag>? tags,
      Platform? platform,
      Map<String, Quote>? quote,
      @JsonKey(name: 'num_market_pairs')
          int? numMarketPairs,
      @JsonKey(name: 'date_added')
          DateTime? dateAdded,
      @JsonKey(name: 'max_supply')
          int? maxSupply,
      @JsonKey(name: 'circulating_supply')
          double? circulatingSupply,
      @JsonKey(name: 'total_supply')
          double? totalSupply,
      @JsonKey(name: 'is_active')
          int? isActive,
      @JsonKey(name: 'cmc_rank')
          int? cmcRank,
      @JsonKey(name: 'is_fiat')
          int? isFiat,
      @JsonKey(name: 'self_reported_circulating_supply')
          dynamic selfReportedCirculatingSupply,
      @JsonKey(name: 'self_reported_market_cap')
          dynamic selfReportedMarketCap,
      @JsonKey(name: 'tvl_ratio')
          dynamic tvlRatio,
      @JsonKey(name: 'last_updated')
          DateTime? lastUpdated});

  $PlatformCopyWith<$Res>? get platform;
}

/// @nodoc
class _$CurrencyQuoteCopyWithImpl<$Res>
    implements $CurrencyQuoteCopyWith<$Res> {
  _$CurrencyQuoteCopyWithImpl(this._value, this._then);

  final CurrencyQuote _value;
  // ignore: unused_field
  final $Res Function(CurrencyQuote) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? symbol = freezed,
    Object? slug = freezed,
    Object? tags = freezed,
    Object? platform = freezed,
    Object? quote = freezed,
    Object? numMarketPairs = freezed,
    Object? dateAdded = freezed,
    Object? maxSupply = freezed,
    Object? circulatingSupply = freezed,
    Object? totalSupply = freezed,
    Object? isActive = freezed,
    Object? cmcRank = freezed,
    Object? isFiat = freezed,
    Object? selfReportedCirculatingSupply = freezed,
    Object? selfReportedMarketCap = freezed,
    Object? tvlRatio = freezed,
    Object? lastUpdated = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      symbol: symbol == freezed
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: slug == freezed
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>?,
      platform: platform == freezed
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as Platform?,
      quote: quote == freezed
          ? _value.quote
          : quote // ignore: cast_nullable_to_non_nullable
              as Map<String, Quote>?,
      numMarketPairs: numMarketPairs == freezed
          ? _value.numMarketPairs
          : numMarketPairs // ignore: cast_nullable_to_non_nullable
              as int?,
      dateAdded: dateAdded == freezed
          ? _value.dateAdded
          : dateAdded // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      maxSupply: maxSupply == freezed
          ? _value.maxSupply
          : maxSupply // ignore: cast_nullable_to_non_nullable
              as int?,
      circulatingSupply: circulatingSupply == freezed
          ? _value.circulatingSupply
          : circulatingSupply // ignore: cast_nullable_to_non_nullable
              as double?,
      totalSupply: totalSupply == freezed
          ? _value.totalSupply
          : totalSupply // ignore: cast_nullable_to_non_nullable
              as double?,
      isActive: isActive == freezed
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
      cmcRank: cmcRank == freezed
          ? _value.cmcRank
          : cmcRank // ignore: cast_nullable_to_non_nullable
              as int?,
      isFiat: isFiat == freezed
          ? _value.isFiat
          : isFiat // ignore: cast_nullable_to_non_nullable
              as int?,
      selfReportedCirculatingSupply: selfReportedCirculatingSupply == freezed
          ? _value.selfReportedCirculatingSupply
          : selfReportedCirculatingSupply // ignore: cast_nullable_to_non_nullable
              as dynamic,
      selfReportedMarketCap: selfReportedMarketCap == freezed
          ? _value.selfReportedMarketCap
          : selfReportedMarketCap // ignore: cast_nullable_to_non_nullable
              as dynamic,
      tvlRatio: tvlRatio == freezed
          ? _value.tvlRatio
          : tvlRatio // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lastUpdated: lastUpdated == freezed
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  @override
  $PlatformCopyWith<$Res>? get platform {
    if (_value.platform == null) {
      return null;
    }

    return $PlatformCopyWith<$Res>(_value.platform!, (value) {
      return _then(_value.copyWith(platform: value));
    });
  }
}

/// @nodoc
abstract class _$$_CurrencyQuoteCopyWith<$Res>
    implements $CurrencyQuoteCopyWith<$Res> {
  factory _$$_CurrencyQuoteCopyWith(
          _$_CurrencyQuote value, $Res Function(_$_CurrencyQuote) then) =
      __$$_CurrencyQuoteCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String? name,
      String? symbol,
      String? slug,
      List<Tag>? tags,
      Platform? platform,
      Map<String, Quote>? quote,
      @JsonKey(name: 'num_market_pairs')
          int? numMarketPairs,
      @JsonKey(name: 'date_added')
          DateTime? dateAdded,
      @JsonKey(name: 'max_supply')
          int? maxSupply,
      @JsonKey(name: 'circulating_supply')
          double? circulatingSupply,
      @JsonKey(name: 'total_supply')
          double? totalSupply,
      @JsonKey(name: 'is_active')
          int? isActive,
      @JsonKey(name: 'cmc_rank')
          int? cmcRank,
      @JsonKey(name: 'is_fiat')
          int? isFiat,
      @JsonKey(name: 'self_reported_circulating_supply')
          dynamic selfReportedCirculatingSupply,
      @JsonKey(name: 'self_reported_market_cap')
          dynamic selfReportedMarketCap,
      @JsonKey(name: 'tvl_ratio')
          dynamic tvlRatio,
      @JsonKey(name: 'last_updated')
          DateTime? lastUpdated});

  @override
  $PlatformCopyWith<$Res>? get platform;
}

/// @nodoc
class __$$_CurrencyQuoteCopyWithImpl<$Res>
    extends _$CurrencyQuoteCopyWithImpl<$Res>
    implements _$$_CurrencyQuoteCopyWith<$Res> {
  __$$_CurrencyQuoteCopyWithImpl(
      _$_CurrencyQuote _value, $Res Function(_$_CurrencyQuote) _then)
      : super(_value, (v) => _then(v as _$_CurrencyQuote));

  @override
  _$_CurrencyQuote get _value => super._value as _$_CurrencyQuote;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? symbol = freezed,
    Object? slug = freezed,
    Object? tags = freezed,
    Object? platform = freezed,
    Object? quote = freezed,
    Object? numMarketPairs = freezed,
    Object? dateAdded = freezed,
    Object? maxSupply = freezed,
    Object? circulatingSupply = freezed,
    Object? totalSupply = freezed,
    Object? isActive = freezed,
    Object? cmcRank = freezed,
    Object? isFiat = freezed,
    Object? selfReportedCirculatingSupply = freezed,
    Object? selfReportedMarketCap = freezed,
    Object? tvlRatio = freezed,
    Object? lastUpdated = freezed,
  }) {
    return _then(_$_CurrencyQuote(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      symbol: symbol == freezed
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: slug == freezed
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: tags == freezed
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>?,
      platform: platform == freezed
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as Platform?,
      quote: quote == freezed
          ? _value._quote
          : quote // ignore: cast_nullable_to_non_nullable
              as Map<String, Quote>?,
      numMarketPairs: numMarketPairs == freezed
          ? _value.numMarketPairs
          : numMarketPairs // ignore: cast_nullable_to_non_nullable
              as int?,
      dateAdded: dateAdded == freezed
          ? _value.dateAdded
          : dateAdded // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      maxSupply: maxSupply == freezed
          ? _value.maxSupply
          : maxSupply // ignore: cast_nullable_to_non_nullable
              as int?,
      circulatingSupply: circulatingSupply == freezed
          ? _value.circulatingSupply
          : circulatingSupply // ignore: cast_nullable_to_non_nullable
              as double?,
      totalSupply: totalSupply == freezed
          ? _value.totalSupply
          : totalSupply // ignore: cast_nullable_to_non_nullable
              as double?,
      isActive: isActive == freezed
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
      cmcRank: cmcRank == freezed
          ? _value.cmcRank
          : cmcRank // ignore: cast_nullable_to_non_nullable
              as int?,
      isFiat: isFiat == freezed
          ? _value.isFiat
          : isFiat // ignore: cast_nullable_to_non_nullable
              as int?,
      selfReportedCirculatingSupply: selfReportedCirculatingSupply == freezed
          ? _value.selfReportedCirculatingSupply
          : selfReportedCirculatingSupply // ignore: cast_nullable_to_non_nullable
              as dynamic,
      selfReportedMarketCap: selfReportedMarketCap == freezed
          ? _value.selfReportedMarketCap
          : selfReportedMarketCap // ignore: cast_nullable_to_non_nullable
              as dynamic,
      tvlRatio: tvlRatio == freezed
          ? _value.tvlRatio
          : tvlRatio // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lastUpdated: lastUpdated == freezed
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CurrencyQuote implements _CurrencyQuote {
  _$_CurrencyQuote(
      {this.id,
      this.name,
      this.symbol,
      this.slug,
      final List<Tag>? tags,
      this.platform,
      final Map<String, Quote>? quote,
      @JsonKey(name: 'num_market_pairs')
          this.numMarketPairs,
      @JsonKey(name: 'date_added')
          this.dateAdded,
      @JsonKey(name: 'max_supply')
          this.maxSupply,
      @JsonKey(name: 'circulating_supply')
          this.circulatingSupply,
      @JsonKey(name: 'total_supply')
          this.totalSupply,
      @JsonKey(name: 'is_active')
          this.isActive,
      @JsonKey(name: 'cmc_rank')
          this.cmcRank,
      @JsonKey(name: 'is_fiat')
          this.isFiat,
      @JsonKey(name: 'self_reported_circulating_supply')
          this.selfReportedCirculatingSupply,
      @JsonKey(name: 'self_reported_market_cap')
          this.selfReportedMarketCap,
      @JsonKey(name: 'tvl_ratio')
          this.tvlRatio,
      @JsonKey(name: 'last_updated')
          this.lastUpdated})
      : _tags = tags,
        _quote = quote;

  factory _$_CurrencyQuote.fromJson(Map<String, dynamic> json) =>
      _$$_CurrencyQuoteFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? symbol;
  @override
  final String? slug;
  final List<Tag>? _tags;
  @override
  List<Tag>? get tags {
    final value = _tags;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Platform? platform;
  final Map<String, Quote>? _quote;
  @override
  Map<String, Quote>? get quote {
    final value = _quote;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(name: 'num_market_pairs')
  final int? numMarketPairs;
  @override
  @JsonKey(name: 'date_added')
  final DateTime? dateAdded;
  @override
  @JsonKey(name: 'max_supply')
  final int? maxSupply;
  @override
  @JsonKey(name: 'circulating_supply')
  final double? circulatingSupply;
  @override
  @JsonKey(name: 'total_supply')
  final double? totalSupply;
  @override
  @JsonKey(name: 'is_active')
  final int? isActive;
  @override
  @JsonKey(name: 'cmc_rank')
  final int? cmcRank;
  @override
  @JsonKey(name: 'is_fiat')
  final int? isFiat;
  @override
  @JsonKey(name: 'self_reported_circulating_supply')
  final dynamic selfReportedCirculatingSupply;
  @override
  @JsonKey(name: 'self_reported_market_cap')
  final dynamic selfReportedMarketCap;
  @override
  @JsonKey(name: 'tvl_ratio')
  final dynamic tvlRatio;
  @override
  @JsonKey(name: 'last_updated')
  final DateTime? lastUpdated;

  @override
  String toString() {
    return 'CurrencyQuote(id: $id, name: $name, symbol: $symbol, slug: $slug, tags: $tags, platform: $platform, quote: $quote, numMarketPairs: $numMarketPairs, dateAdded: $dateAdded, maxSupply: $maxSupply, circulatingSupply: $circulatingSupply, totalSupply: $totalSupply, isActive: $isActive, cmcRank: $cmcRank, isFiat: $isFiat, selfReportedCirculatingSupply: $selfReportedCirculatingSupply, selfReportedMarketCap: $selfReportedMarketCap, tvlRatio: $tvlRatio, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CurrencyQuote &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.symbol, symbol) &&
            const DeepCollectionEquality().equals(other.slug, slug) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(other.platform, platform) &&
            const DeepCollectionEquality().equals(other._quote, _quote) &&
            const DeepCollectionEquality()
                .equals(other.numMarketPairs, numMarketPairs) &&
            const DeepCollectionEquality().equals(other.dateAdded, dateAdded) &&
            const DeepCollectionEquality().equals(other.maxSupply, maxSupply) &&
            const DeepCollectionEquality()
                .equals(other.circulatingSupply, circulatingSupply) &&
            const DeepCollectionEquality()
                .equals(other.totalSupply, totalSupply) &&
            const DeepCollectionEquality().equals(other.isActive, isActive) &&
            const DeepCollectionEquality().equals(other.cmcRank, cmcRank) &&
            const DeepCollectionEquality().equals(other.isFiat, isFiat) &&
            const DeepCollectionEquality().equals(
                other.selfReportedCirculatingSupply,
                selfReportedCirculatingSupply) &&
            const DeepCollectionEquality()
                .equals(other.selfReportedMarketCap, selfReportedMarketCap) &&
            const DeepCollectionEquality().equals(other.tvlRatio, tvlRatio) &&
            const DeepCollectionEquality()
                .equals(other.lastUpdated, lastUpdated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(id),
        const DeepCollectionEquality().hash(name),
        const DeepCollectionEquality().hash(symbol),
        const DeepCollectionEquality().hash(slug),
        const DeepCollectionEquality().hash(_tags),
        const DeepCollectionEquality().hash(platform),
        const DeepCollectionEquality().hash(_quote),
        const DeepCollectionEquality().hash(numMarketPairs),
        const DeepCollectionEquality().hash(dateAdded),
        const DeepCollectionEquality().hash(maxSupply),
        const DeepCollectionEquality().hash(circulatingSupply),
        const DeepCollectionEquality().hash(totalSupply),
        const DeepCollectionEquality().hash(isActive),
        const DeepCollectionEquality().hash(cmcRank),
        const DeepCollectionEquality().hash(isFiat),
        const DeepCollectionEquality().hash(selfReportedCirculatingSupply),
        const DeepCollectionEquality().hash(selfReportedMarketCap),
        const DeepCollectionEquality().hash(tvlRatio),
        const DeepCollectionEquality().hash(lastUpdated)
      ]);

  @JsonKey(ignore: true)
  @override
  _$$_CurrencyQuoteCopyWith<_$_CurrencyQuote> get copyWith =>
      __$$_CurrencyQuoteCopyWithImpl<_$_CurrencyQuote>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CurrencyQuoteToJson(this);
  }
}

abstract class _CurrencyQuote implements CurrencyQuote {
  factory _CurrencyQuote(
      {final int? id,
      final String? name,
      final String? symbol,
      final String? slug,
      final List<Tag>? tags,
      final Platform? platform,
      final Map<String, Quote>? quote,
      @JsonKey(name: 'num_market_pairs')
          final int? numMarketPairs,
      @JsonKey(name: 'date_added')
          final DateTime? dateAdded,
      @JsonKey(name: 'max_supply')
          final int? maxSupply,
      @JsonKey(name: 'circulating_supply')
          final double? circulatingSupply,
      @JsonKey(name: 'total_supply')
          final double? totalSupply,
      @JsonKey(name: 'is_active')
          final int? isActive,
      @JsonKey(name: 'cmc_rank')
          final int? cmcRank,
      @JsonKey(name: 'is_fiat')
          final int? isFiat,
      @JsonKey(name: 'self_reported_circulating_supply')
          final dynamic selfReportedCirculatingSupply,
      @JsonKey(name: 'self_reported_market_cap')
          final dynamic selfReportedMarketCap,
      @JsonKey(name: 'tvl_ratio')
          final dynamic tvlRatio,
      @JsonKey(name: 'last_updated')
          final DateTime? lastUpdated}) = _$_CurrencyQuote;

  factory _CurrencyQuote.fromJson(Map<String, dynamic> json) =
      _$_CurrencyQuote.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get symbol;
  @override
  String? get slug;
  @override
  List<Tag>? get tags;
  @override
  Platform? get platform;
  @override
  Map<String, Quote>? get quote;
  @override
  @JsonKey(name: 'num_market_pairs')
  int? get numMarketPairs;
  @override
  @JsonKey(name: 'date_added')
  DateTime? get dateAdded;
  @override
  @JsonKey(name: 'max_supply')
  int? get maxSupply;
  @override
  @JsonKey(name: 'circulating_supply')
  double? get circulatingSupply;
  @override
  @JsonKey(name: 'total_supply')
  double? get totalSupply;
  @override
  @JsonKey(name: 'is_active')
  int? get isActive;
  @override
  @JsonKey(name: 'cmc_rank')
  int? get cmcRank;
  @override
  @JsonKey(name: 'is_fiat')
  int? get isFiat;
  @override
  @JsonKey(name: 'self_reported_circulating_supply')
  dynamic get selfReportedCirculatingSupply;
  @override
  @JsonKey(name: 'self_reported_market_cap')
  dynamic get selfReportedMarketCap;
  @override
  @JsonKey(name: 'tvl_ratio')
  dynamic get tvlRatio;
  @override
  @JsonKey(name: 'last_updated')
  DateTime? get lastUpdated;
  @override
  @JsonKey(ignore: true)
  _$$_CurrencyQuoteCopyWith<_$_CurrencyQuote> get copyWith =>
      throw _privateConstructorUsedError;
}
