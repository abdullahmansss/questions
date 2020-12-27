abstract class LoginStates {}

class LoginStateInitial extends LoginStates{}

class LoginStateLoading extends LoginStates{}

class LoginStateSuccess extends LoginStates
{
  String token;

  LoginStateSuccess(this.token);
}

class LoginStateError extends LoginStates
{
  String error;

  LoginStateError(this.error);
}