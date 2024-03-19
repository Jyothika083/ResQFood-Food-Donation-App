// ignore_for_file: must_be_immutable

part of 'signup_bloc.dart';

/// Represents the state of Signup in the application.
class SignupState extends Equatable {
  SignupState({
    this.usernameController,
    this.emailController,
    this.phoneController,
    this.passwordController,
    this.termsAndConditionsCheckbox = false,
    this.signupModelObj,
  });
  TextEditingController? usernameController;
  TextEditingController? emailController;

  TextEditingController? phoneController;

  TextEditingController? passwordController;

  SignupModel? signupModelObj;

  bool termsAndConditionsCheckbox;

  @override
  List<Object?> get props => [
        emailController,
        phoneController,
        passwordController,
        termsAndConditionsCheckbox,
        signupModelObj,
      ];
  SignupState copyWith({
    TextEditingController? usernameController,
    TextEditingController? emailController,
    TextEditingController? phoneController,
    TextEditingController? passwordController,
    bool? termsAndConditionsCheckbox,
    SignupModel? signupModelObj,
  }) {
    return SignupState(
      usernameController: usernameController?? this.usernameController,
      emailController: emailController ?? this.emailController,
      phoneController:
          phoneController ?? this.phoneController,
      passwordController: passwordController ?? this.passwordController,
      termsAndConditionsCheckbox:
          termsAndConditionsCheckbox ?? this.termsAndConditionsCheckbox,
      signupModelObj: signupModelObj ?? this.signupModelObj,
    );
  }
}
