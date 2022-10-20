import 'package:flutter/material.dart';
//import 'package:flutter_learn/module/tutorial/model/tutorial_model.dart';
import 'package:flutter_learn/src/modules/tutorial/model/tutorial_model.dart';

class TutorialItem extends StatelessWidget {
  final TutorialModel tutorialModel;
  const TutorialItem(this.tutorialModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(
          height: 40,
        ),
        Text(
          tutorialModel.title,
          style: TextStyle(
            fontSize: 22,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          tutorialModel.description,
          textAlign: TextAlign.center,
        ),
        Expanded(
          child: Image.asset(
            tutorialModel.imageUrl,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
