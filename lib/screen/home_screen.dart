import 'package:flutter/material.dart';
import 'package:new_hackathon/app_theme.dart/extension_utils.dart';
import 'package:new_hackathon/app_theme.dart/text_theme.dart';
import 'package:new_hackathon/app_theme.dart/them_colors.dart';
import 'package:new_hackathon/firebase_service/auth_service.dart';
import 'package:new_hackathon/model/election_model.dart';
import 'package:new_hackathon/screen/graph_screen.dart';
import 'package:new_hackathon/screen/login_screen.dart';
import 'package:share_plus/share_plus.dart';

import '../di.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.mintChiffon,
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(
              Icons.menu,
              color: ThemeColor.black,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          );
        }),
        backgroundColor: ThemeColor.mintChiffon,
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              height: 180,
            ),
            const ListTile(
              leading: Icon(
                Icons.search,
                color: ThemeColor.black,
              ),
              title: Text(
                'Budget Data',
                style: kt14Blck,
              ),
            ),
            const ListTile(
              leading: Icon(
                Icons.all_out,
                color: ThemeColor.black,
              ),
              title: Text(
                'Analysis',
                style: kt14Blck,
              ),
            ),
            const ListTile(
              leading: Icon(
                Icons.privacy_tip,
                color: ThemeColor.black,
              ),
              title: Text(
                'News feed',
                style: kt14Blck,
              ),
            ),
            const ListTile(
              leading: Icon(
                Icons.account_circle,
                color: ThemeColor.black,
              ),
              title: Text(
                'Personal budget',
                style: kt14Blck,
              ),
            ),
            // const ListTile(
            //   leading: Icon(
            //     Icons.account_box,
            //     color: ThemeColor.black,
            //   ),
            //   title: Text(
            //     'Fund some one',
            //     style: kt14Blck,
            //   ),
            // ),
            // const ListTile(
            //   leading: Icon(
            //     Icons.privacy_tip,
            //     color: ThemeColor.black,
            //   ),
            //   title: Text(
            //     'Voters information',
            //     style: kt14Blck,
            //   ),
            // ),
            ListTile(
              onTap: () {
                getIt.get<AuthService>().signOut();
                Navigator.pushReplacementNamed(context, LoginScreen.routeName);
              },
              leading: const Icon(
                Icons.logout_outlined,
                color: ThemeColor.black,
              ),
              title: const Text(
                'Logout',
                style: kt14Blck,
              ),
            ),
          ],
        ),
      ),
      body: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          separatorBuilder: (ctx, idex) => const Divider(
                height: 1,
              ),
          itemCount: elections.length,
          itemBuilder: (ctx, index) {
            return GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Navigator.pushNamed(context, GraphScreen.routeName);
                },
                child: ElectionItem(elections[index]));
          }),
    );
  }
}

class ElectionItem extends StatelessWidget {
  final Election election;

  const ElectionItem(this.election);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/${election.imagePath}'),
                    fit: BoxFit.cover),
                shape: BoxShape.circle,
                color: ThemeColor.appgreen),
          ),
          10.horizontalSpace,
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(election.description),
              10.verticalSpace,
              ...election.tags
                  .map((e) => Text(
                        e,
                        textAlign: TextAlign.left,
                        style: kt14Green,
                      ))
                  .toList(),
              20.verticalSpace,
              Row(
                children: [
                  const Icon(
                    Icons.thumb_up,
                    color: ThemeColor.black,
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.chat_outlined,
                    color: ThemeColor.black,
                  ),
                  const Spacer(),
                  IconButton(
                      icon: const Icon(
                        Icons.share,
                        color: ThemeColor.black,
                      ),
                      onPressed: () {
                        Share.share(
                          election.description,
                          subject: 'Parrot Box',
                        );
                      }),
                ],
              )
            ]),
          )
        ],
      ),
    );
  }
}

// Share.share('check out my website https://example.com', subject: 'Look what I made!');