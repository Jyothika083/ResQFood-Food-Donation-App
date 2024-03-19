// ignore_for_file: must_be_immutable

part of 'received_requests_one_bloc.dart';

/// Represents the state of ReceivedRequestsOne in the application.
class ReceivedRequestsOneState extends Equatable {
  ReceivedRequestsOneState({
    this.nameController,
    this.nameController1,
    this.receivedRequestsOneModelObj,
  });

  TextEditingController? nameController;

  TextEditingController? nameController1;

  ReceivedRequestsOneModel? receivedRequestsOneModelObj;

  @override
  List<Object?> get props => [
        nameController,
        nameController1,
        receivedRequestsOneModelObj,
      ];
  ReceivedRequestsOneState copyWith({
    TextEditingController? nameController,
    TextEditingController? nameController1,
    ReceivedRequestsOneModel? receivedRequestsOneModelObj,
  }) {
    return ReceivedRequestsOneState(
      nameController: nameController ?? this.nameController,
      nameController1: nameController1 ?? this.nameController1,
      receivedRequestsOneModelObj:
          receivedRequestsOneModelObj ?? this.receivedRequestsOneModelObj,
    );
  }
}
