import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:module_16/Screens/second_screen.dart';

import '../widgets/match_class.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  List<MatchDetails> matchList = [];

  @override
  void initState() {
    // getMatchList();
    super.initState();
  }

  FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;
  late CollectionReference matchCollectionRef =
  firebaseFireStore.collection('matchlist');

  // Future<void> getMatchList() async {
  //   final QuerySnapshot result =
  //       await firebaseFireStore.collection('matchlist').get();
  //   for (QueryDocumentSnapshot element in result.docs) {
  //     MatchDetails match = MatchDetails(
  //         element.get('team1'), element.get('team2'), element.get('time'));
  //     matchList.add(match);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Match List'),
      ),
      body: StreamBuilder(
          stream: matchCollectionRef.orderBy('team1',descending: false).snapshots(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            if (snapshot.hasData) {
              matchList.clear();
              for (QueryDocumentSnapshot element in snapshot.data!.docs) {
                MatchDetails match = MatchDetails(
                    element.get('team1'),
                    element.get('team2'),
                    element.get('time'),
                    element.get('team1score'),
                    element.get('team2score'));
                matchList.add(match);
              }
              return ListView.builder(
                  itemCount: matchList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                          '${matchList[index].team1} vs ${matchList[index].team2}'),
                      trailing: const Icon(Icons.arrow_right_alt_rounded),
                      onLongPress: () {
                        MatchDetails des = matchList[index];
                        Get.to(SecondPage(match: des));
                      },
                    );
                  });
            }
            return const SizedBox();
          }
        // child: ListView.builder(
        //     itemCount: matchList.length,
        //     itemBuilder: (context, index) {
        //       return ListTile(
        //         title: Text(
        //             '${matchList[index].team1} vs ${matchList[index].team2}'),
        //         trailing: const Icon(Icons.arrow_right_alt_rounded),
        //       );
        //     }),
      ),
    );
  }
}