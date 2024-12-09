import 'package:cloud_firestore/cloud_firestore.dart';

import '../../result.dart';
import '../models/movie.dart';

class FirebaseService {
  CollectionReference watchListCollection =
      FirebaseFirestore.instance.collection('watchList');

  Future<Result<bool>> addToWatchList(Movie movie) async {
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
