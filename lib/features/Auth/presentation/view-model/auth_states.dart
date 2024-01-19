class Auth_states {}

// login
class AuthInit_State extends Auth_states {}

class LoginLoadingState extends Auth_states {}

class LoginSuccessState extends Auth_states {}

class LoginErrorState extends Auth_states {
  final String Error;

  LoginErrorState({required this.Error});
}

// regidter
class RegisterLoagingState extends Auth_states {}

class RegisterSuccessState extends Auth_states {}

class RegisterErrorState extends Auth_states {
  final String Error;

  RegisterErrorState({required this.Error});
}

//update

class UpdateLoadingState extends Auth_states {}

class UpdateSuccessState extends Auth_states {}

class UpdateErrorState extends Auth_states {
  final String Error;

  UpdateErrorState({required this.Error});
}
