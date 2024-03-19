// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'userprofile_item_model.dart';

/// This class defines the variables used in the [received_requests_three_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ReceivedRequestsThreeModel extends Equatable {
  ReceivedRequestsThreeModel({this.userprofileItemList = const []}) {}

  List<UserprofileItemModel> userprofileItemList;

  ReceivedRequestsThreeModel copyWith(
      {List<UserprofileItemModel>? userprofileItemList}) {
    return ReceivedRequestsThreeModel(
      userprofileItemList: userprofileItemList ?? this.userprofileItemList,
    );
  }

  @override
  List<Object?> get props => [userprofileItemList];
}
