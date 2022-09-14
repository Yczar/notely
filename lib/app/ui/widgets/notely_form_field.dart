import 'package:flutter/material.dart';

import '../../../src/utils/margins/y_margin.dart';

class NotelyFormField extends StatefulWidget {
  const NotelyFormField({
    super.key,
    required this.hint,
    required this.label,
  });
  final String label;
  final String hint;

  @override
  State<NotelyFormField> createState() => _NotelyFormFieldState();
}

class _NotelyFormFieldState extends State<NotelyFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: Color(0xFF403B36),
          ),
        ),
        const YMargin(8),
        TextFormField(
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFFFFDFA),
            hintText: widget.hint,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xFFF2E5D5),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}
