import 'package:freezed_annotation/freezed_annotation.dart';

part 'loading_task.freezed.dart';

@Freezed(genericArgumentFactories: true)
class LoadingTask<R> with _$LoadingTask {
  const factory LoadingTask.init() = Init;
  const factory LoadingTask.loading() = Loading;
  const factory LoadingTask.error(Object error) = Error;
  const factory LoadingTask.success(R result) = Success;
}
