import 'package:flutter/material.dart';
import 'package:musicplayer/constant.dart';
import 'package:musicplayer/widgets/appbar_widget.dart';
import 'package:musicplayer/widgets/navdrawer_widget.dart';

class VodcastScreen extends StatefulWidget {
  VodcastScreen({Key? key}) : super(key: key);

  @override
  State<VodcastScreen> createState() => _VodcastScreenState();
}

class _VodcastScreenState extends State<VodcastScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: background,
        drawer: const NavigationDrawerWidget(),
        appBar: AppBarNav(),
        body: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: padding,
              child: Text(
                'Vodcast',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Container(
                padding: padding,
                child: Form(
                    child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Enter your Vodcast Embedded Code'),
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
