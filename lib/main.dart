import 'package:fake_flutter_api/state/state_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'model/photo.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    AsyncValue<List<Photo>> photos = watch(photoStateFuture);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Fake jsonplaceholder')),
      body: photos.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) => Center(child: Text('${err.toString()}')),
          data: (photos) {
            return ListView.builder(
                itemCount: photos.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(photos[index].thumbnailUrl),
                        ),
                        title: Text(
                            '${photos[index].id}. ${photos[index].title /**/}'),
                      )
                    ],
                  );
                });
          }),
    );
  }
}
