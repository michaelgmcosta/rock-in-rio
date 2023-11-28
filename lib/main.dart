import 'package:flutter/material.dart';

void main() {
  runApp(const RockInRio());
}

class RockInRio extends StatelessWidget {
  const RockInRio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rock in Rio',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(13, 116, 185, 1),
            brightness: Brightness.light,
            secondary: Colors.white),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Atracao> listFavorites = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Atrações',
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: ListView.builder(
          itemCount: listAtracoes.length,
          itemBuilder: (context, index) {
            final isFavorite = listFavorites.contains(listAtracoes[index]);

            return ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            AtracaoPage(atracao: listAtracoes[index])));
              },
              title: Text(listAtracoes[index].nome),
              subtitle: Wrap(
                spacing: 8,
                runSpacing: 4,
                children: listAtracoes[index]
                    .tags
                    .map((tag) => Chip(label: Text('#$tag')))
                    .toList(),
              ),
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: Text(
                  '${listAtracoes[index].dia}',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.secondary),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  setState(() {
                    isFavorite
                        ? listFavorites.remove(listAtracoes[index])
                        : listFavorites.add(listAtracoes[index]);
                  });
                },
                icon: isFavorite
                    ? const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    : const Icon(Icons.favorite_border),
              ),
            );
          }),
    );
  }
}

class AtracaoPage extends StatelessWidget {
  final Atracao atracao;
  const AtracaoPage({super.key, required this.atracao});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(atracao.nome),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Placeholder(),
      ),
    );
  }
}

class Atracao {
  final String nome;
  final int dia;
  final List<String> tags;

  const Atracao(this.nome, this.dia, this.tags);
}

const listAtracoes = [
  Atracao("Iron Maden", 2, ["Espetaculo", "Fas", "NovoAlbum"]),
  Atracao("Alok", 3, ["Influente", "Top", "Show"]),
  Atracao("Justin Bieber", 4, ["TopCharts", "Hits", "PríncipeDoPOP"]),
  Atracao("Guns N’ Roses", 8, ["Sucesso", "Espetáculo", "Fas"]),
  Atracao("Capital Inicial", 9, ["2019", "Novo Álbum", "Fas"]),
  Atracao("Green Day", 9, ["Sucesso", "Reconhecimento", "Show"]),
  Atracao("Cold Play", 10, ["NovoAlbum", "Sucesso", "2011"]),
  Atracao("Ivete Sangalo", 10, ["Unica", "Carreiras", "Fas"]),
  Atracao("Racionais", 3, ["Hits", "Prêmios", "Respeito"]),
  Atracao("Gloria Groove", 8, ["Streams", "Representatividade", "Sucesso"]),
  Atracao("Avril Lavigne", 9, ["Estreia", "Sucesso", "Lançamento"]),
  Atracao("Ludmilla", 10, ["Representativade", "Sucesso", "Parcerias"]),
];
