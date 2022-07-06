import 'package:flutter/material.dart';
import 'package:musicplayer/constant.dart';
import 'package:musicplayer/widgets/appbar_widget.dart';
import 'package:musicplayer/widgets/navdrawer_widget.dart';

class FbliveScreen extends StatefulWidget {
  FbliveScreen({Key? key}) : super(key: key);

  @override
  State<FbliveScreen> createState() => _FbliveScreenState();
}

class _FbliveScreenState extends State<FbliveScreen> {
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
                'FB Live',
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
                          hintText: 'Enter your FB Live Embedded Code'),
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
