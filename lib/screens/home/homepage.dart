import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_app/models/core/user.dart';
import 'package:event_app/models/services/auth_services.dart';
import 'package:event_app/provider/event_provider.dart';
import 'package:event_app/screens/add_event/add_event_dialog.dart';
import 'package:event_app/screens/login/login_page.dart';
import 'package:event_app/screens/home/homepage_blob.dart';
import 'package:event_app/widgets/event_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

        // title: const Text('Hello'),
        actions: [
          IconButton(
              onPressed: () => context.read<AuthService>().signOut(),
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ))
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          buildHeader(width),
          Flexible(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: Consumer<EventProvider>(
                builder: (context, EventProvider data, child) {
                  if (data.getEvent.isEmpty) {
                    return buildEmptyEvents();
                  } else {
                    return ListView.builder(
                        padding: const EdgeInsets.only(bottom: 20),
                        itemCount: data.getEvent.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: EventCard(event: data.getEvent[index]),
                          );
                        });
                  }
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddDialog(context);
        },
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

  void showAddDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AddDialog();
      },
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginPage()));
  }
}
