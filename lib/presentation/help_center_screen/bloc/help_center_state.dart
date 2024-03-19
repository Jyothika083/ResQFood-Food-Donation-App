// ignore_for_file: must_be_immutable

part of 'help_center_bloc.dart';

/// Represents the state of HelpCenter in the application.
class HelpCenterState extends Equatable {
  HelpCenterState({this.helpCenterModelObj});

  HelpCenterModel? helpCenterModelObj;

  @override
  List<Object?> get props => [
        helpCenterModelObj,
      ];
  HelpCenterState copyWith({HelpCenterModel? helpCenterModelObj}) {
    return HelpCenterState(
      helpCenterModelObj: helpCenterModelObj ?? this.helpCenterModelObj,
    );
  }
}
