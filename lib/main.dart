import 'package:flutter/material.dart';

void main() {
  // Função principal que inicia a aplicação Flutter.
  runApp(MyApp());
}

// Classe principal que define o widget da aplicação.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MaterialApp configura o tema e define qual tela será a inicial.
    return MaterialApp(
      home: HomeScreen(), // Tela inicial da aplicação.
    );
  }
}

// Tela principal que será exibida ao iniciar o app.
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Scaffold fornece a estrutura básica para uma página, como AppBar e Body.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple, // Define a cor do AppBar.
        leading: IconButton(
          // Ícone do lado esquerdo (perfil).
          icon: Icon(Icons.person),
          onPressed: () {}, // Ação ao clicar no ícone.
        ),
        actions: [
          // Ícones do lado direito do AppBar.
          IconButton(icon: Icon(Icons.mail), onPressed: () {}),
          IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
          IconButton(icon: Icon(Icons.settings), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0), // Espaçamento em torno do conteúdo.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Alinhamento à esquerda.
          children: [
            // Seção "Conta".
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribui itens nas extremidades.
              children: [
                Text(
                  'Conta',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.arrow_forward), // Ícone de seta para a frente.
              ],
            ),
            SizedBox(height: 10), // Espaçamento entre os widgets.
            Text(
              'R\$1000,00',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), // Saldo.
            ),
            SizedBox(height: 20),
            // Ícones de funcionalidades principais (Pix, Pagamento, QR Code, etc).
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround, // Distribui ícones igualmente.
              children: [
                _buildIconButton(Icons.area_chart, 'Área Pix'),
                _buildIconButton(Icons.payment, 'Pagamentos'),
                _buildIconButton(Icons.qr_code, 'QRcode'),
                _buildIconButton(Icons.transfer_within_a_station, 'Transferir'),
              ],
            ),
            SizedBox(height: 20),
            // Seção "Meus Cartões".
            Container(
              color: Colors.purple[100], // Fundo lilás claro.
              padding: EdgeInsets.all(16.0), // Espaçamento interno.
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Meus Cartões',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text('Guarde seu dinheiro em caixinhas'),
                  Text('Acessando a área de planejamento'),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Seção "Cartão de Crédito".
            Container(
              color: Colors.purple[100],
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cartão de Crédito',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text('Fatura Fechada'),
                  Text('R\$2.123,39'), // Valor da fatura.
                  Text('Vencimento dia 15'), // Data de vencimento.
                ],
              ),
            ),
            SizedBox(height: 10),
            // Botão para renegociação de fatura.
            ElevatedButton(
              onPressed: () {},
              child: Text('Renegociar'),
            ),
            SizedBox(height: 20),
            // Seção "Empréstimo".
            Text(
              'Empréstimo',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('Tudo certo! Você está em dia com o empréstimo'),
            SizedBox(height: 20),
            // Seção "Descubra Mais".
            Text(
              'Descubra Mais',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Imagem carregada de um link da internet.
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.purple[100], // Fundo lilás claro.
                  borderRadius: BorderRadius.circular(10), // Bordas arredondadas.
                ),
                child: Image.network(
                  'https://st3.depositphotos.com/22265358/32895/i/450/depositphotos_328952834-stock-photo-december-30-2019-brazil-in.jpg',
                  width: 200,
                  height: 150,
                  fit: BoxFit.cover, // Ajusta a imagem dentro do espaço.
                  // Mostra indicador de progresso enquanto a imagem carrega.
                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  },
                  // Mostra ícone de erro se a imagem não carregar.
                  errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                    return Center(child: Icon(Icons.error));
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            // Seção "Seguro de Vida".
            Container(
              decoration: BoxDecoration(
                color: Colors.purple[100],
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Seguro de Vida',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Cuide bem de quem você ama de um jeito simples.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {}, // Ação ao clicar no botão.
                    child: Text('Conhecer'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Função auxiliar para criar ícones com rótulos.
  Widget _buildIconButton(IconData icon, String label) {
    return Column(
      children: [
        IconButton(icon: Icon(icon, size: 30), onPressed: () {}),
        Text(label), // Rótulo abaixo do ícone.
      ],
    );
  }
}
