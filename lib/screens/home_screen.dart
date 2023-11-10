import 'package:flutter/material.dart';

import 'package:peliculas/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Peliculas en cines'),
        //Esto quita la sombra que tiene por defecto el AppBar
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: const Icon( Icons.search_outlined ),
          )
        ],
      ),
      body: Column(
        children: [

          CardSwiper(),

          //listado orizontal de policulas 
        ],
      )
    );
  }
}