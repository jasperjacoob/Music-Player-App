import 'package:flutter/material.dart';
import 'package:musicplayer/constant.dart';
import 'package:musicplayer/widgets/appbar_widget.dart';
import 'package:musicplayer/widgets/navdrawer_widget.dart';

class PodcastScreen extends StatefulWidget {
  const PodcastScreen({Key? key}) : super(key: key);

  @override
  State<PodcastScreen> createState() => _PodcastScreenState();
}

class _PodcastScreenState extends State<PodcastScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const NavigationDrawerWidget(),
        appBar: AppBarNav(),
        body: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: padding,
              child: Text(
                'Podcast',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Container(
                padding: padding,
                child: Form(
                    child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: 'Enter your Podcast Website here'),
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(color: onSecondary),
                    ),
                    TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: onPrimary,
                        ),
                        onPressed: () {},
                        child: Text(
                          'Play',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(color: secondary),
                        ))
                  ],
                )))
          ],
        ),
      ),
    );
  }
}
