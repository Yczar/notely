import 'package:flutter/material.dart';

import '../../../src/utils/margins/y_margin.dart';

class NotelyFormField extends StatefulWidget {
  const NotelyFormField({
    super.key,
    this.controller,
    required this.hint,
    required this.label,
  });
  final String label;
  final String hint;
  final TextEditingController? controller;

  @override
  State<NotelyFormField> createState() => _NotelyFormFieldState();
}

final _border = OutlineInputBorder(
  borderSide: const BorderSide(
    color: Color(0xFFF2E5D5),
    width: 1,
  ),
  borderRadius: BorderRadius.circular(12),
);

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
          controller: widget.controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFFFFDFA),
            hintText: widget.hint,
            enabledBorder: _border,
            errorBorder: _border,
            border: _border,
            focusedBorder: _border,
            disabledBorder: _border,
          ),
        ),
      ],
    );
  }
}
