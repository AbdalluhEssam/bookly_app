import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({
    super.key,
    this.bookImage =
        "https://img.freepik.com/free-vector/programming-concept-template-banner-flyer-with-isometric-style-vector_82472-741.jpg?w=740&t=st=1723411401~exp=1723412001~hmac=c30eac144643c4292ac0784854a46f47bc28b42aec5a9eb597a0de123c297036",
  });

  final String bookImage;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: AspectRatio(
        aspectRatio: 2 / 3,
        child: CachedNetworkImage(
          imageUrl: bookImage,
          fit: BoxFit.fill,
          // placeholder: (context, url) => const Center(
          //   child: CircularProgressIndicator(),
          // ),
          errorWidget: (context, url, error) => const Icon(Icons.error),),
      ),
    );
  }
}
