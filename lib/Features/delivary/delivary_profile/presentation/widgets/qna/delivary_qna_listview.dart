import 'package:flutter/material.dart';

import '../../../data/datasorce/static/qnr_data.dart';
import 'delivary_qna_card_item.dart';

class DelivaryQnAListView extends StatelessWidget {
  const DelivaryQnAListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: qnaList.length,
      itemBuilder: (context, index) {
        return DelivaryQnACardItem(qnaPair: qnaList[index]);
      },
    );
  }
}
