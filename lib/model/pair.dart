import 'package:equatable/equatable.dart';

class Pair<T, P> extends Equatable {
  final T first;
  final P second;
  const Pair(this.first, this.second);

  @override
  List<Object?> get props => [first, second];
}
