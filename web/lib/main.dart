import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const TelaViagens(),
    );
  }
}

class TelaViagens extends StatelessWidget {
  const TelaViagens({super.key});

  static const String lorem =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce id '
      'diam id libero ultricies pulvinar. In non lacus, sagittis eu libero '
      'et, venenatis lacinia nulla. Etiam eget purus leo. Nam consectetur '
      'ornare est eu lobortis. Morbi eu augue eu lectus condimentum '
      'vestibulum. Etiam id nibh luctus, porttitor arcu et, porttitor '
      'purus. Pellentesque vulputate quis nibh ut rutrum viverra.';

  Widget _botao(IconData icone, String texto) {
    return Column(
      children: [
        Icon(icone, color: Colors.blue),
        const SizedBox(height: 4),
        Text(texto, style: const TextStyle(color: Colors.blue, fontSize: 12)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Viagens'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagem com texto sobreposto
            Stack(
              children: [
                Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxT2NyrMUKn2bTRZ3SaCIfVQ3iYNEscJpFcrPw5fNikjpUIXA9NuBklHL8&s=10',
                  width: double.infinity,
                  height: 220,
                  fit: BoxFit.cover,
                ),
                const Positioned(
                  left: 12,
                  bottom: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Roma',
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                      Text('Coliseu',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),

            // Linha de botões
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _botao(Icons.place, 'Quero Ir'),
                  _botao(Icons.check_circle_outline, 'Já Fui'),
                  _botao(Icons.share, 'Compartilhar'),
                  Column(
                    children: [
                      Row(
                        children: List.generate(
                          3,
                          (_) => const Icon(Icons.star, color: Colors.blue),
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text('Avaliações',
                          style: TextStyle(color: Colors.blue, fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),

            // Texto descritivo
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(lorem, textAlign: TextAlign.justify),
            ),

            // Título + Filtrar
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'Pessoas Encontradas',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  _botao(Icons.filter_alt, 'Filtrar'),
                ],
              ),
            ),

            // Avatares
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  4,
                  (_) => CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.grey.shade300,
                    child:
                        const Icon(Icons.person, size: 40, color: Colors.grey),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
