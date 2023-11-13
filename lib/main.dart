import 'package:flutter/material.dart';

void main() {
  runApp(CardApp());
}

class CardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.lightBlue, // Fundo azul claro
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('              Fellipe Ribeiro Martins      ' ),
        ),
        body: Column(
          children: [
            Container(
              color: Colors.green, // Cor verde para o fundo
              height: 80, // Altura da área da foto
              width: 70,
              alignment: Alignment.center,
              child: Icon(
                Icons.person, // Substitua pelo ícone da foto ou foto real
                color: Colors.white,
                size: 40,
              ),
            ),
            CardList(),
          ],
        ),
      ),
    );
  }
}

class CardList extends StatelessWidget {
  final List<Map<String, String>> _data = [
    {
      'title': 'Informações Pessoais',
      'description':
          'Nome: Fellipe Riberio Martins\n'
          'Data de nascimento: 08/09/2005\n'
          'Número: 998087756\n'
          'Endereço: Rua Euclides Viriato Paulino',
    },
    {
      'title': 'Quem eu sou?',
      'description':
          'Eu sou Fellipe Ribeiro Martins, um entusiasta da tecnologia da informação. Como um técnico em informática, adquiri habilidades sólidas em suporte técnico, manutenção de hardware e software, e resolução de problemas em sistemas computacionais. Minha paixão por inovação tecnológica me impulsiona a estar atualizado e buscar soluções eficientes para os desafios na área.',
    },
    {
      'title': 'Curso Técnico em Informática',
      'description':
          'O curso técnico em informática ensina habilidades práticas como suporte técnico, manutenção de hardware/software e resolução de problemas em computadores/redes, preparando para lidar com questões tecnológicas do cotidiano.',
    },
    {
      'title': 'Estagiário de Técnico em Informática',
      'description':
          'O estágio de Técnico em Informática envolve auxiliar no desenvolvimento e implementação de projetos de TI, ajudar na manutenção de sistemas e infraestruturas computacionais, além de oferecer suporte técnico e soluções para problemas tecnológicos. Isso proporciona experiência prática e aprimora habilidades essenciais para o setor de tecnologia.',
    },
      {
      'title': 'Objetivo Profissional',
      'description':
          'A procura de um estagio na área de tecnologia.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _data.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(data: _data[index]),
              ),
            );
          },
          child: Card(
            margin: EdgeInsets.all(16),
            elevation: 4,
            color: index == 0 ? Colors.lightBlue[200] : Colors.orange, // Fundo azul claro para o card de informações pessoais
            child: ListTile(
              title: Text(
                _data[index]['title'] ?? '',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        );
      },
    );
  }
}

class DetailScreen extends StatelessWidget {
  final Map<String, String> data;

  DetailScreen({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data['title'] ?? ''),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Text(data['description'] ?? ''),
      ),
    );
  }
}
