import 'package:flutter/material.dart';
import '../../res/enums/enums.dart';
import '../../res/styles/fonts/inter_font.dart';
import 'primary_button.dart';

class CommonSwitchState extends StatefulWidget {
  final LoaderState loaderState;
  final void Function()? reload;
  final Widget child;
  final Widget? loader;
  final String? errorTitle;
  final String? errorMessage;
  final String? buttonText;
  final Widget? noData;
  final Widget? noSearchData;
  final Widget? errorWidget;
  final String? emptyScreenTitle;
  final String? emptyScreenDescription;
  final ScrollPhysics? scrollPhysics;
  final double? topMargin;
  final void Function()? customButtonFunction;
  final MainAxisAlignment? emptyMainAxisAlignment;

  const CommonSwitchState({
    super.key,
    required this.loaderState,
    this.reload,
    required this.child,
    this.noData,
    this.loader,
    this.errorTitle,
    this.errorMessage,
    this.buttonText,
    this.errorWidget,
    this.noSearchData,
    this.scrollPhysics,
    this.emptyScreenTitle,
    this.topMargin,
    this.emptyScreenDescription,
    this.emptyMainAxisAlignment,
    this.customButtonFunction,
  });

  @override
  State<CommonSwitchState> createState() => _CommonSwitchStateState();
}

class _CommonSwitchStateState extends State<CommonSwitchState> {
  /*<==========Error state widget========>*/
  Widget get error =>
      widget.errorWidget ??
      CommonErrorOrNoDataWidget(
        title: widget.errorTitle,
        errorMessage: widget.errorMessage,
        scrollPhysics: widget.scrollPhysics,
      );

  /*<==========Server Error state widget========>*/
  Widget get serverError => CommonErrorOrNoDataWidget(
    reload: widget.reload,
    isServerError: true,
    title: "Server error",
    errorMessage:
        "The server has been deserted for a while. Please be patient or try again later.",
    buttonText: widget.buttonText,
    customButtonFunction: widget.reload,
    scrollPhysics: widget.scrollPhysics,
    topMargin: widget.topMargin,
    emptyMainAxisAlignment: widget.emptyMainAxisAlignment,
  );

  /*<==========Network Error state widget========>*/
  Widget get networkError => CommonErrorOrNoDataWidget(
    reload: widget.reload,
    title: "Network error!",
    errorMessage: "No internet connection. Please try again",
    buttonText: 'Retry',
    customButtonFunction: widget.reload,
    scrollPhysics: widget.scrollPhysics,
    topMargin: widget.topMargin,
    emptyMainAxisAlignment: widget.emptyMainAxisAlignment,
    icon: Icons.wifi_off,
  );

  /*<==========Loader state widget========>*/
  Widget get loader =>
      widget.loader ??
      const Align(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      );

  /*<==========No Data state widget========>*/
  Widget get noData =>
      widget.noData ??
      CommonErrorOrNoDataWidget(
        title: widget.emptyScreenTitle ?? "No data available",
        errorMessage:
            widget.emptyScreenDescription ??
            "There is no data to show you right now.",
        buttonText: widget.buttonText,
        customButtonFunction: widget.customButtonFunction,
        scrollPhysics: widget.scrollPhysics,
        topMargin: widget.topMargin,
        emptyMainAxisAlignment: widget.emptyMainAxisAlignment,
        icon: Icons.inbox_outlined,
      );

  /*<==========No Search Data state widget========>*/
  Widget get noSearchData =>
      widget.noSearchData ??
      CommonErrorOrNoDataWidget(
        title: widget.emptyScreenTitle ?? "Sorry, no results found!",
        errorMessage:
            widget.emptyScreenDescription ??
            "Please try refining your search or using different keywords.",
        buttonText: widget.buttonText,
        customButtonFunction: widget.customButtonFunction,
        scrollPhysics: widget.scrollPhysics,
        topMargin: widget.topMargin,
        emptyMainAxisAlignment: widget.emptyMainAxisAlignment,
        icon: Icons.search_off,
      );

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      key: ValueKey(widget.loaderState),
      transitionBuilder:
          (child, animation) =>
              FadeTransition(opacity: animation, child: child),
      duration: const Duration(milliseconds: 300),
      child: switch (widget.loaderState) {
        LoaderState.error => error,
        LoaderState.serverError => serverError,
        LoaderState.loading => loader,
        LoaderState.loaded => widget.child,
        LoaderState.networkError => networkError,
        LoaderState.noData => noData,
        LoaderState.noSearchData => noSearchData,
      },
    );
  }
}

