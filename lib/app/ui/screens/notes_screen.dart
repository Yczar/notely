import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:notely/app/cubits/auth/auth_cubit.dart';
import 'package:notely/app/model/note.dart';
import 'package:notely/app/providers/notes_provider.dart';
import 'package:notely/app/ui/components/note_empty_component.dart';
import 'package:notely/app/ui/components/note_item_component.dart';
import 'package:provider/provider.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  @override
  void initState() {
    super.initState();
    context.read<NotesProvider>().subscribeToNotes();
  }

  @override
  void dispose() {
    context.read<NotesProvider>().dispose();
    super.dispose();
  }

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 28.0,
          ),
          child: Consumer<NotesProvider>(
            builder: (_, provider, __) => AnimatedSwitcher(
              duration: const Duration(seconds: 1),
              switchInCurve: Curves.easeIn,
              switchOutCurve: Curves.easeInOut,
              child: provider.notes.isEmpty
                  ? const NoteEmptyComponent()
                  : NoteDataComponent(
                      notes: provider.notes,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class NoteDataComponent extends StatelessWidget {
  const NoteDataComponent({
    super.key,
    required this.notes,
  });
  final List<Note> notes;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: notes.length,
      itemBuilder: (_, index) => const NoteItemComponent(),
    );
  }
}

// a table consists of rows and columns
// Table of users
// | Name | Email | Phone |
// | John |jo@email.com| 1234567890 |
// | Jane |ja@email.com| 0987654321 |
// | Jack |jac@email.com| 1234567890 |

// Collection of users
// {
//   "user": [
//     {
//       "fullName": "John Doe",
//       "email": "John@email.com",
//       "phone": "1234567890"
//       "notes": [
//         {
//           "title": "Note 1",
//           "content": "Content 1"
//           "created_at": "2021-09-01 12:00:00"
//           "reminders": [
//             {
//               "date": "2021-09-01 12:00:00"
//             },
//             ],

//         },
//         {
//           "title": "Note 2",
//           "content": "Content 2"
//           "created_at": "2021-09-01 12:00:00"
//         }
//     },
//     {
//       "name": "Jane",
//       "email": "ja@email.com",
//       "phone": "0987654321"
//     },
//     ],
// }
