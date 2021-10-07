import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_app/models/user.dart';
import 'package:event_app/views/login_page.dart';
import 'package:event_app/widgets/homepage_blob.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomPageState createState() => _HomPageState();
}

class _HomPageState extends State<HomePage> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // title: const Text('Hello'),
        actions: [
          IconButton(
              onPressed: () {
                logout(context);
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ))
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          buildHeader(width),
          buildEmptyEvents(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildEmptyEvents() {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
        ),
        const Center(
          child: Text(
            'No Event Added!',
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }

  Widget buildHeader(double width) {
    return Stack(
      children: [
        CustomPaint(
          size: Size(width, (width * 0.6217391304347826).toDouble()),
          painter: HomeCustomPainter(),
        ),
        Positioned(
          top: 45,
          left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hello,',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                ),
              ),
              Text(
                '${loggedInUser.fullName}',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 24.0,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginPage()));
  }
}
