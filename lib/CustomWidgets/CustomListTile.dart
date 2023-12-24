import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final dynamic data;
  final int index;
  final bool isSelected;
  final Function(bool) onTap;

  const CustomListTile({
    required this.data,
    required this.index,
    required this.isSelected,
    required this.onTap,
    Key? key,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
    leading: CircleAvatar(
      //child: Icon(Icons.person)
      backgroundImage: NetworkImage("${data['picture']['thumbnail']}")
    ),
    dense: true,
    title: Text(
      "${'$index.'} ${data['name']['first']} ${data['name']['last']}",
      style: const TextStyle(color: Colors.black, fontSize: 20),
    ),
    subtitle: Text(
      "${data['email']}",
      style: const TextStyle(color: Colors.black, fontSize: 16),
    ),
    trailing: TextButton(
      onPressed: () {
         onTap(!isSelected);
      },
      style: TextButton.styleFrom(backgroundColor: Colors.white),
      child: isSelected ? const Icon(Icons.check, color: Colors.green,) : const Icon(Icons.add), // Show checkmark if selected
    ),
  );
}
}