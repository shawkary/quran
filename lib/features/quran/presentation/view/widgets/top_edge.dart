import '../../../../../core/utiles/components.dart';
import '../../../../../core/custom/containers.dart';
import '../../manager/quran_cubit/cubit.dart';
import 'package:flutter/material.dart';

class TopEdge extends StatelessWidget {
  const TopEdge({super.key, required this.cubit});
  final QuranCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topCenter,
      child: Column(
        children: [
          Container(
            color: Colors.black.withValues(alpha: .8),
            height: 50,
            width: double.infinity,
            child: Row(
              children: [
                Container(
                  height: 50,
                  padding: const EdgeInsets.only(left: 7),
                  width: MediaQuery.sizeOf(context).width * .38,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      sauraName,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: MediaQuery.sizeOf(context).width * .06),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * .12,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      '$pageNum',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: MediaQuery.sizeOf(context).width * .05),
                Container(
                  padding: const EdgeInsets.only(right: 5),
                  height: 50,
                  width: MediaQuery.sizeOf(context).width * .39,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: AlignmentDirectional.centerEnd,
                    child: Text(
                      gozName,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
              height: 0,
              thickness: MediaQuery.sizeOf(context).width * .0075,
              color: Colors.grey),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PageContainer(
                color: (pageNum! % 2) == 0 ? Colors.white : Colors.transparent,
              ),
              PageContainer(
                color: (pageNum! % 2) == 0 ? Colors.transparent : Colors.white,
              ),
            ],
          )
        ],
      ),
    );
  }
}
