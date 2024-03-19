// ignore_for_file: must_be_immutable

part of 'received_requests_bloc.dart';

/// Represents the state of ReceivedRequests in the application.
class ReceivedRequestsState extends Equatable {
  ReceivedRequestsState({

    this.ngoNumberController,
    this.categoryController,
    this.quantityController,
    this.itemController,
    this.receivedRequestsModelObj,
  });


  TextEditingController? itemController;
  TextEditingController? categoryController;
  TextEditingController? quantityController;
  TextEditingController? ngoNumberController;
  ReceivedRequestsModel? receivedRequestsModelObj;

  @override
  List<Object?> get props => [

        itemController,
        categoryController,
        ngoNumberController,
        quantityController,
        receivedRequestsModelObj,
      ];
  ReceivedRequestsState copyWith({
    TextEditingController? ngoNumberController,
    TextEditingController? itemController,
    TextEditingController? categoryController,

    TextEditingController? quantityController,
    ReceivedRequestsModel? receivedRequestsModelObj,
  }) {
    return ReceivedRequestsState(
      ngoNumberController: ngoNumberController ?? this.ngoNumberController,
      itemController: itemController ?? this.itemController,
      quantityController: quantityController ?? this.quantityController,
      categoryController: categoryController?? this.categoryController,
      // nameController: nameController ?? this.nameController,
      receivedRequestsModelObj: receivedRequestsModelObj ?? this.receivedRequestsModelObj,
      // Add other properties if needed
    );
  }
}
