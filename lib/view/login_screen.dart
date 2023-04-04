import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFffffff),
      appBar: AppBar(
        title: const Text("로그인"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                _userIdWidget(),
                const SizedBox(
                  height: 20.0,
                ),
                _passwordWidget(),
                Container(
                  height: 50.0,
                  width: double.infinity,
                  margin: const EdgeInsets.only(top:8.0),
                  child: ElevatedButton(
                    onPressed: () => _login(),
                    child: const Text("로그인"),
                  ),
                ),
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.only(top:20),
                    child: Text("회원 가입"),
                  ),
                  onTap: (){
                    Navigator.pushNamed(context, '/signup');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _userIdWidget() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        border: OutlineInputBorder(), labelText: 'email'
      ),
      validator: (String? value){
        if(value!.isEmpty) {
          return '이메일을 입력해주세요.';
        }
        return null;
      },
    );
  }
  Widget _passwordWidget() {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        border: OutlineInputBorder(), labelText: 'password'
      ),
      validator: (String? value) {
        if(value!.isEmpty) {
          return '비밀번호를 입력해주세요.';
        }
        return null;
      },
    );
  }
  void initState() {
    super.initState();
    _emailController.text = '';
    _passwordController.text = '';
  }
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  _login() async{
    if(_formKey.currentState!.validate()) {
      FocusScope.of(context).requestFocus(FocusNode());
      try{
        await _auth.signInWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text
        );
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
                (route) => false);
      } on FirebaseAuthException catch(e) {
        String message = '';
        if(e.code == 'user-not-found') {
          message = '사용자가 존재하지 않습니다.';
        } else if(e.code == 'wrong-password'){
          message='비밀번호를 확인하세요.';
        } else if(e.code == 'invalid-email'){
          message = '이메일을 확인하세요';
        }
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(message),
          backgroundColor: Colors.deepOrange,
        ));
      }
    }
  }
}








