import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/model.dart';
import '../edit_screen/edit_screen.dart';
import '../edit_screen/edit_screen_bloc.dart';
import 'list_screen_bloc.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ListScreenBloc>().add(LoadScreenEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<ListScreenBloc, ListScreenState>(
        builder: (context, state) {
          if (state is ListScreenInitial) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is ListScreenLoaded) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ExpansionTile(
                  tilePadding: const EdgeInsets.all(4),
                  childrenPadding: const EdgeInsets.all(4),
                  title: Text("Details"),
                  subtitle: Text(""),
                  children: [
                    for (ModelData b in state.data)
                      expanded(b, setState, context),
                  ],
                ),
              ),
            );
          }
          if (state is EditScreenInitial) {}
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}

var isExpanded = false;
Widget expanded(ModelData b, setState, BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(8.0),
    margin: const EdgeInsets.all(4.0),
    decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF9A9898)),
        borderRadius: BorderRadius.circular(5)),
    child: ExpansionTile(
      tilePadding: const EdgeInsets.all(0),
      childrenPadding: const EdgeInsets.all(12),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              b.name ?? "",
              overflow: TextOverflow.ellipsis,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.edit_note_sharp),
            onPressed: () {
              context.read<EditScreenBloc>().add(GetId(b.id!, b.name!, b.age!));
              Navigator.push(
                  context, MaterialPageRoute(builder: (c) => EditScreen()));
            },
          )
        ],
      ),
      subtitle: Text("${b.age}"),
      // trailing: SizedBox(
      //   height: 30,
      //   width: 80,
      //   child: Row(
      //     children: [
      //       IconButton(
      //         icon: const Icon(Icons.edit_note_sharp),
      //         onPressed: () {
      //           context
      //               .read<EditScreenBloc>()
      //               .add(GetId(b.id!, b.name!, b.age!));
      //           Navigator.push(
      //               context, MaterialPageRoute(builder: (c) => EditScreen()));
      //         },
      //       ),
      //       Icon(isExpanded
      //           ? Icons.keyboard_arrow_down
      //           : Icons.keyboard_arrow_up),
      //     ],
      //   ),
      // ),
      onExpansionChanged: (bool expanded) {
        setState(() => isExpanded = expanded);
      },
      children: [
        if (b.data != null)
          for (ModelData b in b.data ?? []) expanded(b, setState, context)
        else
          const Center(
            child: Text("No More Data"),
          )
      ],
    ),
  );
}
