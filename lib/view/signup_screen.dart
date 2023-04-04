import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
            title: const Text("회원가입"),
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
                    height: 20,
                  ),
                  _passwordWidget(),
                  Container(
                    height: 50,
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 8.0),
                    child: ElevatedButton(
                      onPressed: ()=> _signup(),
                      child: const Text("회원가입"),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Text("로그인")
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    }
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
      }
    );
  }
  Widget _passwordWidget(){
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
          border: OutlineInputBorder(), labelText: 'password'
      ),
      validator: (String? value){
        if(value!.isEmpty){
          return '비밀번호를 입력해주세요.';
        }
        return null;
      },
    );
  }
  void initState(){
    //TODO: implement initState
    super.initState();
    _emailController.text = '';
    _passwordController.text = '';
  }
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  _signup() async{
    if(_formKey.currentState!.validate()){
      FocusScope.of(context).requestFocus(FocusNode());

      try{
          UserCredential userCredential = await _auth
            .createUserWithEmailAndPassword(
            email: _emailController.text,
            password: _passwordController.text)
            .then( (value){
          if(value.user!.email == null){
          }else{
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('회원가입 완료'),
              backgroundColor: Colors.blue,
            ));
            // Navigator.pop(context);
          }
          return value;
          }
        );

      } on FirebaseAuthException catch(e){
        print(e);
        String message = '';

        if(e.code == 'weak-password') {
          message = '취약한 비밀번호입니다.';
        } else if(e.code == 'email-already-in-use'){
          message='이미 사용중인 이메일입니다.';
        } else {
          message = e.code;
        }

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(message),
          backgroundColor: Colors.deepOrange,
        ));

      }
    }
  }
}
