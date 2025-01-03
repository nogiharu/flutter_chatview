/*
 * Copyright (c) 2022 Simform Solutions
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
import 'package:flutter/material.dart';

import 'package:chatview/src/utils/package_strings.dart';

import '../values/typedefs.dart';

class ReplyPopupWidget extends StatelessWidget {
  ReplyPopupWidget({
    Key? key,
    required this.sendByCurrentUser,
    this.onUpdateTap,
    required this.onReplyTap,
    required this.onCopyTap,
    required this.onDeleteTap,
    this.buttonTextStyle,
    this.topBorderColor,
  }) : super(key: key);

  /// Represents message is sent by current user or not.
  final bool sendByCurrentUser;

  /// Provides call back when user tap on unsend button.
  VoidCallBack? onUpdateTap;

  /// Provides call back when user tap on reply button.
  final VoidCallBack onReplyTap;

  /// Provides call back when user tap on report button.
  final VoidCallBack onCopyTap;

  /// Provides call back when user tap on more button.
  final VoidCallBack onDeleteTap;

  /// Allow user to set text style of button are showed in reply snack bar.
  final TextStyle? buttonTextStyle;

  /// Allow user to set color of top border of reply snack bar.
  final Color? topBorderColor;

  @override
  Widget build(BuildContext context) {
    final textStyle = buttonTextStyle ?? const TextStyle(fontSize: 14, color: Colors.black);
    final deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      height: deviceWidth > 500 ? deviceWidth * 0.05 : deviceWidth * 0.13,
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: topBorderColor ?? Colors.grey.shade400, width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: onReplyTap,
            child: Text(
              PackageStrings.reply,
              style: textStyle,
            ),
          ),
          if (sendByCurrentUser && onUpdateTap != null)
            InkWell(
              onTap: onUpdateTap,
              child: Text(
                PackageStrings.updateTo,
                style: textStyle,
              ),
            ),
          if (sendByCurrentUser) // 追加変更
            InkWell(
              onTap: onDeleteTap,
              child: Text(
                PackageStrings.delete,
                style: textStyle,
              ),
            ),
          InkWell(
            // 追加変更
            onTap: onCopyTap,
            child: Text(
              PackageStrings.copy,
              style: textStyle,
            ),
          ),
        ],
      ),
    );
  }
}
