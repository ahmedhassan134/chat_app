import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_graduation/models/message_model.dart';
import 'package:flutter/material.dart';

class Test extends StatelessWidget {


  TextEditingController dataController =TextEditingController();

  static String id='test';


  CollectionReference messages = FirebaseFirestore.instance.collection('messages');
  //final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('messages').snapshots();
final  ScrollController cont=ScrollController();


  @override
  Widget build(BuildContext context) {

    return StreamBuilder<QuerySnapshot>(

      stream: messages.orderBy('createdAt').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
       if(snapshot.hasData){
         List<MessageModel>messageList=[];
         for(int i=0;i<snapshot.data!.docs.length;i++){
           messageList.add(MessageModel.fromJson(snapshot.data!.docs[i]));

         }

         return
           Scaffold(
             appBar: AppBar(
               title: const Text('Chat App'),
               centerTitle: true,
             ),
             body: Column(
               children: [
                 Expanded(
                     child: ListView.builder(
                       itemCount: messageList.length,
                         itemBuilder: (context,index){


                       return Align(
                         alignment: Alignment.bottomLeft,
                         child: Container(
                           margin: const EdgeInsets.all(10),
                           padding: EdgeInsetsDirectional.only(start: 14,bottom: 20,top: 10,end: 20),

                           decoration: const BoxDecoration(
                               color: Colors.grey,
                               borderRadius: BorderRadius.only(
                                 topLeft: Radius.circular(32),
                                 topRight:  Radius.circular(32),
                                 bottomRight:  Radius.circular(32),
                               )
                           ),
                           child:  Text(messageList[index].message,style: const TextStyle(color: Colors.white,fontSize: 20),),
                         ),
                       );
                     })
                 ),
                 Container(
                   margin: const EdgeInsets.all(10),
                   child: TextField(

                     onSubmitted: (data){
                       messages.add({
                         'message':dataController.text,
                         'createdAt':DateTime.now()
                       });
                       dataController.clear();
                     cont.animateTo(
                        cont.position.maxScrollExtent,
                         curve: Curves.easeOut,
                         duration:  Duration(milliseconds: 500),
                       );



                     },
                     controller: dataController,
                     decoration: InputDecoration(
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(32),

                         ),
                         hintText: 'Enter Your Message',
                         suffixIcon: const Icon(Icons.send,color: Colors.blue,)
                     ),
                   ),
                 )
               ],
             ),
           );
       }
       else{
         return const Center(
           child: CircularProgressIndicator(),
         );
       }
      },
    );
  }
}
