import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:consume_api_test/model/articles.dart';
import 'package:consume_api_test/connector/connector.dart' as connection;
import 'package:http/http.dart' as http;

DateTime date = DateTime.now();
String dateFormat = DateFormat('dd/MM/yyyy').format(date);

class PageOne extends StatelessWidget{
	@override
	Widget build(BuildContext context){
		return Scaffold(
			appBar: AppBar(
        backgroundColor: Colors.deepPurple,
				title: Text('Artículo Completo'),
				actions: <Widget>[
					IconButton(icon: Icon(Icons.share), onPressed: (){}
          )
				],
			),
			body: FutureBuilder<List<Article>>(
        future: connection.getData(http.Client()),
        builder: (context, snapshot){
          if(snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
            ? ContentView(data: snapshot.data)
            : Center(child:
              Text('${snapshot.error}'),
            );
        },
      ),
		);
	}
}

class ContentView extends StatelessWidget{
  final List<Article> data;
  ContentView({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
				child: Container(
					child: Stack(
						children: <Widget>[
							Container(
								height: 300,
								width: double.infinity,
								child: Image.asset('assets/background.png', fit: BoxFit.cover)
							),
							Container(
								margin: EdgeInsets.fromLTRB(16.0, 250.0, 16.0, 16.0),
								decoration: BoxDecoration(
									color: Colors.white,
									borderRadius: BorderRadius.circular(5.0),
								),
								padding: const EdgeInsets.all(16.0),
								child: Column(
									crossAxisAlignment: CrossAxisAlignment.start,
									children: <Widget>[
										Text('Consumiendo servicios REST', style: Theme.of(context).textTheme.title),
										SizedBox(height: 10.0),
										Text(dateFormat),
										SizedBox(height: 10.0),
										Divider(),
										SizedBox(height: 10.0),
										Row(children: <Widget>[
											Icon(Icons.favorite_border),
											SizedBox(width: 5.0),
											SizedBox(width: 16.0),
											Icon(Icons.comment),
											SizedBox(width: 5.0),
										]),
										SizedBox(height: 10.0),
										Text(data[0].title),
										SizedBox(height: 10.0),
										Text(data[0].body)
									],
								),
						  ),
						],
					),
				),
		);
  }
}