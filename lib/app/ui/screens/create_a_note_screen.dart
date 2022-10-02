import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:notely/app/cubits/auth/auth_cubit.dart';
import 'package:notely/app/ui/components/note_empty_component.dart';
import 'package:notely/app/ui/components/note_item_component.dart';
import 'package:notely/src/utils/margins/y_margin.dart';

class CreateANoteScreen extends StatefulWidget {
  const CreateANoteScreen({super.key});

  @override
  State<CreateANoteScreen> createState() => _CreateANoteScreenState();
}

class _CreateANoteScreenState extends State<CreateANoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            final authCubit = context.read<AuthCubit>();
            await FirebaseAuth.instance.signOut();
            authCubit.checkAuth();
          },
          icon: SvgPicture.asset(
            'assets/svgs/navigation_drawer_svg.svg',
            color: Colors.black,
          ),
        ),
        title: const Text(
          'All Notes',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w900,
            color: Color(0xFF403B36),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/svgs/search_svg.svg',
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 28.0,
          ),
          child: NoteEmptyComponent(),
          // Column(
          //   children: [
          //     Container(),
          //     const YMargin(20),
          //     Expanded(
          //       child: StaggeredGrid.count(
          //         crossAxisCount: 4,
          //         mainAxisSpacing: 4,
          //         crossAxisSpacing: 4,
          //         children: List.filled(
          //           10,
          //           const StaggeredGridTile.count(
          //             crossAxisCellCount: 2,
          //             mainAxisCellCount: 2,
          //             child: NoteItemComponent(),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}