class CommonErrorOrNoDataWidget extends StatefulWidget {
  final String? title;
  final String? errorMessage;
  final String? buttonText;
  final bool isServerError;
  final ScrollPhysics? scrollPhysics;
  final double? topMargin;
  final void Function()? reload;
  final void Function()? customButtonFunction;
  final MainAxisAlignment? emptyMainAxisAlignment;
  final IconData? icon;

  const CommonErrorOrNoDataWidget({
    super.key,
    this.title,
    this.errorMessage,
    this.isServerError = false,
    this.reload,
    this.customButtonFunction,
    this.topMargin,
    this.scrollPhysics,
    this.emptyMainAxisAlignment,
    this.buttonText,
    this.icon,
  });

  @override
  State<CommonErrorOrNoDataWidget> createState() =>
      _CommonTabErrorOrNoDataWidgetState();
}

class _CommonTabErrorOrNoDataWidgetState
    extends State<CommonErrorOrNoDataWidget> {
  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  @override
  void dispose() {
    isLoading.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: WidgetSizeNotifier(
                builder: (context, size, child) {
                  return SingleChildScrollView(
                    physics:
                        widget.scrollPhysics ??
                        const NeverScrollableScrollPhysics(),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: size.height,
                      child: Column(
                        mainAxisAlignment:
                            widget.emptyMainAxisAlignment ??
                            MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: widget.topMargin ?? 63),
                          widget.isServerError
                              ? Text(
                                "500",
                                style: InterFontPalette.fBlack_10_500,
                              )
                              : Icon(
                                widget.icon ?? Icons.error_outline,
                                size: 64,
                                color: Colors.grey,
                              ),
                          const SizedBox(height: 24),
                          Text(
                            widget.title ?? "Error",
                            style: InterFontPalette.fBlack_10_500,
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Text(
                              widget.errorMessage ?? "Something went wrong!",
                              textAlign: TextAlign.center,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: InterFontPalette.fBlack_10_300,
                            ),
                          ),
                          if (widget.buttonText != null)
                            const SizedBox(height: 24),
                          if (widget.buttonText != null)
                            ValueListenableBuilder(
                              valueListenable: isLoading,
                              builder: (_, loading, __) {
                                return PrimaryButton(
                                  isLoading: loading,
                                  radius: 8,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                    horizontal: 20,
                                  ),
                                  height: 38,
                                  onPressed: () {
                                    if (widget.customButtonFunction != null) {
                                      widget.customButtonFunction?.call();
                                    } else if (widget.reload != null) {
                                      showLoader(widget.reload!);
                                    }
                                  },
                                  title: widget.buttonText,
                                  fontStyle: InterFontPalette.fBlack_10_400
                                      .copyWith(color: Colors.white),
                                );
                              },
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  showLoader(Function callback) {
    isLoading.value = true;
    Future.delayed(const Duration(milliseconds: 200), () {
      callback.call();
      isLoading.value = false;
    });
  }
}

class WidgetSizeNotifier extends StatefulWidget {
  final Widget Function(BuildContext context, Size size, Widget? child) builder;

  const WidgetSizeNotifier({super.key, required this.builder});

  @override
  State<WidgetSizeNotifier> createState() => _WidgetSizeNotifierState();
}

class _WidgetSizeNotifierState extends State<WidgetSizeNotifier> {
  final ValueNotifier<Size> notifier = ValueNotifier(const Size(0, 0));

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => _getSize());
    super.initState();
  }

  @override
  void didUpdateWidget(covariant WidgetSizeNotifier oldWidget) {
    final size = (context.findRenderObject() as RenderBox).size;
    if (notifier.value != size) {
      _getSize();
    }
    super.didUpdateWidget(oldWidget);
  }

  _getSize() {
    if (mounted) {
      notifier.value = (context.findRenderObject() as RenderBox).size;
    }
  }

  @override
  void dispose() {
    notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: notifier,
      builder: widget.builder,
    );
  }
}
