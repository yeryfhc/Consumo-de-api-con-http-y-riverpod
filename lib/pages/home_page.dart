import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutorialapi/providers/giphy_riverpod.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: const Text('My App'),),
    body: const  GiphyWidget()
    );
  }
}

class GiphyWidget extends ConsumerWidget {
  const GiphyWidget({super.key});

  @override
  Widget build(BuildContext context,ref) {
    final infoGiphy=ref.watch(giPhyProvider);
    if (infoGiphy.hasError) {
      return const Center(child: Text('Error al obtener datos '),);
    }
     return infoGiphy.when(
      data: (data){
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(child: Column(children: [
                 Text(infoGiphy.value![index].title),
                 FadeInImage(placeholder: const AssetImage('assets/loading.gif'),
                  image:NetworkImage(infoGiphy.value![index].images.downsized.url) )
            ],),);
          },
        );
      }, 
      error: ((error, stackTrace) => const Center(child: Text('Error'),)), 
      loading: ()=>const Center(child: CircularProgressIndicator(),));
  }
}