import 'package:auto_route/annotations.dart';
import 'package:ddd_clean_template/application/device_info/device_info_cubit.dart';
import 'package:ddd_clean_template/common/widgets/app_images.dart';
import 'package:ddd_clean_template/common/words/words.dart';
import 'package:ddd_clean_template/presentation/routes/app_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.microtask(() {
      // 🏠 Replace the entire navigation stack - user can't go back to splash!
      router.pushAndPopUntil(const DemoRoute(), predicate: (_) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: kToolbarHeight,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.splash.path),
            fit: BoxFit.cover,
          ),
        ),
        child: BlocBuilder<DeviceInfoCubit, DeviceInfoState>(
          buildWhen: (old, e) => old.projectInfo != e.projectInfo,
          builder: (context, state) {
            return Column(
              spacing: 12,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Spacer(flex: 3),

                // App name
                Expanded(
                  flex: 2,
                  child: Center(
                    child: TextAnimator(
                      key: UniqueKey(),
                      state.projectInfo.appName,
                      textAlign: TextAlign.center,
                      atRestEffect: WidgetRestingEffects.wave(),
                      style: const TextStyle(
                        fontSize: 56,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const CupertinoActivityIndicator(color: Colors.white),

                Text(
                  "${Words.appVersion.str}: ${state.projectInfo.version}",
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
