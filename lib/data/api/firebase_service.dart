import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entity/movie_entity.dart';

import '../../result.dart';
import '../models/movie.dart';

@singleton
class FirebaseService {
  CollectionReference watchListCollection =
      FirebaseFirestore.instance.collection('watchList');

  Future<Result<bool>> addToWatchList(MovieEntity movie) async {
    try {
      await watchListCollection.doc().set(movie.toFireStore());
      return Success(data: true);
    } on Exception catch (e) {
      return Error(exception: e);
    }
  }

  Future<Result<List<Movie>>> getWatchList() async {
    try {
      QuerySnapshot querySnapshot = await watchListCollection.get();
      List<QueryDocumentSnapshot> docs = querySnapshot.docs;
      List<Movie> movies = docs.map((docSnapShot) {
        Map<String, dynamic> json = docSnapShot.data() as Map<String, dynamic>;
        return Movie.fromFireStore(json);
      }).toList();

      return Success(data: movies);
    } on Exception catch (e) {
      return Error(exception: e);
    }
  }
}
