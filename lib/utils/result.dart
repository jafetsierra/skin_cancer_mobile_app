import 'package:flutter/material.dart';

Widget predictionResult(BuildContext context, String rta){
  return AlertDialog(
    title: const Text('Diagnosis'),
    content: Text(rta),
    actions: <Widget>[
      TextButton(onPressed: () => Navigator.pop(context,'Ok'), 
        child: 
          const Text('Ok')
      )
    ],
  );
  
}

Widget errorResult(BuildContext context, String error){
  return AlertDialog(
    title: const Text('Error in the application'),
    content: Text(error),
    actions: [
      TextButton(onPressed: () => Navigator.pop(context,'Ok'), 
        child: 
          const Text('Ok')
      )
    ],
  );
}