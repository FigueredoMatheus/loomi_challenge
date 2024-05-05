import 'package:loomi_challenge/src/models/movie_comment_model/movie_comment_model.dart';
import 'package:loomi_challenge/src/models/movie_model/movie_model.dart';
import 'package:loomi_challenge/src/models/user_model/user_model.dart';

final user = UserModel.fromJson({
  'name': 'Matheus Figueredo',
  'email': 'matheus@gmail.com',
  'image': 'https://randomuser.me/api/portraits/men/35.jpg',
});

final user1 = UserModel.fromJson({
  'name': 'Carlos Jose',
  'email': 'matheus@gmail.com',
  'image': '',
});

final movieComment = MovieCommentModel.fromJson({
  'comment':
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore',
  'user': <String, dynamic>{
    'name': 'Matheus Figueredo',
    'email': 'matheus@gmail.com',
    'image': 'https://randomuser.me/api/portraits/men/35.jpg',
  },
  'create_at': DateTime.now().toString(),
  'replies': 10,
});

final movie = MovieModel.fromJson({
  'title': 'Barbie',
  'sinopse':
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore',
  'genre': ['Musical'],
  'expires_date': DateTime.now().toString(),
  'comments': [
    <String, dynamic>{
      'comment':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore',
      'user': {
        'name': 'Matheus Figueredo',
        'email': 'matheus@gmail.com',
        'image': 'https://randomuser.me/api/portraits/men/35.jpg',
      },
      'create_at': DateTime.now().toString(),
      'replies': 10,
    }
  ],
});
