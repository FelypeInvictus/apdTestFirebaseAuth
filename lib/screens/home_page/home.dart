import 'package:flutter/material.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Bem-vindo, Escolhido',
        ),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.black,
      body: buildElementsHome(),
    );
  }
}

class buildElementsHome extends StatelessWidget {
  const buildElementsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(30),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            textoExibidoUm(),
            imagemExibida(),
            SizedBox(height: 100),
            textoExibidoDois(),
            botoes(),
          ]),
        ));
    
  }
}

Container imagemExibida() {
  return Container(
    child: Image.asset('assets/transition/matrix.jpg'),
  );
}

Text textoExibidoUm() {
  return Text(
    'Escolha a pilula',
    style: TextStyle(
      color: Colors.green,
      fontSize: 20,
    ),
    textAlign: TextAlign.justify,
  );
}

Text textoExibidoDois() {
  return Text(
    'Se chegaste até aqui, nobre discipulo, quer dizer que estás preparado!',
    style: TextStyle(
      color: Colors.green,
    ),
    textAlign: TextAlign.justify,
  );
}

Row botoes() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      SizedBox(
          height: 40,
          width: 120,
          child: ElevatedButton(
            child: Text('Pilula Vermelha'),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontStyle: FontStyle.normal,
                )),
            onPressed: () => home(),
          )),
          SizedBox(height: 200),
      SizedBox(
          height: 40,
          width: 120,
          child: ElevatedButton(
            child: Text('Pilula Azul'),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontStyle: FontStyle.normal,
                )),
            onPressed: () => home(),
          )),
    ],
  );
}
