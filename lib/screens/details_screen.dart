import 'package:flutter/material.dart';
import 'package:peliculas/widgets/widgets.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});


  @override
  Widget build(BuildContext context) {

    // TODO: Cambiar por una instacia de movie 
    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(),
              _OverView(),
              _OverView(),
              _OverView(),
              CastingCards(),

            ])
          )
        ],
      )
    );
  }
}

class _CustomAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          padding: const EdgeInsets.only( bottom: 10),
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          child: const Text(
            'Movie.title',
            style: TextStyle( fontSize: 16 ),
          ),
        ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'), 
          image: NetworkImage('https://via.placeholder.com/500x300'), 
          fit: BoxFit.cover,
          ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only( top: 20 ),
      padding: const EdgeInsets.symmetric( horizontal: 20 ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'), 
              image: NetworkImage('https://via.placeholder.com/200x300'),
              height: 150,
            ),
          ),
          
          const SizedBox(width: 20),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('movie.title', style: textTheme.headlineSmall, overflow: TextOverflow.ellipsis, maxLines: 2,),
              Text('movie.originalTitle', style: textTheme.titleMedium, overflow: TextOverflow.ellipsis, maxLines: 1,),

              Row(
                children: [
                  const Icon(Icons.star_outline, size: 15, color: Colors.grey,),
                  const SizedBox(width: 5,),
                  Text('movie.voteAverage', style: textTheme.bodySmall,)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}


class _OverView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric( horizontal: 30, vertical: 10 ),
      child: Text('Non laborum tempor irure cillum labore et irure. Ex mollit consequat velit occaecat adipisicing labore do tempor ad minim est. Ullamco est ullamco ipsum dolor duis duis eu pariatur minim tempor elit.',
      textAlign: TextAlign.justify,
      style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}

