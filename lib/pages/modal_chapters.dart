import 'package:escribeme/controllers/controllers.dart';

import 'package:escribeme/models/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ModalChaptersInputs extends StatefulWidget {
  const ModalChaptersInputs({super.key});

  @override
  State<ModalChaptersInputs> createState() => _ModalChaptersInputsState();
}

class _ModalChaptersInputsState extends State<ModalChaptersInputs> {
  final chapterscontroller = Get.find<ChaptersController>();

  String title = ""; 
  String description = "";

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (s) {},
      child: FractionallySizedBox(
        heightFactor: 0.9,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0, // has the effect of softening the shadow
                spreadRadius: 0.0, // has the effect of extending the shadow
              )
            ],
          ),
          alignment: Alignment.topLeft,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 5, left: 10),
                    child: const Text(
                      "Actividad ",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: Colors.black87),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(top: 5, right: 5),
                          child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Cancelar",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),
                          )),
                      Container(
                          margin: const EdgeInsets.only(top: 5, right: 5),
                          child: TextButton(
                            onPressed: () {

                              chapterscontroller.addChapter(Chapter(
                                title: title,
                                description: description,
                                timestamp: DateTime.now().toIso8601String(),
                              ));

                               Navigator.pop(context);
                            },
                            child: const Text(
                              "Guardar",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: true ? Colors.black54 : Colors.black12,
                              ),
                            ),
                          )),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Color(0xfff8f8f8),
                        width: 1,
                      ),
                    ),
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      TextField(
                        onChanged: (text) {
                          title = text;
                        },
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), labelText: "Nombre"),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        onChanged: (text) {
                          description = text;
                        },
                        minLines:
                            2, // any number you need (It works as the rows for the textarea)
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Descripción"),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
