import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/userrequest_item_model.dart';
import 'package:ResQFood/presentation/received_requests_two_screen/models/received_requests_two_model.dart';
part 'received_requests_two_event.dart';
part 'received_requests_two_state.dart';

/// A bloc that manages the state of a ReceivedRequestsTwo according to the event that is dispatched to it.
class ReceivedRequestsTwoBloc
    extends Bloc<ReceivedRequestsTwoEvent, ReceivedRequestsTwoState> {
  ReceivedRequestsTwoBloc(ReceivedRequestsTwoState initialState)
      : super(initialState) {
    on<ReceivedRequestsTwoInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ReceivedRequestsTwoInitialEvent event,
    Emitter<ReceivedRequestsTwoState> emit,
  ) async {
    emit(state.copyWith(
        receivedRequestsTwoModelObj: state.receivedRequestsTwoModelObj
            ?.copyWith(userrequestItemList: fillUserrequestItemList())));
  }

  List<UserrequestItemModel> fillUserrequestItemList() {
    return [
      UserrequestItemModel(
          userImage: ImageConstant.imgImage26,
          requestText: "Someone is in need of Bread and grains ",
          confirmButtonText: "confirm",
          declineButtonText: "decline"),
      UserrequestItemModel(
          userImage: ImageConstant.imgImage22,
          requestText: "Someone is in need of fruits ")
    ];
  }
}
