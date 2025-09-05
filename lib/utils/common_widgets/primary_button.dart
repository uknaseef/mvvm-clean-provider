import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String? title;
  final bool isLoading;
  final VoidCallback? onPressed;
  final Color? shadowColor;
  final Color? backgroundColor;
  final Gradient? gradient;
  final Color? splashColor;
  final TextStyle? fontStyle;
  final EdgeInsetsGeometry? padding;
  final Color? textColor;
  final Widget? icon;
  final double? iconPadding;
  final double? elevation;
  final double? radius;
  final TextScaler? textScaleFactor;
  final Color? progressColor;
  final Color? progressBackgroundColor;
  final double? loadingRadius;
  final BorderSide? side;
  final Widget? leadingIco;

  const PrimaryButton({
    super.key,
    this.height,
    this.width,
    this.title,
    this.isLoading = false,
    this.onPressed,
    this.shadowColor,
    this.fontStyle,
    this.backgroundColor,
    this.textColor,
    this.padding,
    this.icon,
    this.iconPadding,
    this.radius,
    this.textScaleFactor,
    this.elevation,
    this.splashColor,
    this.progressColor,
    this.progressBackgroundColor,
    this.gradient,
    this.loadingRadius,
    this.side,
    this.leadingIco,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(radius ?? 12);
    return InkWell(
      onTap: onPressed,
      borderRadius: borderRadius,
      splashColor: splashColor ?? Colors.black.withValues(alpha: 0.1),
      child: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              gradient: gradient,
              color:
                  gradient == null
                      ? (onPressed != null
                          ? (backgroundColor ?? Theme.of(context).primaryColor)
                          : Colors.grey[300])
                      : null,
              borderRadius: borderRadius,
              boxShadow: [
                if (shadowColor != null)
                  BoxShadow(
                    color: shadowColor!,
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
              ],
              border: side != null ? Border.fromBorderSide(side!) : null,
            ),
            height: height ?? 48,
            width: width,
            child: ElevatedButton(
              onPressed:
                  isLoading ? (onPressed != null ? () {} : null) : onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    gradient == null
                        ? (onPressed != null
                            ? (backgroundColor ??
                                Theme.of(context).primaryColor)
                            : Colors.grey[300])
                        : Colors.transparent,
                elevation: elevation ?? 0,
                padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
                shape: RoundedRectangleBorder(borderRadius: borderRadius),
                side: side ?? BorderSide.none,
              ),
              child:
                  isLoading
                      ? CupertinoActivityIndicator(
                        radius: loadingRadius ?? 12,
                        color: progressColor ?? Colors.white,
                      )
                      : Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (icon != null) icon!,
                          if (icon != null && (iconPadding ?? 0) > 0)
                            SizedBox(width: iconPadding),
                          if (leadingIco != null) leadingIco!,
                          Flexible(
                            child: Text(
                              title ?? '',
                              textScaler: textScaleFactor,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style:
                                  fontStyle ??
                                  TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color:
                                        onPressed == null
                                            ? Colors.grey[600]
                                            : (textColor ?? Colors.white),
                                  ),
                            ),
                          ),
                        ],
                      ),
            ),
          ),
        ],
      ),
    );
  }
}
