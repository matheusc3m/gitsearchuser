import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  String avatarUrl;
  String name;

  CustomCardWidget({Key? key, required this.avatarUrl, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 70,
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                    image: NetworkImage(avatarUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(name),
              ),
              const Icon(Icons.arrow_forward_ios, color: Colors.blue),
            ],
          ),
        ),
      ),
    );
  }
}
