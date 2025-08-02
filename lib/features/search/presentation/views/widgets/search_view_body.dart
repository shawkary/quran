import '../../../../../core/utiles/functions.dart';
import '../../../../../core/utiles/components.dart';
import '../../cubit/search_cubit.dart';
import '../../../../quran/presentation/view/quran_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SearchCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 10),
      child: Column(
        children: [
          Directionality(
            textDirection: TextDirection.rtl,
            child: TextFormField(
              focusNode: cubit.focusNode,
              onChanged: (value) => cubit.onSearchChanged(value),
              style: TextStyle(color: Theme.of(context).canvasColor),
              decoration: InputDecoration(
                suffix: BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    if (searchedAyat.isEmpty) {
                      return const Text('');
                    } else {
                      return Text(
                        '${searchedAyat.length} نتيجة',
                        style: const TextStyle(color: Colors.grey),
                      );
                    }
                  },
                ),
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 10),
          BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              if (state is AyatAddingState) {
                return Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          pageNum = pages[index];
                          getSauraName();
                          getGozName();
                          getGozNum(context);
                          showEdges = !showEdges;
                          navigateTo(context, const QuranView());
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '[${sauraNames[index]}]',
                              style: TextStyle(
                                  color: Theme.of(context).cardColor,
                                  fontSize: 25),
                            ),
                            Text(
                              '${searchedAyat[index]}  [${ayat[index]}]',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Theme.of(context).canvasColor,
                              ),
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
    );
  }
}
