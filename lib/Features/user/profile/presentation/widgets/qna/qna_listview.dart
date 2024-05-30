import 'package:flutter/material.dart';

import '../../../data/datasorce/static/qnr_data.dart';
import 'qna_card_item.dart';

class QnAListView extends StatelessWidget {
  const QnAListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: qnaList.length,
      itemBuilder: (context, index) {
        return QnACardItem(qnaPair: qnaList[index]);
      },
    );
  }
}
