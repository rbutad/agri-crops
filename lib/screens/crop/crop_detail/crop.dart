import 'package:agricrops/enums/operation_state_enum.dart';
import 'package:agricrops/screens/crop/crop_detail/components/manage_crop_component.dart';
import 'package:agricrops/screens/crop/crop_detail/components/view_crop_component.dart';
import 'package:flutter/material.dart';

class CropScreen extends StatefulWidget {
  final OperationState operationState;
  final String cropUid;
  const CropScreen({
    Key? key,
    this.operationState = OperationState.add,
    this.cropUid = '',
  }) : super(key: key);

  @override
  State<CropScreen> createState() => _CropScreenState();
}

class _CropScreenState extends State<CropScreen> {
  @override
  Widget build(BuildContext context) {
    switch (widget.operationState) {
      case OperationState.view:
        return ViewCropComponent(
          cropUid: widget.cropUid,
        );
      default:
        return const ManageCropComponent();
    }
  }
}
