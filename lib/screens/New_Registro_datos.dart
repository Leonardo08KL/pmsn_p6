import 'package:flutter/material.dart';

class NewRegistroDatosScreen extends StatelessWidget {
  const NewRegistroDatosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 200),
            const Image(
              image: NetworkImage(
                'https://cdn-icons-png.flaticon.com/512/4642/4642411.png',
              ),
              height: 300,
              width: 300,
            ),
            const ListTile(
              title: Text(
                'Ingresar datos',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Realiza tu primer registro',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: style,
              onPressed: () {},
              child: const Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }
}
