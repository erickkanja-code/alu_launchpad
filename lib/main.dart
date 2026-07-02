import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF0052cc)),
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontFamily: 'Inter',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            height: 1.3,
            ),
          titleMedium: TextStyle(
            fontFamily: 'Inter',
            fontSize: 20,
            fontWeight: FontWeight.w600,
            height: 1.4,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Inter',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 1.5,
          ),
          bodySmall: TextStyle(
            fontFamily: 'Inter',
            fontSize: 12,
            fontWeight: FontWeight.w400,
            height: 0.75,
          ),
        )
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget{

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ALU Launchpad', 
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(color:Theme.of(context).colorScheme.primary),),
        backgroundColor: Colors.transparent,
        shape: Border (
          bottom: BorderSide(
            color: Colors.blueGrey,
            width: 2.0
          )
          )
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          CreateAccount(),
          SizedBox(height: 20,),
          SizedBox(width: 300, child: Text("I am a...", style: Theme.of(context).textTheme.bodyMedium)),
          UserRole(),
          ],
      )
      )
    );
  }
}        

class CreateAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      
        children: [
          Text('Create Account', style: Theme.of(context).textTheme.headlineLarge),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 360,
            child: Text('Join ALU Launchpad to connect talent with opportunity', style:Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w400), textAlign: TextAlign.center),)
        ],
    );
  }

}

class UserRole extends StatefulWidget {
  @override
  State<UserRole> createState() => _UserRoleState();
}

class _UserRoleState extends State<UserRole> {
  bool _isStudent = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: _isStudent ? ElevatedButton.styleFrom(
            elevation: 10,
            textStyle: Theme.of(context).textTheme.titleMedium,
          ): ElevatedButton.styleFrom(
            elevation: 5,
          ),
          onPressed: (){
            setState(() {
              _isStudent = !_isStudent;
            });
          },
          
          child: Text("Student") 
),
        SizedBox(
          width: 40,
        ),
        ElevatedButton(
          style: _isStudent ? ElevatedButton.styleFrom(
            elevation: 5,
          ): ElevatedButton.styleFrom(
            elevation: 10,
            textStyle: Theme.of(context).textTheme.titleMedium,

          ),
          onPressed: (){
            setState(() {
              _isStudent = !_isStudent;
            });
          },
          child: Text("Startup") //make sure the widget takes isstudent as a constructor
          
) 
      ]
    ),
    StudentLoginForm(),
    ]);
  }
}

class StudentLoginForm extends StatefulWidget {
  @override
  State<StudentLoginForm> createState() => _StudentLoginFormState();
}

class _StudentLoginFormState extends State<StudentLoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // final _emailFocus = FocusNode();
  // final _passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context){
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Full Name"),
          TextFormField(
            controller: _fullNameController,
            decoration: InputDecoration(
              labelText: 'Full Name',
            ),
            validator:(value){
              if (value == null || value.trim().isEmpty){
                return 'Name is required';
              }
              return null;
            },
          ),
          Text("Email Address"),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'jane@example.com',
            ),
            validator:(value){
              if (value == null || value.trim().isEmpty){
                return 'Email is required';
              } else if (!value.contains('@')){
                return 'Invalid email';
              } else {
              return null;}
            },
          ),
        
          Text("Password"),
          TextFormField(
            obscureText: true,
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: '......',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 4),

            ),
            validator:(value){
              if (value == null || value.trim().isEmpty){
                return 'Name is required';
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("Create Account")
            )
        ],
        )

      );
  }
}

