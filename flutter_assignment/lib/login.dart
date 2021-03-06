library flutter_assignment.login;

import 'package:flutter/material.dart';
import 'homepage.dart';
import 'register.dart';

class LoginMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.white,
          accentColor: Colors.yellow[300],
          brightness: Brightness.light),
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color.fromRGBO(255, 140, 146, 1.0),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 50),
              child: Image.asset(
                'images/login.png',
                width: 400,
                height: 300,
              ),
            ),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    // TODO: implement createState
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  String username;
  String password;

  void dispose(){
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget usernameField = Container(
      padding: const EdgeInsets.only(left: 32, right: 32, bottom: 5),
      child: TextFormField(
          controller: usernameController,
          validator: (value) {
            username = value;
        },
        keyboardType: TextInputType.emailAddress,
        onSaved: (value) {},
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          labelText: 'User id',
          hintText: 'kawii@gmail.com',
        ),
      ),
    );
    Widget passwordField = Container(
      padding: const EdgeInsets.only(left: 32, right: 32),
      child: TextFormField(
        controller: passwordController,
        validator: (value2) {
          password = value2;
        },
//        obscureText: true,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock), labelText: 'Password'),
      ),
    );
    Widget loginButton = Container(
      child: SizedBox(
        width: 350,
        height: 50,
        child: RaisedButton(
          child: const Text('Login'),
          color: Theme.of(context).accentColor,
          elevation: 4.0,
          splashColor: Colors.blueGrey,
          onPressed: () {
            if (_formKey.currentState.validate()) {
              if(password.isEmpty || username.isEmpty){
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('กรุณาระบุ user หรือ password')));
              }
              else if(username == 'admin' && password == 'admin'){
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('user or password ไม่ถูกต้อง')));
              }
              else{
                print('Login Succeed');
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Main()));
              }
            }
          },
        ),
      ),
    );
    Widget registerButton = Container(
        child: FlatButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Register()));
      },
      child: Text('Register New Account'),
    ));
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          usernameField,
          passwordField,
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: loginButton,
          ),
          Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [registerButton],
              )),
        ],
      ),
    );
  }
}
