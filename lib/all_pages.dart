import 'package:flutter/material.dart';

import 'home_page.dart';
import 'models/post_model.dart';
import 'models/story_model.dart';



class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}
List<Story> stories = [
  Story('https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg', 'jessi'),
  Story('https://media.istockphoto.com/photos/mountain-landscape-picture-id517188688?k=20&m=517188688&s=612x612&w=0&h=i38qBm2P-6V4vZVEaMy_TaTEaoCMkYhvLCysE7yJQ5Q=', 'Amelia'),
  Story('https://images.unsplash.com/photo-1541963463532-d68292c34b19?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Ym9va3xlbnwwfHwwfHw%3D&w=1000&q=80', 'Someone'),
  Story('https://media.istockphoto.com/photos/mountain-landscape-picture-id517188688?k=20&m=517188688&s=612x612&w=0&h=i38qBm2P-6V4vZVEaMy_TaTEaoCMkYhvLCysE7yJQ5Q=', 'Amelia'),
  Story('https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg', 'jessi'),
  Story('https://media.istockphoto.com/photos/mountain-landscape-picture-id517188688?k=20&m=517188688&s=612x612&w=0&h=i38qBm2P-6V4vZVEaMy_TaTEaoCMkYhvLCysE7yJQ5Q=', 'Amelia'),
  Story('https://images.unsplash.com/photo-1541963463532-d68292c34b19?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Ym9va3xlbnwwfHwwfHw%3D&w=1000&q=80', 'Someone'),
];

List<Post> posts = [
  Post(userName: 'Emly', userImage: 'https://static.remove.bg/remove-bg-web/f9c9a2813e0321c04d66062f8cca92aedbefced7/assets/start_remove-c851bdf8d3127a24e2d137a55b1b427378cd17385b01aec6e59d5d4b5f39d2ec.png', postImage: 'https://www.akamai.com/site/im-demo/perceptual-standard.jpg?imbypass=true', caption: 'this might be the most exciting moment of life, we keep moving forward'),
  Post(userName: 'Brian', userImage: 'https://images.unsplash.com/photo-1660476705851-21e527337f9a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80', postImage: 'https://images.unsplash.com/photo-1660474302673-ae4dc5279e10?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80', caption: 'It was one of the best day that has to be shot. Having a nice weekend!!!'),
];
class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.black,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Divider(),
              //Stories and watch all
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Stories', style: TextStyle(color: Colors.grey, fontSize: 14),),
                    Text('Watch All', style: TextStyle(color: Colors.grey, fontSize: 14)),
                  ],
                ),
              ),
              //story listview
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(vertical: 10,),
                height: 110,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: stories.map((e) {
                    return itemOfStory(e);
                  }).toList(),
                ),
              ),
              //post list
              Container(
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(

                  itemCount: posts.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (ctx, i){
                    return itemOfPost(posts[i]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  //stories
  Widget itemOfStory(Story e){
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            border: Border.all(width: 3, color: Color(0xFF8e44ad),),
          ),
          child: Container(
            padding: const EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: Image(
                image:NetworkImage(e.image),
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 10,),
        Text(e.name, style: TextStyle(color: Colors.grey),),
      ],
    );
  }
  //posts
Widget itemOfPost (Post post){
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          //header of post
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image(
                        image: NetworkImage(post.userImage),
                        width: 40,
                          height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Text(post.userName,style: TextStyle(color: Colors.grey),),

                  ],
                ),
                IconButton(onPressed: (){},
                    icon: const Icon(Icons.more_horiz, color: Colors.grey,),),
              ],
            ),
          ),
          FadeInImage(
            width: MediaQuery.of(context).size.width,
              placeholder: NetworkImage('https://adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg'),
              image: NetworkImage(post.postImage),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(onPressed: (){},
                      icon: const Icon(Icons.favorite_border, color: Colors.grey,),),
                  IconButton(onPressed: (){},
                    icon: const Icon(Icons.messenger_outline, color: Colors.grey),),
                  IconButton(onPressed: (){},
                    icon: const Icon(Icons.send_outlined, color: Colors.grey),),
                ],
              ),
              IconButton(onPressed: (){},
                icon: const Icon(Icons.bookmark_border_outlined),
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 14),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Liked By ',
                    style: TextStyle(color: Colors.grey,),
                  ),
                  TextSpan(
                    text: 'Michael,',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: ' Tima',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: ' and ',
                    style: TextStyle(color: Colors.grey,),
                  ),
                  TextSpan(
                    text: '122 others',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

          ),
          //caption
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                children:[
                  TextSpan(
                    text: post.userName,
                    style:const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  TextSpan(
                    text: ' ${post.caption}',
                    style:const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          //post date
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 14),
            alignment: Alignment.topLeft,
            child: const Text('March 10, 2022', textAlign: TextAlign.start, style: TextStyle(color: Colors.grey),),
          ),
        ],
      ),
    );
}

}
