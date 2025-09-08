import 'package:auto_route/annotations.dart';
import 'package:ddd_clean_template/common/helpers/feedback_helper.dart';
import 'package:ddd_clean_template/common/words/words.dart';
import 'package:ddd_clean_template/presentation/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// This page is used for authorization to the OneID service
///
/// Examples:
/// ```dart
/// final oneIdUrl = 'https://sso.egov.uz/sso/oauth/Authorization.do?response_type=one_code&client_id=YOUR_CLIENT_ID&redirect_uri=YOUR_REDIRECT_URI&scope=YOUR_SCOPE&state=YOUR_STATE';
/// final code = await router.push(const OneIdRoute(oneIdUrl: oneIdUrl));
/// or
/// final code = await Navigator.push(
///   context,
///   MaterialPageRoute(builder: (_) => const OneIdPage(oneIdUrl: oneIdUrl)),
/// );
/// print('Code: $code');
/// ```

@RoutePage()
class OneIdPage extends StatefulWidget {
  final String oneIdUrl;

  const OneIdPage({super.key, required this.oneIdUrl});

  @override
  State<OneIdPage> createState() => _OneIdPageState();
}

class _OneIdPageState extends State<OneIdPage> {
  final controller = WebViewController();
  var progress = 0.0;

  @override
  void initState() {
    loadData(
      onCode: (code) async {
        await controller.clearCache();
        await controller.clearLocalStorage();
        router.pop(code);
      },
    );
    super.initState();
  }

  void loadData({required Function(String code) onCode}) {
    controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    controller.setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int p) {
          if (mounted) {
            setState(() => progress = p / 100);
          }
        },
        onUrlChange: (change) {
          final code = change.url.code;
          if (code != null) {
            onCode(code);
          }
        },
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.hasAccess(widget.oneIdUrl.redirectHost)) {
            return NavigationDecision.navigate;
          } else {
            return NavigationDecision.prevent;
          }
        },
      ),
    );
    controller.loadRequest(Uri.parse(widget.oneIdUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => router.pop(),
          behavior: HitTestBehavior.opaque,
          child: const Icon(Icons.close),
        ),
        flexibleSpace: Align(
          alignment: Alignment.bottomCenter,
          child: progress == 1
              ? const SizedBox()
              : LinearProgressIndicator(value: progress),
        ),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}

extension on String? {
  String? get code {
    if (this != null) {
      return Uri.parse(this!).queryParameters['code'];
    }
    return null;
  }

  bool hasAccess(String host) {
    if (this != null) {
      final host = Uri.parse(this!).host;
      if (host.contains('egov.uz')) return true;
      if (host.contains(host)) return true;
    }
    FeedbackHelper.showSnackBar(
      message: Words.notAllowedUrl.str,
      type: SnackBarType.error,
    );
    return false;
  }

  String get redirectHost {
    if (this == null) return '';

    final uri = Uri.parse(this!);
    final redirectUrl = uri.queryParameters['redirect_uri'];

    if (redirectUrl != null) return Uri.parse(redirectUrl).host;
    return '';
  }
}
