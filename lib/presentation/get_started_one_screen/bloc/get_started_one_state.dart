// ignore_for_file: must_be_immutable

part of 'get_started_one_bloc.dart';

/// Represents the state of GetStartedOne in the application.
class GetStartedOneState extends Equatable {
  GetStartedOneState({this.getStartedOneModelObj});

  GetStartedOneModel? getStartedOneModelObj;

  @override
  List<Object?> get props => [
        getStartedOneModelObj,
      ];
  GetStartedOneState copyWith({GetStartedOneModel? getStartedOneModelObj}) {
    return GetStartedOneState(
      getStartedOneModelObj:
          getStartedOneModelObj ?? this.getStartedOneModelObj,
    );
  }
}
