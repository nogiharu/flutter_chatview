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

import '../values/typedefs.dart';
import 'message.dart';

class ReplyPopupConfiguration {
  /// Used for giving background color to reply snack-bar.
  final Color? backgroundColor;

  /// Provides builder for creating reply pop-up widget.
  final Widget Function(Message message, bool sendByCurrentUser)? replyPopupBuilder;

  /// Provides callback on unSend button.
  final MessageCallBack? onUpdateTap; // 追加変更

  /// Provides callback on onReply button.
  final MessageCallBack? onReplyTap;

  /// Provides callback on onReport button.
  final MessageCallBack? onCopyTap; // 追加変更

  /// Provides callback on onMore button.
  // final VoidCallBack? onMoreTap;
  final MessageCallBack? onDeleteTap; // 追加変更

  /// Used to give text style of button text.
  final TextStyle? buttonTextStyle;

  /// Used to give color to top side border of reply snack bar.
  final Color? topBorderColor;

  const ReplyPopupConfiguration({
    this.buttonTextStyle,
    this.topBorderColor,
    this.onUpdateTap,
    this.onReplyTap,
    this.onCopyTap,
    this.onDeleteTap,
    this.backgroundColor,
    this.replyPopupBuilder,
  });
}
