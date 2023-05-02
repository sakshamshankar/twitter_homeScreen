import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Tweet extends StatelessWidget {
  final String avatar;
  final String username;
  final String name;
  final String timeAgo;
  final String text;
  final String comments;
  final String retweets;
  final String favourites;

  const Tweet({
    Key ?key,
    required this.avatar,
    required this.username,
    required this.name,
    required this.timeAgo,
    required this.text,
    required this.comments,
    required this.retweets,
    required this.favourites,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          tweetAvatar(),
          tweetBody(),
        ],
      ),
    );
  }

  Widget tweetAvatar() {
    return Container(
        margin: EdgeInsets.all(10),
        child: CircleAvatar(backgroundColor: Colors.white,
          backgroundImage: NetworkImage(this.avatar),
        ));
  }

  Widget tweetBody() {
    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        tweetHeader(),
        tweetText(),
        tweetButtons(),
      ],
    ));
  }

  Widget tweetHeader() {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: 5.0),
          child: Text(
            this.username,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        Text(
          '@$name . $timeAgo',
          style: TextStyle(color: Colors.grey),
        ),
        Spacer(),
        IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.angleDown,
              size: 14,
              color: Colors.grey,
            ))
      ],
    );
  }

  Widget tweetText(){
    return Text(text, overflow: TextOverflow.clip,);
  }

  Widget tweetButtons() {
    return Container(margin: EdgeInsets.only(top: 10.0 , right: 20.0), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      tweetIconButton(FontAwesomeIcons.comment, this.comments),
      tweetIconButton(FontAwesomeIcons.retweet, this.retweets),
      tweetIconButton(FontAwesomeIcons.heart, this.favourites),
      tweetIconButton(FontAwesomeIcons.share, ''),
    ],),);

   
  }

   Widget tweetIconButton (IconData icon, String text) {
      return Row(children: [
        Icon(icon, size: 16.0, color: Colors.black45,),
        Container(margin: EdgeInsets.all(6),
        child: Text(text, style: TextStyle(color: Colors.black45, fontSize: 14),),)
      ],);
    }
}
