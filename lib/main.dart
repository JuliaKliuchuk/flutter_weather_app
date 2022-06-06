import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: _appBar(),
        body: _buildBody(),
      ),
    );
  }
}

PreferredSizeWidget _appBar() {
  return AppBar(
    title: const Text(
      'Weather App',
      style: TextStyle(
        color: Colors.black87,
      ),
    ),
    centerTitle: true,
    backgroundColor: Colors.white,
    leading: IconButton(
      icon: const Icon(Icons.menu),
      onPressed: () {},
    ),
    iconTheme: const IconThemeData(color: Colors.black54),
    // кнопка справа
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.settings),
      )
    ],
  );
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: Column(
      children: [
        _headerImage(),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _weatherDescription(),
                const Divider(),
                _temp(),
                const Divider(),
                _tempForecast(),
                const Divider(),
                _footerRatings(),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Image _headerImage() {
  return const Image(
    image: NetworkImage(
        'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
    fit: BoxFit.cover,
  );
}

Column _weatherDescription() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: const [
      Text(
        'Tuesday - May 22',
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),
      Divider(),
      Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        style: TextStyle(color: Colors.black54),
      ),
    ],
  );
}

Row _temp() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [Icon(Icons.wb_sunny, color: Colors.yellow)],
      ),
      const SizedBox(width: 16.0),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Text(
                '15℃ Clear',
                style: TextStyle(color: Colors.deepPurple),
              ),
            ],
          ),
          Row(
            children: const [
              Text(
                'Gomelskaya oblast, Mazyr',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

Wrap _tempForecast() {
  return Wrap(
    spacing: 10.0,
    children: List.generate(
      8,
      (index) => Chip(
        label: Text(
          '${index + 20}℃',
          style: const TextStyle(fontSize: 15.0),
        ),
        avatar: Icon(
          Icons.wb_cloudy,
          color: Colors.blue.shade300,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
          side: const BorderSide(color: Colors.grey),
        ),
        backgroundColor: Colors.grey.shade100,
      ),
    ),
  );
}

Row _footerRatings() {
  var stars = Row(
    mainAxisSize: MainAxisSize.min,
    children: const [
      Icon(Icons.star, size: 15.0, color: Colors.yellow),
      Icon(Icons.star, size: 15.0, color: Colors.yellow),
      Icon(Icons.star, size: 15.0, color: Colors.yellow),
      Icon(Icons.star, size: 15.0, color: Colors.black),
      Icon(Icons.star, size: 15.0, color: Colors.black),
    ],
  );

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      const Text(
        'Info with openweather.org',
        style: TextStyle(fontSize: 15.0),
      ),
      stars
    ],
  );
}
