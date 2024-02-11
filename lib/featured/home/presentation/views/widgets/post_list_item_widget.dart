import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/posts_model.dart';

class PostListItemWidget extends StatelessWidget
{
  final Post post;
  const PostListItemWidget({Key? key, required this.post}) : super(key: key);
  @override
  Widget build(BuildContext context)
  {
    return Padding(
      padding:  EdgeInsetsDirectional.only(
      start:8.0.w,end:8.0.w,top:8.0.h,bottom: 8.0.h
      ),
      child: ListTile(
        leading: Text(post.id.toString()),
        title: Text(post.title),
        isThreeLine: true,
        subtitle: Text(post.body),
      ),
    );
  }
}
