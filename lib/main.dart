import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "My New App",
    theme: ThemeData(primarySwatch: Colors.red, brightness: Brightness.light),
    home: HomeWidget()
  ));

}

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      //backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: Text("My Header"),
      ),
        body: ListView.builder(
          itemCount: 50,
          itemBuilder: (context,index){
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  child: Text("$index"),
                ),
                trailing: Text("2:10"),
                title: Text("User Name"),
                subtitle: Text("Subtitle"),
              ),);
            
            // return Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Row(
            //       children:     <Widget>[                
            //         CircleAvatar(    
            //           backgroundColor: Colors.blue,    
            //           child: Text("$index"),    
            //         ),
            //         Column(
            //           children: <Widget>[
            //             Padding(
            //               padding: const EdgeInsets.all(top:8.0,left:
            //                 Text("User Name"),
            //               )
                           

            //             ),
            //             Text("")
            //           ],
            //         ),  
            //       ],
            //      ),
            //      Padding(
            //        padding: const EdgeInsets.all(18.0),
            //        child: Text("2:10"),
            //      )
            //     ],
            //   );
            },
        ),
        
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),),
    );
  }
}
