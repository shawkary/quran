import 'package:azkar/core/utiles/components.dart';
import 'package:azkar/features/quran/presentation/cubit/quran_cubit.dart';
import 'package:azkar/features/quran/presentation/view/quran.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<QuranCubit>();
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextFormField(
            textAlign: TextAlign.right,
            onChanged: (value) {
              cubit.searchForAya(value);
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          BlocBuilder<QuranCubit, QuranState>(
            builder: (context, state) {
              if (state is AyatAddingState) {
                return Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          pageNum = pages[index];
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Quran()));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '[${sauraName[index]}]',
                              style: const TextStyle(
                                  color: Colors.amber, fontSize: 25),
                            ),
                            Text(
                              '${searchedAyat[index]}  [${ayat[index]}]',
                              textAlign: TextAlign.right,
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemCount: searchedAyat.length,
                  ),
                );
              } else {
                return const Center(child: SizedBox());
              }
            },
          )
        ],
      ),
    ));
  }
}
