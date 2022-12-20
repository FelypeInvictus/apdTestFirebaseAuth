import 'package:apd/screens/home_page/home.dart';
import 'package:apd/screens/signup/components/signup_form.dart';
import 'package:apd/screens/signup/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';

//Declarando variaveis email e senha
String loginEmail = '';
String loginPWD = '';

//late String loginEmail, loginPWD;

// ignore: must_be_immutable

class cadastro extends StatefulWidget {
  const cadastro({super.key});

  @override
  State<cadastro> createState() => _cadastroState();
}

class _cadastroState extends State<cadastro> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _database = FirebaseDatabase.instance;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            decoration: const InputDecoration(
              hintText: "E-mail",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: _passwordController,
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "Senha",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          Hero(
            tag: "login_btn",
            child: ElevatedButton(
              onPressed: () {
                String email = _emailController.text;
                String password = _passwordController.text;
                if (_formKey.currentState!.validate()) {
                  checkValidEmailAndPassword(email, password);
                }
                //Validar login
                bool isValidLogin = loginEmail == loginUPEmail &&
                    loginPWD == loginUPPwd &&
                    loginUPEmail.isNotEmpty &&
                    loginUPPwd.isNotEmpty;
                // if (isValidLogin) {
                //   showTopSnackBar(context,
                //       CustomSnackBar.success(message: "Acesso autorizado"));
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) {
                //         return const home();
                //       },
                //     ),
                //   );
                // } else if (loginEmail.isEmpty || loginPWD.isEmpty ) {
                //   showTopSnackBar(
                //       context, CustomSnackBar.info(message: "Informe o login corretamente"));

                // } else {
                //   showTopSnackBar(
                //       context, CustomSnackBar.error(message: "Login inválido"));
                // }
              },
              child: Text(
                "Entrar".toUpperCase(),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignUpScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void checkValidEmailAndPassword(String email, String password) async {
    try {
      // Tenta fazer login com o e-mail e senha fornecidos
      UserCredential result =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      showTopSnackBar(
          context, CustomSnackBar.success(message: "Acesso autorizado"));
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return const home();
        },
      ));
    } catch (error) {
      showTopSnackBar(context, CustomSnackBar.error(message: "Login inválido"));
    }
  }
}
