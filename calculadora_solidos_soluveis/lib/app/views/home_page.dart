import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _concentracaoController = TextEditingController();
  TextEditingController _pesoController = TextEditingController();
  String texto = '';
  GlobalKey<FormState> _key = GlobalKey<FormState>();

  erase() {
    setState(() {
      texto = '';
      _concentracaoController.clear();
      _pesoController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de Sólidos Solúveis'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              color: Colors.red,
              icon: Icon(Icons.delete),
              onPressed: () => erase(),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                fit: StackFit.loose,
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'images/background.jpg',
                    fit: BoxFit.cover,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: TextFormField(
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Digite a concentração";
                                  }
                                },
                                keyboardType: TextInputType.number,
                                controller: _concentracaoController,
                                decoration: InputDecoration(
                                  labelText: 'Digite a concentração',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: TextFormField(
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Digite o peso desejado";
                                  }
                                },
                                keyboardType: TextInputType.number,
                                controller: _pesoController,
                                decoration: InputDecoration(
                                  labelText: 'Digite o peso em gramas',
                                ),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(texto))
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextButton(
                    onPressed: () {
                      if (_key.currentState.validate()) {
                        setState(() {
                          double concentracao =
                              double.parse(_concentracaoController.text);
                          double peso = double.parse(_pesoController.text);
                          double calculo = (peso / concentracao) * 100;
                          String resultado = calculo.toStringAsFixed(2);
                          texto = 'O peso que você deverá pesar é $resultado';
                        });
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(16),
                      width: double.infinity,
                      height: 50,
                      color: Colors.red[900],
                      child: Center(
                          child: Text(
                        'Calcular',
                        style: TextStyle(color: Colors.white),
                      )),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
