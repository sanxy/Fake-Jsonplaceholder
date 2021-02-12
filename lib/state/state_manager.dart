import 'package:fake_flutter_api/model/photo.dart';
import 'package:fake_flutter_api/network/network_request.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final photoStateFuture = FutureProvider<List<Photo>>((ref) async {
  return fetchPhotos();
});
