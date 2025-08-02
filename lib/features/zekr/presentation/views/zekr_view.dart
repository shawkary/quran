import 'widgets/zekr_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ZekrView extends StatelessWidget {
  const ZekrView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Theme.of(context).scaffoldBackgroundColor,
            statusBarIconBrightness: Theme.of(context)
                .appBarTheme
                .systemOverlayStyle!
                .statusBarIconBrightness),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
      ),
      body: const ZekrViewBody(),
    );
  }
}
