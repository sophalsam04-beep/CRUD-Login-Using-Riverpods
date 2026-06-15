import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_flutter/model/auth_state.dart';
import 'package:riverpod_flutter/riverpod/auth_controller.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({super.key});

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authstate = ref.watch(authProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Login Riverpods", style: TextStyle(fontSize: 26)),
      ),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            TextField(
              controller: emailcontroller,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: passwordcontroller,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),

            SizedBox(height: 20),
            if (authstate.error != null)
              Text(
                authstate.error!,
                style: TextStyle(fontSize: 22, color: Colors.red),
              ),

            SizedBox(height: 10),

            authstate.isloading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () {
                      ref
                          .read(authProvider.notifier)
                          .login(emailcontroller.text, passwordcontroller.text);
                    },
                    child: Text("Login"),
                  ),

            if (authstate.token != null)
              Text("Login is Token... ${authstate.token}"),
          ],
        ),
      ),
    );
  }
}
