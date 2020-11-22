import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoExmp extends StatelessWidget {
  Widget cupertinoScaffold() {
    return CupertinoPageScaffold(
      child: Center(
        child: Text('Hello iOS'),
      ),
      navigationBar: CupertinoNavigationBar(
        leading: Icon(CupertinoIcons.back),
        middle: Text('Cupertino'),
        trailing: Icon(CupertinoIcons.search),
      ),
    );
  }

  Widget cupertinoTabScaff() {
    return CupertinoTabScaffold(
      tabBuilder: (context, index) => CupertinoPageScaffold(
        child: Center(
          child: index == 0 ? Text('Chat') : Text('Phone'),
        ),
      ),
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.conversation_bubble), label: 'Chat'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.phone), label: 'Phone'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: Text('Chats'),
          ),
          SliverFillRemaining(
            child: Center(
              child: Text('WhatsApp'),
            ),
          ),
        ],
      ),
    );
  }
}
