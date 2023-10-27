import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';

@freezed
class AppState<T> with _$AppState<T> {
  const factory AppState.started() = _AppStarted<T>;
  const factory AppState.authenticated() = _Authenticated<T>;
  const factory AppState.unAuthenticated({required bool isSignIn}) =
      _UnAuthenticated<T>;
}
