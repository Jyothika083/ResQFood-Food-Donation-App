// ignore_for_file: must_be_immutable

part of 'profile_container_bloc.dart';

/// Represents the state of ProfileContainer in the application.
class ProfileContainerState extends Equatable {
  ProfileContainerState({this.profileContainerModelObj});

  ProfileContainerModel? profileContainerModelObj;

  @override
  List<Object?> get props => [
        profileContainerModelObj,
      ];
  ProfileContainerState copyWith(
      {ProfileContainerModel? profileContainerModelObj}) {
    return ProfileContainerState(
      profileContainerModelObj:
          profileContainerModelObj ?? this.profileContainerModelObj,
    );
  }
}
