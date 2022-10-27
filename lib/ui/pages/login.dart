import 'package:helloeyesight/ui/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:helloeyesight/domain/modelo/usuario.dart';
import 'package:helloeyesight/reusable_widgets/reusable_widget.dart';
import 'package:helloeyesight/ui/pages/signup_screen.dart';
import 'package:helloeyesight/ui/pages/reset_password.dart';
import 'package:helloeyesight/ui/pages/_scannerQrCb.dart';

//import '../../domain/modelo/modelo.dart';
/*
class Login extends StatelessWidget {
  Login({super.key});
  final TextEditingController controluser = TextEditingController();
  final TextEditingController controlpass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const SizedBox(height: 100),

              // ignore: prefer_const_constructors

              //SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: controluser,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Ingrese Usuario',
                      ),
                    ),
                  ),
                ),
              ),
              //SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: controlpass,
                      obscureText: true,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Ingrese Contraseña',
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              const SizedBox(height: 10),

              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                disabledColor: Colors.grey,
                elevation: 0,
                color: const Color.fromARGB(255, 30, 176, 233),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 177, vertical: 18),
                  // ignore: prefer_const_constructors
                  child: Text(
                    'Iniciar Sesion',
                  ),
                ),
                onPressed: () {
                  if (user.user == controluser.text &&
                      user.pass == controlpass.text) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const Home()));
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}*/

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  final TextEditingController controluser = TextEditingController();
  final TextEditingController controlpass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Colors.blue),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("lib/assets/helloeyesight.png"),
                const SizedBox(
                  height: 30,
                ),
                reusableTextField("Enter UserName", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outline, true,
                    _passwordTextController),
                const SizedBox(
                  height: 5,
                ),
                forgetPassword(context),
//---------------------------------------------------------------------------------------------
                firebaseUIButton(context, "Sign In", () {
                  if (user.user == _emailTextController.text &&
                      user.pass == _passwordTextController.text) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const Home()));
                  }
                }),
//----------------------------------------------------------------------------------------------
                signUpOption()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("No tienes Una Cuenta?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          "Olvido su Contraseña?",
          style: TextStyle(color: Colors.white70),
          textAlign: TextAlign.right,
        ),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => ResetPassword())),
      ),
    );
  }
}
