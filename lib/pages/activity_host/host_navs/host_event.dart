
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jcs/models/orderItem.dart';

import '../../../constants.dart';
import '../../../data.dart';
import '../add_event_page.dart';


class HostEvents extends StatefulWidget {
  const HostEvents({Key? key}) : super(key: key);

  @override
  State<HostEvents> createState() => _HostEventsState();
}

class _HostEventsState extends State<HostEvents> with TickerProviderStateMixin{

  late TabController controller;
  @override
  void initState() {
    // TODO: implement initState
    controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  Widget build(BuildContext context) {
    List<EventDemo> items = events;

    return Scaffold(

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, CupertinoPageRoute(builder: (_)=>const AddEvent()));
        },
        child: Center(
          child: Icon(Icons.add,color: textWhiteColor,),
        ),

      ),

        appBar: AppBar(
          title: Text('Events',style: textLargeStyle.copyWith(color: Colors.white ,fontWeight: FontWeight.w500,fontSize: 26),),
          centerTitle: true,
          leading: Container(),
          bottom: TabBar(
            controller: controller,
            tabs: const [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text('In-Review',style: textMediumStyle,),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Accepted',style: textMediumStyle,),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Rejected',style: textMediumStyle),
              ),
            ],
          ),
        ),
        body:    TabBarView(
          controller: controller,
          children: [
            // on-going events
            Container(
              height: MediaQuery.of(context).size.height,
              child: ListView(
                padding: EdgeInsets.only(bottom: 50),
                children: [

                  Container(
                    height: MediaQuery.of(context).size.height/1.3,
                    padding: EdgeInsets.only(top: 20 ,right: 10,left: 10),
                    child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: items.length,
                        itemBuilder: (context,index){
                          return  Card(
                            color: Colors.grey.shade200,
                            margin: EdgeInsets.only(bottom: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            elevation: 5,
                            child: Center(
                                child:Row(
                                  children: [
                                    Container(
                                      height: MediaQuery.of(context).size.width/3,width: MediaQuery.of(context).size.width/3,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.horizontal(left: Radius.circular(10),right: Radius.circular(40)),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                events[index].imgPath!
                                            )
                                        ),
                                      ),),
                                    SizedBox(width: 10,),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 10.0,left: 30),
                                          child: Text(events[index].title!,style: textLargeStyle.copyWith(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 20),),
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.date_range),
                                            Text(events[index].exDate.toString(),style: textSmallStyle.copyWith(color: Colors.grey[600],fontSize: 13),),
                                          ],
                                        ),
                                        SizedBox(height: 5,),

                                        Row(
                                          children: [
                                            Icon(Icons.timer_outlined),

                                            Text(events[index].time.toString(),style: textSmallStyle.copyWith(color: Colors.grey[600],fontSize: 13),),
                                          ],
                                        ),

                                        SizedBox(height: 5,),
                                        Row(
                                          children: [
                                            Icon(Icons.group_outlined),

                                            Text(events[index].isAccepted!?'Accepted':'Not Accepted',style: textSmallStyle.copyWith(color: Colors.grey[600],fontSize: 13),),
                                          ],
                                        ),
                                        SizedBox(height: 30,),

                                      ],
                                    ),
                                  ],

                                )
                            ),
                          );

                        }),
                  ),
                ],
              ),
            ),
            // Accepted events
            Container(
              height: MediaQuery.of(context).size.height,
              child: ListView(
                padding: EdgeInsets.only(bottom: 50),
                children: [

                  Container(
                    height: MediaQuery.of(context).size.height/1.3,
                    padding: EdgeInsets.only(top: 20 ,right: 10,left: 10),
                    child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: items.length,
                        itemBuilder: (context,index){
                          return  Card(
                            color: Colors.grey.shade200,
                            margin: EdgeInsets.only(bottom: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            elevation: 5,
                            child: Center(
                                child:Row(
                                  children: [
                                    Container(
                                      height: MediaQuery.of(context).size.width/3,width: MediaQuery.of(context).size.width/3,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.horizontal(left: Radius.circular(10),right: Radius.circular(40)),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                events[index].imgPath!
                                            )
                                        ),
                                      ),),
                                    SizedBox(width: 10,),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 10.0,left: 30),
                                          child: Text(events[index].title!,style: textLargeStyle.copyWith(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 20),),
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.date_range),
                                            Text(events[index].exDate.toString(),style: textSmallStyle.copyWith(color: Colors.grey[600],fontSize: 13),),
                                          ],
                                        ),
                                        SizedBox(height: 5,),

                                        Row(
                                          children: [
                                            Icon(Icons.timer_outlined),

                                            Text(events[index].time.toString(),style: textSmallStyle.copyWith(color: Colors.grey[600],fontSize: 13),),
                                          ],
                                        ),

                                        SizedBox(height: 5,),
                                        Row(
                                          children: [
                                            Icon(Icons.group_outlined),

                                            Text(events[index].isAccepted!?'Accepted':'Not Accepted',style: textSmallStyle.copyWith(color: Colors.grey[600],fontSize: 13),),
                                          ],
                                        ),
                                        SizedBox(height: 30,),

                                      ],
                                    ),
                                  ],

                                )
                            ),
                          );

                        }),
                  ),
                ],
              ),
            ),

            // Rejected events

            Container(
              height: MediaQuery.of(context).size.height,
              child: ListView(
                padding: EdgeInsets.only(bottom: 50),
                children: [

                  Container(
                    height: MediaQuery.of(context).size.height/1.3,
                    padding: EdgeInsets.only(top: 20 ,right: 10,left: 10),
                    child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: items.length,
                        itemBuilder: (context,index){
                          return  Card(
                            color: Colors.grey.shade200,
                            margin: EdgeInsets.only(bottom: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            elevation: 5,
                            child: Center(
                                child:Row(
                                  children: [
                                    Container(
                                      height: MediaQuery.of(context).size.width/3,width: MediaQuery.of(context).size.width/3,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.horizontal(left: Radius.circular(10),right: Radius.circular(40)),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                events[index].imgPath!
                                            )
                                        ),
                                      ),),
                                    SizedBox(width: 10,),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 10.0,left: 30),
                                          child: Text(events[index].title!,style: textLargeStyle.copyWith(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 20),),
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.date_range),
                                            Text(events[index].exDate.toString(),style: textSmallStyle.copyWith(color: Colors.grey[600],fontSize: 13),),
                                          ],
                                        ),
                                        SizedBox(height: 5,),

                                        Row(
                                          children: [
                                            Icon(Icons.timer_outlined),

                                            Text(events[index].time.toString(),style: textSmallStyle.copyWith(color: Colors.grey[600],fontSize: 13),),
                                          ],
                                        ),

                                        SizedBox(height: 5,),
                                        Row(
                                          children: [
                                            Icon(Icons.group_outlined),

                                            Text(events[index].isAccepted!?'Accepted':'Not Accepted',style: textSmallStyle.copyWith(color: Colors.grey[600],fontSize: 13),),
                                          ],
                                        ),
                                        SizedBox(height: 30,),

                                      ],
                                    ),
                                  ],

                                )
                            ),
                          );

                        }),
                  ),
                ],
              ),
            ),


          ],
        ),

    );
  }
}
