import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/userprofile_item_model.dart';
import 'package:ResQFood/presentation/received_requests_three_screen/models/received_requests_three_model.dart';
part 'received_requests_three_event.dart';
part 'received_requests_three_state.dart';

/// A bloc that manages the state of a ReceivedRequestsThree according to the event that is dispatched to it.
class ReceivedRequestsThreeBloc
    extends Bloc<ReceivedRequestsThreeEvent, ReceivedRequestsThreeState> {
  ReceivedRequestsThreeBloc(ReceivedRequestsThreeState initialState)
      : super(initialState) {
    on<ReceivedRequestsThreeInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ReceivedRequestsThreeInitialEvent event,
    Emitter<ReceivedRequestsThreeState> emit,
  ) async {
    emit(state.copyWith(
        receivedRequestsThreeModelObj: state.receivedRequestsThreeModelObj
            ?.copyWith(userprofileItemList: fillUserprofileItemList())));
  }

  List<UserprofileItemModel> fillUserprofileItemList() {
    return [
      UserprofileItemModel(
          userImage: ImageConstant.imgImage22,
          someoneIsInNeed: "Someone is in need of fruits ")
    ];
  }
}
