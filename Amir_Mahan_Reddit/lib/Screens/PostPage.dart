import 'package:flutter/material.dart';
import 'package:Amir_Mahan_Reddit/BasicClasses/Post.dart';
import 'package:Amir_Mahan_Reddit/BasicClasses/Comment.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key key, this.post, this.comments}) : super(key: key);
  final Post post;
  final List<Comment> comments;
  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  List<Comment> commentsViewed = <Comment>[];
  int indexForComment = 0;
  void add10CommentsToList() {
    for (indexForComment;
        indexForComment < widget.comments.length && indexForComment < 10;
        indexForComment++) {
      commentsViewed.add(widget.comments[indexForComment]);
    }
  }

  @override
  Widget build(BuildContext context) {
    add10CommentsToList();
    print(commentsViewed.length);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Reddit",
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Gotham',
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(248, 44, 44, 44),
      ),
      backgroundColor: Colors.black87,
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: 10, left: 10, right: 10, bottom: 10),
                    child: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 21, 58, 205),
                      // backgroundImage:
                      // AssetImage("assets/images/profile.jpg"),
                    ),
                  ),
                  Column(children: [
                    Container(
                        child: Text("u/" + widget.post.Poster.getUsername(),
                            style: TextStyle(
                              fontFamily: 'Gotham',
                              fontSize: 16,
                              color: Colors.white,
                            ))),
                    Container(
                        child: Text("r/" + widget.post.getCommunity().name,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'Gotham',
                              fontSize: 13,
                              color: Colors.white,
                            ))),
                  ]),
                ],
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(right: 12),
                  child: Icon(
                    Icons.bookmark_border_outlined,
                    size: 30,
                    color: Color.fromARGB(189, 255, 255, 255),
                  ),
                ),
              ),
            ],
          ),
          //caption:
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Flexible(
                child: Container(
                    margin: EdgeInsets.only(
                        top: 10, left: 10, right: 10, bottom: 5),
                    child: Text(widget.post.getTitle(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 300,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'Gotham',
                          fontSize: 23,
                          color: Colors.white,
                        ))))
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Flexible(
                child: Container(
                    margin: EdgeInsets.only(
                        top: 5, left: 10, right: 10, bottom: 10),
                    child: Text(widget.post.getDescription(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 300,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'Gotham',
                          fontSize: 12,
                          color: Color.fromARGB(177, 255, 255, 255),
                        ))))
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    // setState(() {
                    //   posts[index].addLike(widget.user);
                    // });
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        top: 10, left: 10, right: 10, bottom: 10),
                    child: Icon(
                      Icons.thumb_up_alt_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
                Container(
                    color: Colors.transparent,
                    child: Text(widget.post.getNumLikes().toString(),
                        style: TextStyle(
                          fontFamily: 'Gotham',
                          fontSize: 16,
                          color: Color.fromARGB(205, 38, 97, 244),
                        ))),
                GestureDetector(
                  onTap: () {
                    // setState(() {
                    //   posts[index].addDislike(widget.user);
                    // });
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        top: 10, left: 10, right: 0, bottom: 10),
                    child: Icon(
                      Icons.thumb_down_alt_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  //passed time:
                  child: Text("1Y,3M,17D",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontFamily: 'Gotham',
                        fontSize: 12,
                        color: Color.fromARGB(255, 10, 203, 174),
                      )),
                ),
                Container(color: Colors.transparent, width: 8)
              ],
            )
          ]),

          Container(
            color: Colors.black45,
            height: 1,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
                color: Colors.transparent,
                margin:
                    EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
                child: Text("Comments:",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromARGB(255, 10, 177, 255),
                      fontFamily: 'Gotham',
                      fontSize: 18,
                    ))),
            Container(
              color: Colors.transparent,
              height: 1,
              width: 1,
            )
          ]),

          (commentsViewed.length > 0)
              ? Container(
                  child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  top: 10, left: 20, right: 10, bottom: 10),
                              child: CircleAvatar(
                                radius: 16,
                                backgroundColor:
                                    Color.fromARGB(255, 21, 58, 205),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 5),
                                child: Text(
                                  "u/" + widget.comments[0].getUserName(),
                                  style: TextStyle(
                                      fontFamily: 'Gotham',
                                      fontSize: 16,
                                      color: Colors.white),
                                ))
                          ],
                        ),
                        Container(
                            width: 1, height: 1, color: Colors.transparent),
                      ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Container(
                                margin: EdgeInsets.only(
                                    top: 10, left: 20, right: 10, bottom: 10),
                                child: Text(widget.comments[0].getText(),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 300,
                                    style: TextStyle(
                                        fontFamily: 'Gotham',
                                        fontSize: 18,
                                        color: Colors.white))),
                          ),
                          Container(
                              color: Colors.transparent, width: 1, height: 1),
                        ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                // setState(() {
                                //   posts[index].addLike(widget.user);
                                // });
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: 10, left: 20, right: 10, bottom: 10),
                                child: Icon(
                                  Icons.thumb_up_alt_outlined,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                            Container(
                                color: Colors.transparent,
                                child: Text(
                                    widget.comments[0].getNumLikes().toString(),
                                    style: TextStyle(
                                      fontFamily: 'Gotham',
                                      fontSize: 16,
                                      color: Color.fromARGB(205, 38, 97, 244),
                                    ))),
                            GestureDetector(
                              onTap: () {
                                // setState(() {
                                //   posts[index].addDislike(widget.user);
                                // });
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: 10, left: 10, right: 0, bottom: 10),
                                child: Icon(
                                  Icons.thumb_down_alt_outlined,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          //passed time:
                          margin: EdgeInsets.only(right: 10),
                          child: Text("1Y,3M,17D",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontFamily: 'Gotham',
                                fontSize: 12,
                                color: Color.fromARGB(255, 10, 203, 174),
                              )),
                        )
                      ],
                    )
                  ],
                ))
              : Container(
                  margin: EdgeInsets.only(top: 130),
                  child: Text("There are no comments",
                      style: TextStyle(
                          fontFamily: 'Gotham',
                          fontSize: 16,
                          color: Colors.white60)),
                ),
          // Expanded(
          //     child: Align(
          //         alignment: FractionalOffset.bottomCenter,
          //         child: ))

          /*  child: Column(
                        children: [
                          Container(child: Text("hey")),
                          Container(
                            color: Colors.black45,
                            height: 1,
                          )
                        ],

  Container(
            decoration: BoxDecoration(
              border: Border.all(
                  color: Color.fromARGB(255, 10, 203, 174), width: 1),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            margin: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Add a comment",
                hintStyle: TextStyle(
                  fontFamily: 'Gotham',
                  fontSize: 16,
                  color: Color.fromARGB(255, 10, 203, 174),
                ),
              ),
              style: TextStyle(
                fontFamily: 'Gotham',
                fontSize: 16,
                color: Color.fromARGB(255, 10, 203, 174),
              ),
            ),
          )



                      )*/
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            border:
                Border.all(color: Color.fromARGB(255, 10, 203, 174), width: 1),
            borderRadius: BorderRadius.all(Radius.circular(22)),
          ),
          margin: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: " Add a comment",
              hintStyle: TextStyle(
                fontFamily: 'Gotham',
                fontSize: 14,
                color: Color.fromARGB(204, 254, 255, 255),
              ),
            ),
            style: TextStyle(
              fontFamily: 'Gotham',
              fontSize: 16,
              color: Color.fromARGB(255, 10, 203, 174),
            ),
          ),
        ),
      ),
    );
  }
}
