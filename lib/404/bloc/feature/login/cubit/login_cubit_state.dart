import 'package:equatable/equatable.dart';
import 'package:flutter_full_learn/404/bloc/feature/login/model/login_model.dart';
import 'package:flutter_full_learn/product/model/token_model.dart';

class LoginState extends Equatable {
  const LoginState({
    this.isLoading = false,
    this.model,
    this.tokenModel,
    this.isCompleted = false,
  });

  final LoginModel? model;
  final TokenModel? tokenModel;
  final bool isCompleted;
  final bool isLoading;

  @override
  List<Object?> get props => [isLoading, model];

  LoginState copyWith({
    LoginModel? model,
    TokenModel? tokenModel,
    bool? isCompleted,
    bool? isLoading,
  }) {
    return LoginState(
      model: model ?? this.model,
      tokenModel: tokenModel ?? this.tokenModel,
      isCompleted: isCompleted ?? false,
      isLoading: isLoading ?? false,
    );
  }
}
