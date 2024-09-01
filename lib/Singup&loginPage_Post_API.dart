import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Singup__loginPage_Post_API extends StatelessWidget {
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  void login(String email, password) async {
    try {
      Response response = await post(
          Uri.parse('https://reqres.in/api/register'),
          body: {'email': email, 'password': password});
      if (response.statusCode == 200) {
        print('Account create successfully');
      } else {
        print('Faild');
      }
    } catch (e) {
      print(e.toString());
    }
  }
  // email eve.holt@reqres.in
  // password pistol

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Signup and login page post api'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: EmailController,
              decoration: InputDecoration(hintText: 'Email'),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: PasswordController,
              decoration: InputDecoration(hintText: 'Password'),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                login(EmailController.text, PasswordController.text);
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    'sing up',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
