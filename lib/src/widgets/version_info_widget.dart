import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class VersionInfoWidget extends StatelessWidget {
  final String prefixText;
  final String suffixText;
  final TextStyle? textStyle;

  const VersionInfoWidget({
    this.textStyle,
    this.prefixText = '',
    this.suffixText = '',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SnapHelperWidget<PackageInfoData>(
      future: getPackageInfo(),
      onSuccess: (data) {
        if (data.versionName.validate().isEmpty) return Offstage();

        return Text(
          '$prefixText${data.versionName.validate()}$suffixText',
          style: textStyle ?? primaryTextStyle(),
        );
      },
    );
  }
}
