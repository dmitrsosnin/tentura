import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import 'package:tentura/consts.dart';

class ShowMoreText extends ReadMoreText {
  const ShowMoreText(
    super.data, {
    super.key,
    super.style,
    super.colorClickableText,
    super.trimLines = kMaxLines,
    super.trimMode = TrimMode.Line,
    super.textAlign = TextAlign.left,
  });
}
