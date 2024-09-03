import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../style_manager/text_styles.dart';
import '../list_screen/list_screen_bloc.dart';
import 'edit_screen_bloc.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditScreenBloc, EditScreenState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xff03023d),
              title: Text(state.id.toString()),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Update",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: TextField(
                        decoration: TextStyles.inputBorder,
                        controller: state.nameController,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ], //
                        decoration: TextStyles.inputBorder,
                        controller: state.ageController,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: FloatingActionButton.extended(
                  backgroundColor: const Color(0xfff4455a),
                  onPressed: () {
                    context.read<ListScreenBloc>().add(SubmitEvent(
                        context,
                        state.id,
                        state.nameController!.text,
                        state.ageController!.text));
                  },
                  label: const Text("Submit"),
                ),
              ),
            )

            // Padding(
            //
            //
            //
            //   padding: const EdgeInsets.all(8.0),
            //   child: SizedBox(
            //     width: MediaQuery.of(context).size.width,
            //     child: ElevatedButton(
            //       onPressed: () {},
            //       child: const Text("Submit"),
            //     ),
            //   ),
            // ),
            );
      },
    );
  }
}
