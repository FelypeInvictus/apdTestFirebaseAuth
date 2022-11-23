import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../login/login_screen.dart';

//Declaração das variaveis (NOTA: O login padrão é admin)
String loginUPName = 'admin';
String loginUPLastName = 'master';
String loginUPEmail = 'admin';
String loginUPPwd = 'admin';


final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);
  //late String loginUPName, loginUPLastName, loginUPEmail, loginUPPwd;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              keyboardType: TextInputType.name,
              //textInputAction: TextInputAction.newline,
              cursorColor: kPrimaryColor,

              decoration: const InputDecoration(
                hintText: "Nome",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.person),
                ),
              ),
              // É aqui onde a entrada é salva
              onChanged: (inputName) => {loginUPName = inputName},
              //
              validator:
                  RequiredValidator(errorText: "Este campo é obrigatório"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              keyboardType: TextInputType.name,
              //textInputAction: TextInputAction.newline,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "Sobrenome",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.person),
                ),
              ),
              // É aqui onde a entrada é salva
              onChanged: (inputLastName) => {loginUPLastName = inputLastName},),
              //
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              //textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,

              decoration: const InputDecoration(
                hintText: "E-mail",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.email),
                ),
              ),
              // É aqui onde a entrada é salva
              onChanged: (inputEmail) => {loginUPEmail = inputEmail},
              //
              validator: EmailValidator(errorText: "Use um email válido"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              //textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "Criar senha",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
              // É aqui onde a entrada é salva
              onChanged: (inputPWD) => loginUPPwd = inputPWD,
              //
              validator: passwordValidator,
            ),
          ),
          //Confirmará a senha
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              //textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                hintText: "Confirmar senha",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
              validator: (pass) =>
                  MatchValidator(errorText: "A combinação está incorreta")
                      .validateMatch(pass!, loginUPPwd),
            ),
          ),

          const SizedBox(height: defaultPadding / 2),
          ElevatedButton(
            //Valida as entradas
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                showTopSnackBar(
                  context,
                  CustomSnackBar.success(
                      message: "Registro realizado com sucesso"));
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const LoginScreen();
                  }),
                );
              } else {
                showTopSnackBar(
                  context,
                  CustomSnackBar.error(
                    message: "Preencha os campos corretamente",
                  ),
                );
                // ScaffoldMessenger.of(context).showSnackBar(
                //   const SnackBar(
                //     content: Text(
                //       "Preencha os campos corretamente"),
                //   ),
                // );
              }
            },
            child: Text("Registrar".toUpperCase()),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginScreen();
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
