import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_list/domain/language_model/language_model.dart';
import 'package:todo_list/gen/assets.gen.dart';

class LanguageChangeButton extends StatelessWidget {
  final Language language;
  final Function() onPressed;
  final bool isChosen;
  const LanguageChangeButton({
    super.key,
    required this.language,
    required this.onPressed,
    required this.isChosen,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: InkWell(
        onTap: () => onPressed(),
        child: Row(
          children: [
            SvgPicture.asset(isChosen
                ? Assets.icons.chosenCircle
                : Assets.icons.emptyCircle),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(language.toString()),
            )
          ],
        ),
      ),
    );
  }
}
