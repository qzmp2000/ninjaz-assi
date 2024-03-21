import 'package:assignment/configs/colors.dart';
import 'package:assignment/networking/beans/post.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:simple_tags/simple_tags.dart';

class PostWidget extends StatelessWidget {
  PostWidget(this.post, {super.key});

  Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: Color(0xffEDEDEB),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage:
                        CachedNetworkImageProvider(post.owner?.picture ?? ""),
                    backgroundColor: Colors.transparent,
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text((post.owner?.firstName ?? "") +
                          " " +
                          (post.owner?.lastName ?? "")),
                      const SizedBox(width: 8),
                      Text(
                        post.getRelativeDate(),
                        style: const TextStyle(fontSize: 12),
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/ic_like.png',
                            width: 18,
                            height: 18,
                          ),
                          const SizedBox(width: 3),
                          Text((post.likes ?? 0).toString(),
                              style: const TextStyle(fontSize: 12))
                        ],
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Container(
                      width: 150,
                      height: 150,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: CachedNetworkImage(
                          imageUrl: post.image ?? "",
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      )),
                  const SizedBox(width: 8),
                  Expanded(child: Text(post.text ?? ""))
                ],
              ),
              const SizedBox(height: 8),
              SimpleTags(
                  content: post.tags ?? [],
                  wrapSpacing: 4,
                  wrapRunSpacing: 4,
                  tagContainerMargin: const EdgeInsets.all(4),
                  tagContainerPadding: const EdgeInsets.only(
                      left: 12, top: 3, right: 12, bottom: 3),
                  tagTextStyle: const TextStyle(color: Colors.white),
                  tagContainerDecoration: BoxDecoration(
                    color: AppColors.primary,
                    border: Border.all(color: Colors.grey),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ))
            ],
          ),
        ));
  }
}
