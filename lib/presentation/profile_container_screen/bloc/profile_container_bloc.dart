import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:ResQFood/presentation/profile_container_screen/models/profile_container_model.dart';
part 'profile_container_event.dart';
part 'profile_container_state.dart';

/// A bloc that manages the state of a ProfileContainer according to the event that is dispatched to it.
class ProfileContainerBloc
    extends Bloc<ProfileContainerEvent, ProfileContainerState> {
  ProfileContainerBloc(ProfileContainerState initialState)
      : super(initialState) {
    on<ProfileContainerInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ProfileContainerInitialEvent event,
    Emitter<ProfileContainerState> emit,
  ) async {}
}
