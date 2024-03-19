import 'bloc/get_started_one_bloc.dart';
import 'models/get_started_one_model.dart';
import 'package:flutter/material.dart';
import 'package:ResQFood/core/app_export.dart';

class GetStartedOneScreen extends StatelessWidget {
  const GetStartedOneScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<GetStartedOneBloc>(
        create: (context) => GetStartedOneBloc(
            GetStartedOneState(getStartedOneModelObj: GetStartedOneModel()))
          ..add(GetStartedOneInitialEvent()),
        child: GetStartedOneScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetStartedOneBloc, GetStartedOneState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              backgroundColor: appTheme.green50,
              body: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(vertical: 152.v),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(flex: 47),
                        CustomImageView(
                            imagePath: ImageConstant.imgResqfoodHighR,
                            height: 262.v,
                            width: 254.h),
                        Spacer(flex: 52),
                        Text("lbl_tap_anywhere".tr,
                            style: CustomTextStyles.titleLargePrimaryContainer)
                      ]))));
    });
  }
}
