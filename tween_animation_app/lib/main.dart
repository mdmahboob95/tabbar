import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: MyApp()));
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>with SingleTickerProviderStateMixin {

  late AnimationController animationController;
  late Animation animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =AnimationController(vsync: this,duration: Duration(seconds: 10));
    animation = Tween<double>(begin: 0.0, end: 200.0).animate(animationController)..addListener(() {
      setState(() {

      });
    },);
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
          child:Scaffold(

            floatingActionButton: FloatingActionButton(onPressed: () {
            },
            ),

            appBar: AppBar(
              title: Text("Home"),
              bottom:  TabBar(tabs: [
                Tab(child: Text("Tab1"),),
                Tab(child: Text("Tab2"),),
                Tab(child: Text("Tab3"),),
              ]),
            ),
            body: TabBarView(children: [
              Container(color: Colors.blue,),
              Container( color: Colors.black12,),
              Container(color: Colors.white, child: ListView(
                children: [

                  Container(height: animation.value, color: Colors.green,),
                  Container(height: 500, color: Colors.yellow,),
                  Container(height: 500, color: Colors.green,),

                ],
              ),
              )
            ]),
          ) ),
    );
  }
}
