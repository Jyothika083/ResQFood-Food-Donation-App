// ignore_for_file: must_be_immutable

part of 'get_started_bloc.dart';

/// Represents the state of GetStarted in the application.
class GetStartedState extends Equatable {
  GetStartedState({this.getStartedModelObj});

  GetStartedModel? getStartedModelObj;

  @override
  List<Object?> get props => [
        getStartedModelObj,
      ];
  GetStartedState copyWith({GetStartedModel? getStartedModelObj}) {
    return GetStartedState(
      getStartedModelObj: getStartedModelObj ?? this.getStartedModelObj,
    );
  }
}
