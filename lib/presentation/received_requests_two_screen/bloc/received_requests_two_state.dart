// ignore_for_file: must_be_immutable

part of 'received_requests_two_bloc.dart';

/// Represents the state of ReceivedRequestsTwo in the application.
class ReceivedRequestsTwoState extends Equatable {
  ReceivedRequestsTwoState({this.receivedRequestsTwoModelObj});

  ReceivedRequestsTwoModel? receivedRequestsTwoModelObj;

  @override
  List<Object?> get props => [
        receivedRequestsTwoModelObj,
      ];
  ReceivedRequestsTwoState copyWith(
      {ReceivedRequestsTwoModel? receivedRequestsTwoModelObj}) {
    return ReceivedRequestsTwoState(
      receivedRequestsTwoModelObj:
          receivedRequestsTwoModelObj ?? this.receivedRequestsTwoModelObj,
    );
  }
}
