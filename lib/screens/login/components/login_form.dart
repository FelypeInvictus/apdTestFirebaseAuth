import 'package:apd/screens/home_page/home.dart';
import 'package:apd/screens/signup/components/signup_form.dart';
import 'package:apd/screens/signup/signup_screen.dart';
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
class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
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
            // É aqui onde a entrada é salva
            onChanged: (input) {
              loginEmail = input;
            },
            //
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
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
              // É aqui onde a entrada é salva
              onChanged: (input) {
                loginPWD = input;
              },
              //
            ),
          ),
          const SizedBox(height: defaultPadding),
          Hero(
            tag: "login_btn",
            child: ElevatedButton(
              onPressed: () {
                //Validar login
                bool isValidLogin =
                    loginEmail == loginUPEmail && loginPWD == loginUPPwd && loginUPEmail.isNotEmpty && loginUPPwd.isNotEmpty ;
                if (isValidLogin) {     
                  showTopSnackBar(context,
                      CustomSnackBar.success(message: "Acesso autorizado"));
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const home();
                      },
                    ),
                  );
                } else if (loginEmail.isEmpty || loginPWD.isEmpty ) {
                  showTopSnackBar(
                      context, CustomSnackBar.info(message: "Informe o login corretamente"));
                 
                } else {
                  showTopSnackBar(
                      context, CustomSnackBar.error(message: "Login inválido"));
                }
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
}
