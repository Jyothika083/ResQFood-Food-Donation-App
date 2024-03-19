// ignore_for_file: must_be_immutable

part of 'get_started_two_bloc.dart';

/// Represents the state of GetStartedTwo in the application.
class GetStartedTwoState extends Equatable {
  GetStartedTwoState({this.getStartedTwoModelObj});

  GetStartedTwoModel? getStartedTwoModelObj;

  @override
  List<Object?> get props => [
        getStartedTwoModelObj,
      ];
  GetStartedTwoState copyWith({GetStartedTwoModel? getStartedTwoModelObj}) {
    return GetStartedTwoState(
      getStartedTwoModelObj:
          getStartedTwoModelObj ?? this.getStartedTwoModelObj,
    );
  }
}
