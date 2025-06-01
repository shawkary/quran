import 'package:azkar/features/quran/presentation/view/widgets/azkar.dart';
import 'package:azkar/core/utiles/components.dart';
import 'package:azkar/features/quran/presentation/view/widgets/saura_pages.dart';
import 'package:azkar/core/utiles/shared_pref.dart';
import 'package:azkar/features/quran/presentation/view/widgets/search.dart';
import 'package:flutter/material.dart';

class Quran extends StatefulWidget {
  const Quran({super.key});

  @override
  State<Quran> createState() => _QuranState();
}

class _QuranState extends State<Quran> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: pageNum! - 1);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.white,
      body: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return SizedBox(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() => isDark = !isDark);
                          SharedPref.saveBool('isDark', isDark);
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          isDark ? Icons.light_mode_outlined : Icons.dark_mode,
                          size: 30,
                        )),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SauraPages()));
                      },
                      child: const Text(
                        'السور',
                        style: TextStyle(fontSize: 25, color: Colors.black),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Azkar()));
                      },
                      child: const Text(
                        'الذكر',
                        style: TextStyle(fontSize: 25, color: Colors.black),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Search()));
                        },
                        icon: const Icon(
                          Icons.search,
                          size: 30,
                        ))
                  ],
                ),
              );
            },
          );
        },
        child: PageView.builder(
          reverse: true,
          controller: pageController,
          itemBuilder: (context, index) {
            SharedPref.saveInt('cachedPage', index + 1);
            return Image.asset(
              'assets/images/quran_images/${index + 1}.png',
              fit: BoxFit.fill,
              color: isDark ? Colors.white : Colors.black,
              colorBlendMode: index == 0 || index == 1
                  ? BlendMode.difference
                  : BlendMode.srcIn,
            );
          },
          itemCount: 604,
        ),
      ),
    );
  }
}
