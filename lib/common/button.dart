import 'package:flutter/widgets.dart';
import 'package:mp_antd_mobile/common/theme.dart';
import 'package:mpcore/mpkit/mpkit.dart';

class AutoLoadingAntButton extends StatefulWidget {
  final Widget? child;
  final Widget? loadingIcon;
  final String? loadingText;
  final AntButtonColor color;
  final AntButtonFill fill;
  final AntButtonShape shape;
  final AntButtonSize size;
  final bool disabled;
  final Future Function()? onPressed;

  const AutoLoadingAntButton({
    Key? key,
    this.child,
    this.loadingIcon,
    this.loadingText,
    this.color = AntButtonColor.normal,
    this.fill = AntButtonFill.solid,
    this.shape = AntButtonShape.rectangular,
    this.size = AntButtonSize.middle,
    this.disabled = false,
    this.onPressed,
  }) : super(key: key);

  @override
  State<AutoLoadingAntButton> createState() => _AutoLoadingAntButtonState();
}

class _AutoLoadingAntButtonState extends State<AutoLoadingAntButton> {
  var loading = false;

  @override
  Widget build(BuildContext context) {
    return AntButton(
      child: widget.child,
      loadingIcon: widget.loadingIcon,
      loadingText: widget.loadingText,
      color: widget.color,
      fill: widget.fill,
      shape: widget.shape,
      size: widget.size,
      loading: loading,
      disabled: widget.disabled,
      onPressed: () async {
        setState(() {
          loading = true;
        });
        try {
          await widget.onPressed?.call();
        } catch (e) {
        } finally {
          setState(() {
            loading = false;
          });
        }
      },
    );
  }
}

class AntButton extends StatelessWidget {
  final Widget? child;
  final Widget? loadingIcon;
  final String? loadingText;
  final AntButtonColor color;
  final AntButtonFill fill;
  final AntButtonShape shape;
  final AntButtonSize size;
  final bool loading;
  final bool disabled;
  final void Function()? onPressed;

  const AntButton({
    Key? key,
    this.child,
    this.loadingIcon,
    this.loadingText,
    this.color = AntButtonColor.normal,
    this.fill = AntButtonFill.solid,
    this.shape = AntButtonShape.rectangular,
    this.size = AntButtonSize.middle,
    this.loading = false,
    this.disabled = false,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (this.child == null) return Container();
    return makeDisabled(
      GestureDetector(
        onTap: this.onPressed,
        child: makeDefaultTextStyle(
          context,
          DecoratedBox(
            decoration: BoxDecoration(
              color: makeBackgroundColor(context),
              borderRadius: makeBorderRadius(context),
              border: makeBorder(context),
            ),
            child: makePadding(
              this.makeLoading(context) ?? this.child ?? Container(),
            ),
          ),
        ),
      ),
    );
  }

  Widget? makeLoading(BuildContext context) {
    if (!this.loading) return null;
    final textStyle = makeDefaultTextStyle(context, SizedBox()).style;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: (textStyle.fontSize ?? 14) * 1.5,
          child: Center(
            child: MPCircularProgressIndicator(
              color: textStyle.color ?? Colors.white,
              size: textStyle.fontSize ?? 14,
            ),
          ),
        ),
        SizedBox(width: this.loadingText != null ? 8 : 0),
        this.loadingText != null ? Text(this.loadingText!) : SizedBox(),
      ],
    );
  }

  Widget makeDisabled(Widget child) {
    if (this.disabled || this.loading) {
      return IgnorePointer(
        child: Opacity(
          opacity: 0.4,
          child: child,
        ),
      );
    } else {
      return child;
    }
  }

  Color makeBackgroundColor(BuildContext context,
      {bool measuringBorder = false}) {
    if (this.fill == AntButtonFill.none && !measuringBorder)
      return Colors.transparent;
    if (this.fill == AntButtonFill.outline && !measuringBorder)
      return Colors.transparent;
    switch (this.color) {
      case AntButtonColor.normal:
        return Colors.white;
      case AntButtonColor.primary:
        return AntTheme.of(context)?.primaryColor ?? Colors.blue;
      case AntButtonColor.success:
        return Color(0xff00b578);
      case AntButtonColor.danger:
        return Color(0xffff3141);
      case AntButtonColor.warning:
        return Color(0xffff8f1f);
      default:
        return Colors.white;
    }
  }

  Border? makeBorder(BuildContext context) {
    switch (this.fill) {
      case AntButtonFill.none:
        return null;
      case AntButtonFill.outline:
        if (this.color == AntButtonColor.normal) {
          return Border.all(
            width: 1,
            color: Color.fromARGB(255, 238, 238, 238),
          );
        }
        return Border.all(
          width: 1,
          color: makeBackgroundColor(context, measuringBorder: true),
        );
      case AntButtonFill.solid:
        if (this.color == AntButtonColor.normal) {
          return Border.all(
            width: 1,
            color: Color.fromARGB(255, 238, 238, 238),
          );
        }
        return null;
      default:
        return null;
    }
  }

  BorderRadius makeBorderRadius(BuildContext context) {
    switch (this.shape) {
      case AntButtonShape.normal:
        return BorderRadius.circular(0);
      case AntButtonShape.rectangular:
        return BorderRadius.circular(4);
      case AntButtonShape.rounded:
        return BorderRadius.circular(999);
      default:
        return BorderRadius.circular(4);
    }
  }

  Padding makePadding(Widget child) {
    return Padding(
      padding: (() {
        switch (this.size) {
          case AntButtonSize.large:
            return EdgeInsets.only(top: 11, bottom: 11, left: 11, right: 11);
          case AntButtonSize.small:
            return EdgeInsets.only(top: 3, bottom: 3, left: 12, right: 12);
          case AntButtonSize.mini:
            return EdgeInsets.only(top: 3, bottom: 3, left: 12, right: 12);
          default:
            return EdgeInsets.only(top: 7, bottom: 7, left: 12, right: 12);
        }
      })(),
      child: child,
    );
  }

  DefaultTextStyle makeDefaultTextStyle(BuildContext context, Widget child) {
    return DefaultTextStyle(
      textAlign: TextAlign.center,
      style: TextStyle(
        color: (() {
          if (this.fill == AntButtonFill.outline ||
              this.fill == AntButtonFill.none) {
            return this.makeBackgroundColor(context, measuringBorder: true);
          }
          return this.color == AntButtonColor.normal
              ? Colors.black
              : Colors.white;
        })(),
        fontSize: (() {
          final themeFontSize = AntTheme.of(context)?.textTheme.fontSize;
          if (themeFontSize == null) return 15.0;
          switch (this.size) {
            case AntButtonSize.large:
              return themeFontSize.size10;
            case AntButtonSize.middle:
              return themeFontSize.size10;
            case AntButtonSize.small:
              return themeFontSize.size7;
            case AntButtonSize.mini:
              return themeFontSize.main;
            default:
          }
        })(),
      ),
      child: child,
    );
  }
}

enum AntButtonColor {
  normal,
  primary,
  success,
  warning,
  danger,
}

enum AntButtonFill {
  solid,
  outline,
  none,
}

enum AntButtonShape {
  normal,
  rounded,
  rectangular,
}

enum AntButtonSize {
  mini,
  small,
  middle,
  large,
}
