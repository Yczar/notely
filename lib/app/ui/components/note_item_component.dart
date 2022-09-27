import 'package:flutter/material.dart';

import '../../../src/utils/margins/y_margin.dart';

class NoteItemComponent extends StatelessWidget {
  const NoteItemComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Cerebral palsy sport',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w900,
              color: Color(0xFF403B36),
            ),
          ),
          YMargin(4),
          Expanded(
            child: Text(
              'Cerebral palsy sport is a sport for people with cerebral palsy. It is a form of adapted physical activity. It is a form of adapted physical activity. ',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Color(0xFF595550),
              ),
              overflow: TextOverflow.fade,
            ),
          ),
        ],
      ),
    );
  }
}
