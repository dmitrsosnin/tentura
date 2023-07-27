import 'package:ferry/ferry.dart';
import 'package:flutter/material.dart';

import 'widget/error_center_text.dart';

export 'package:ferry/ferry.dart';
export 'package:get_it/get_it.dart';
export 'package:flutter/material.dart';
export 'package:ferry_flutter/ferry_flutter.dart';

/// Returns null if response has data otherwise shows loader or error
Widget? showLoaderOrErrorOr(
  OperationResponse<Object, Object>? response,
  Object? error,
) =>
    response?.data != null
        ? null
        : (response?.loading ?? false)
            ? const Center(child: CircularProgressIndicator.adaptive())
            : ErrorCenterText(response: response, error: error);
