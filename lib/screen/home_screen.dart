import 'package:flutter/material.dart';
import 'package:new_hackathon/app_theme.dart/extension_utils.dart';
import 'package:new_hackathon/app_theme.dart/text_theme.dart';
import 'package:new_hackathon/app_theme.dart/them_colors.dart';
import 'package:new_hackathon/model/election_model.dart';
import 'package:share_plus/share_plus.dart';

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
            icon:const Icon(
              Icons.menu,
              color: ThemeColor.black,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          );
        }),
        backgroundColor: ThemeColor.mintChiffon,
        elevation: 0,
      ),
      drawer:const Drawer(),
      body: ListView.separated(
          padding:const EdgeInsets.symmetric(horizontal: 10),
          separatorBuilder: (ctx, idex) =>const Divider(
                height: 1,
              ),
          itemCount: elections.length,
          itemBuilder: (ctx, index) {
            return ElectionItem(elections[index]);
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
      padding:const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      margin:const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
             const     Icon(
                    Icons.thumb_up,
                    color: ThemeColor.black,
                  ),
               const   Spacer(),
                 const Icon(
                    Icons.chat_outlined,
                    color: ThemeColor.black,
                  ),
                const  Spacer(),
                  IconButton(
                      icon:const Icon(
                        Icons.share,
                        color: ThemeColor.black,
                      ),
                      onPressed: () {
                        Share.share(
                          election.description,
                          subject: 'Parrot Bo',
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