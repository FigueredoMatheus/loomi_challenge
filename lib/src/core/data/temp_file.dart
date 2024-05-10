import 'package:loomi_challenge/src/models/entity/movie_entity/movie_entity.dart';
import 'package:loomi_challenge/src/models/entity/user_entity/user_entity.dart';
import 'package:loomi_challenge/src/models/movie_comment_model/movie_comment_model.dart';

final user = UserEntity.fromJson({
  'username': 'Matheus Figueredo',
  'email': 'matheus@gmail.com',
  'confirmed': false,
  'image': 'https://randomuser.me/api/portraits/men/35.jpg',
});

final user1 = UserEntity.fromJson({
  'name': 'Carlos Jose',
  'email': 'matheus@gmail.com',
  'confirmed': false,
  'image': '',
});

final movieComment = MovieCommentModel.fromJson({
  'comment':
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore',
  'user': <String, dynamic>{
    'username': 'Matheus Figueredo',
    'email': 'matheus@gmail.com',
    'confirmed': false,
    'image': 'https://randomuser.me/api/portraits/men/35.jpg',
  },
  'create_at': DateTime.now().toString(),
  'replies': 10,
});

final movie = MovieEntity.fromJson({
  'title': 'Barbie',
  'synopsis':
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore',
  'genre': 'Musical',
  'stream_link':
      "https://github.com/ItaloDias-stack/demo-videos/blob/main/9th_may_compressed.mp4?raw=true",
  'poster_image':
      'https://untold-strapi-stage.s3.amazonaws.com/profile_picutre_102f6bdde5.jpg',
  'end_date': DateTime.now().toString(),
  'comments': [
    <String, dynamic>{
      'comment':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore',
      'user': {
        'username': 'Matheus Figueredo',
        'email': 'matheus@gmail.com',
        'confirmed': false,
        'image': 'https://randomuser.me/api/portraits/men/35.jpg',
      },
      'create_at': DateTime.now().toString(),
      'replies': 10,
    }
  ],
});
