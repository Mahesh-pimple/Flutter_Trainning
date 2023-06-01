import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'DashboardActivity.dart';


class SplashScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _SplashScreenstate();

}

class _SplashScreenstate extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 4),(){

      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context)=>LoginScreen(),));

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: null,
          color: Theme.of(context).primaryColor,
          child: Center(
            child: Image.asset("images/ott.jpg"),
      ),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

/*Widget buildUsername(){

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text("Username",style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold
      ),
  ),
    SizedBox(height:10),
     Container(
       alignment: Alignment.centerLeft,
       decoration: BoxDecoration(
         color: Colors.white,
         borderRadius: BorderRadius.circular(10),
         boxShadow: [
           BoxShadow(
             color: Colors.black26,
             blurRadius: 6,
             offset: Offset(0,2)
           ),
         ]
       ),
       height: 60,
       child: TextField(
         keyboardType: TextInputType.name,
         style: TextStyle(
           color: Colors.black87
         ),
         decoration: InputDecoration(
           border: InputBorder.none,
           contentPadding: EdgeInsets.only(top: 14,right: 24,left: 24),
            hintText: 'Enter Username',
           hintStyle: TextStyle(
             color: Colors.black38
           )

         ),
       ),

  )
    ],
  );
}

Widget buildPassword(){

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text("Password",style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold
      ),
      ),
      SizedBox(height:10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(0,2)
              ),
            ]
        ),
        height: 60,
        child: TextField(
          obscureText: true,
          style: TextStyle(
              color: Colors.black87
          ),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14,right: 24,left: 24),
              hintText: 'Enter Password',
              hintStyle: TextStyle(
                  color: Colors.black38
              )

          ),
        ),

      )
    ],
  );
}

Widget buildFogetPassword(){
  return Container(

    alignment: Alignment.centerRight,
    child: TextButton(
      onPressed: ()=>print("Forget Password Pressed"),
      child: Text(
        "Forgot Password",style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold),

      ),

    ),
  );
}

Widget buildLoginBtn(){
  return Container(

    padding: EdgeInsets.symmetric(vertical: 25),
    width: double.infinity,
    child: ElevatedButton(

      onPressed: () =>print("Login Pressed"),
      child: Text(
        "Login",style: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold
      ),
      ),
      

    ),

  );

}*/



class _LoginScreenState extends State<LoginScreen>{

  final userId = TextEditingController();
  final userPass = TextEditingController();

  bool _isRemenberMe = false;

  @override
  void dispose() {
    userId.dispose();
    userPass.dispose();
    super.dispose();
  }

  Widget buildUsername(){

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Username",style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold
        ),
        ),
        SizedBox(height:10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0,2)
                ),
              ]
          ),
          height: 60,
          child: TextField(
            controller: userId,
            keyboardType: TextInputType.name,
            style: TextStyle(
                color: Colors.black87
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14,right: 24,left: 24),
                hintText: 'Enter Username',
                hintStyle: TextStyle(
                    color: Colors.black38
                )

            ),

          ),

        )
      ],
    );
  }

  Widget buildPassword(){

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Password",style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold
        ),
        ),
        SizedBox(height:10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0,2)
                ),
              ]
          ),
          height: 60,
          child: TextField(
            controller: userPass,
            obscureText: true,
            style: TextStyle(
                color: Colors.black87
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14,right: 24,left: 24),
                hintText: 'Enter Password',
                hintStyle: TextStyle(
                    color: Colors.black38
                )

            ),
          ),

        )
      ],
    );
  }

  Widget buildFogetPassword(){
    return Container(

      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: ()=>print("Forget Password Pressed"),
        child: Text(
          "Forgot Password",style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold),

        ),

      ),
    );
  }

  Widget buildRememberCb(){
    return Container(
      height: 20,
      child: Row(
        children: [
              Theme(
                data: ThemeData(unselectedWidgetColor: Colors.white),
                child: Checkbox(
                  value: _isRemenberMe,
                  checkColor:Colors.green,
                    activeColor: Colors.white,
                    onChanged: (bool? value) {
                      setState(() {
                        _isRemenberMe=value!;
                      });
                    },
                ),
              ),
              Text('Remember me' , style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),)
        ],
      ),
    );
  }

  Widget buildLoginBtn(){
    return Container(

      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () {
            String name=userId.text.toString();
            String pass=userPass.text.toString();

            if(name.isEmpty || pass.isEmpty){
              _showToastMessages(context);
            }
            else if(name.length < 4 ){
              _showToast(context);
            }
            else {
              _showSuccessMessages(context);
              _storedata(context,name,pass);

              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context)=>DashboardActivity(),));


            }

          },
          child: Text('LogIn'),
        )

    );

  }

  void _showToastMessages(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
          content: const Text('UserName / Password is Empty')
        //action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('UserName must be more than 4 characters')
        //action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  void _showSuccessMessages(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
          content: const Text('Login Successfully...')
      ),
    );
  }

  Future<void> _storedata(BuildContext context, String username,String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    await prefs.setString('password', password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(

          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                        end:Alignment.topCenter,
                      colors:[
                        Color(0x665ac18e),
                        Color(0x995ac18e),
                        Color(0xcc5ac18e),
                        Color(0xff5ac18e)
                      ]
                  )
                ),
                child:SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 120
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Sign In",style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold
                      ),),
                      SizedBox(height: 50),
                      buildUsername(),
                      SizedBox(height: 20),
                      buildPassword(),
                      SizedBox(height:1),
                      buildFogetPassword(),
                      SizedBox(height: 10),
                      buildRememberCb(),
                      SizedBox(height: 20),
                      buildLoginBtn(),
                    ],
                  ),

                )
              )
            ],
          ),

        ),

      ),
    );
  }



}




  
