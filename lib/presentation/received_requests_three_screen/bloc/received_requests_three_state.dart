// ignore_for_file: must_be_immutable

part of 'received_requests_three_bloc.dart';

/// Represents the state of ReceivedRequestsThree in the application.
class ReceivedRequestsThreeState extends Equatable {
  ReceivedRequestsThreeState({this.receivedRequestsThreeModelObj});

  ReceivedRequestsThreeModel? receivedRequestsThreeModelObj;

  @override
  List<Object?> get props => [
        receivedRequestsThreeModelObj,
      ];
  ReceivedRequestsThreeState copyWith(
      {ReceivedRequestsThreeModel? receivedRequestsThreeModelObj}) {
    return ReceivedRequestsThreeState(
      receivedRequestsThreeModelObj:
          receivedRequestsThreeModelObj ?? this.receivedRequestsThreeModelObj,
    );
  }
}
