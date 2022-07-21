import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';


class Test
 extends StatelessWidget {
  const Test
  ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: Markdown(
        styleSheet: MarkdownStyleSheet(),
        selectable: true,
        data: '''
                    ```
          {
              'nv': 'Melanocytic nevi',
              'mel': 'melanoma',
              'bkl': 'Benign keratosis',
              'bcc': 'Basal cell carcinoma',
              'akiec': 'Actinic keratoses',
              'vasc': 'Vascular lesions',
              'df': 'Dermatofibroma'
          }
          ```
        ''',
      ),
    );
  }
}