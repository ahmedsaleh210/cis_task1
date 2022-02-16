
import 'package:cis_task1/modules/screen_2.dart';
import 'package:cis_task1/shared/components.dart';
import 'package:cis_task1/shared/doctors_details.dart';
import 'package:cis_task1/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  FirstScreen({Key? key}) : super(key: key);
  final search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
   return  Scaffold(
     backgroundColor: appBarColor,
      body: CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: height*0.09,
          backgroundColor: appBarColor,
          pinned: true,
          actions: [
            Row(
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.notifications)
                    ),
                    const Positioned(
                      right: 11,
                      bottom: 24,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 5,
                      ),
                    ),
                    const Positioned(
                      right: 12,
                      bottom: 25,
                      child: CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 4,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0,left: 4.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      'https://img.freepik.com/free-photo/indoor-picture-cheerful-handsome-young-man-having-folded-hands-looking-directly-smiling-sincerely-wearing-casual-clothes_176532-10257.jpg?size=626&ext=jpg&ga=GA1.2.2038481392.1638748800',
                      height: height*0.04,
                      width: width*0.1,
                    ),
                  ),
                )
              ],
            ),
          ],
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
          flexibleSpace: Stack(
            alignment: Alignment.bottomRight,
            children: const [
              FlexibleSpaceBar(

              ),
            ],
          ),
        ),
       SliverList(delegate: SliverChildListDelegate([
         ClipRRect(
           borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
           child: Container(
             color: bgColor,
             child: Column(
               children: [
                 Padding(
                   padding: EdgeInsets.symmetric(horizontal: width*0.07,vertical: height*0.03),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(
                         'Hi, Ahmed',
                         style: TextStyle(
                             fontSize: width*0.06
                         ),
                       ),
                       SizedBox(height: height*0.01,),
                       Text(
                         'Welcome Back',
                         style: TextStyle(
                             fontSize: width*0.07,
                             fontWeight: FontWeight.w800
                         ),
                       ),
                       SizedBox(height: height*0.027,),
                       Container(
                         clipBehavior: Clip.antiAliasWithSaveLayer,
                         decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.circular(5),
                             boxShadow:[
                               BoxShadow(
                                 color: Colors.grey.withOpacity(.4),
                                 blurRadius: 15.0, // soften the shadow
                                 spreadRadius: 0.0,
                                 offset: const Offset(
                                   5.0, // Move to right 10  horizontally
                                   5.0, // Move to bottom 10 Vertically
                                 ),
                               ),
                             ]
                         ),
                         child: Row(
                           children: [
                             Expanded(
                               child: Padding(
                                 padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                 child: TextFormField(
                                   keyboardType: TextInputType.text,
                                   controller: search,
                                   decoration: const InputDecoration(
                                     border: InputBorder.none,
                                     hintText: 'Search...',
                                   ),
                                   onFieldSubmitted: (value)
                                   {

                                   },
                                 ),
                               ),
                             ),
                             Container(
                               decoration: const BoxDecoration(
                                 borderRadius: BorderRadius.only(topLeft: Radius.circular(5),bottomLeft: Radius.circular(5)),),
                               child: Material(
                                 color: btnColor,
                                 child: InkWell(
                                   onTap: () {},
                                   child: const Padding(
                                     padding: EdgeInsets.all(8.0),
                                     child: Icon(
                                       Icons.search,
                                       color: Colors.white,
                                       size: 35.0,
                                     ),
                                   ),
                                 ),
                               ),
                             ),
                           ],
                         ),
                       ),
                     ],
                   ),
                 ),
                 Padding(
                   padding: EdgeInsets.symmetric(horizontal: width*0.07,vertical: height*0.016),
                   child: Row(
                     children: [
                       Text('Category',style: TextStyle(fontWeight: FontWeight.w800,fontSize: height*0.025),),
                       const Spacer(),
                       Text('See all',style: TextStyle(fontWeight: FontWeight.w800,fontSize: height*0.025,color: Colors.grey),),
                     ],
                   ),
                 ),
                 SizedBox(
                   height: height*0.16,
                   child: ListView.builder(
                       physics: const BouncingScrollPhysics(),
                       shrinkWrap: true,
                       scrollDirection: Axis.horizontal,
                       itemBuilder: (context,index) => createCategories(index, height, width),
                       itemCount: categoriesNames.length),
                 ),
                 SizedBox(height: height*0.045,),
                 Padding(
                   padding: EdgeInsets.symmetric(horizontal: width*0.07),
                   child: Column(
                     children: [
                       Row(
                         children: [
                           Text('Top rate',style: TextStyle(fontWeight: FontWeight.w800,fontSize: height*0.025),),
                           const Spacer(),
                           Text('See all',style: TextStyle(fontWeight: FontWeight.w800,fontSize: height*0.025,color: Colors.grey),),
                         ],
                       ),
                       Padding(
                         padding: EdgeInsets.symmetric(vertical: height*0.005),
                         child: ListView.separated(
                             shrinkWrap: true,
                             physics: const NeverScrollableScrollPhysics(),
                             itemBuilder: (context,index) => createDoctorItems(index, context, height, width),
                             separatorBuilder: (context,index) => SizedBox(height: height*0.02,),
                             itemCount: names.length),
                       ),
                       SizedBox(height:height*0.01),
                     ],
                   ),
                 ),
               ],
             ),
           ),
         ),
       ]))
      ],
      ),
    );
  }
}

Widget createCategories(index,height,width)
{
  return InkWell(
    onTap: () {},
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: height*0.01,vertical: height*0.01),
      child: Container(
        width: width*0.24,
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.circular(10),
            boxShadow:[
              BoxShadow(
                color: Colors.grey.withOpacity(.6),
                blurRadius: 5.0, // soften the shadow
                spreadRadius: 2.0,
                offset: const Offset(
                  2.0, // Move to right 10  horizontally
                  2.0, // Move to bottom 10 Vertically
                ),
              ),
            ]
        ),
        child: Padding(
          padding: EdgeInsets.all(height*0.0082),
          child: Column(
            children: [
              SizedBox(height: height*0.006,),
              Image.asset(
                categoriesImages[index],
                height: height*0.042,
                color: Colors.white,
                fit: BoxFit.cover,
              ),
              SizedBox(height:height*0.01),
              Text(categoriesNames[index],style: TextStyle(
                color: Colors.white,
                fontSize: width*0.025,
                fontWeight: FontWeight.w800,
              ),
              ),
              SizedBox(height:height*0.011),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.4),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${random.nextInt(30)} Doctors',style: TextStyle(
                    color: Colors.white,
                    fontSize: width*0.02,
                    fontWeight: FontWeight.w800,
                  ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget createDoctorItems(index,context,height,width){
  return Container(
    width: double.infinity,
    height: height*0.11,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow:[
          BoxShadow(
            color: Colors.grey.withOpacity(.1),
            blurRadius: 2.0, // soften the shadow
            spreadRadius: 2.2,

          ),
        ]

    ),
    child: Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          navigateTo(context, SecondScreen(names[index],types[index],images[index]));
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: height*0.014,horizontal: width/45),
          child: Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(images[index],
                    width: height*0.1,
                  ),
              ),
              SizedBox(width: width*0.04,),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(names[index],style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: width*0.04

                      ),
                      ),
                      SizedBox(height: height*0.02,),
                      Row(
                        children: [
                          Text(types[index],style:Theme.of(context).textTheme.caption?.copyWith(
                              fontSize: width*0.03
                          ),),
                          const Spacer(),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Icon(Icons.star,color: Colors.yellow,size: height*0.02),
                              ),
                              const Text('4.7'),
                            ],
                          ),
                          SizedBox(width: width*0.014,),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                child: Icon(Icons.location_on,color: Colors.yellow,size: height*0.02,),
                              ),
                              const Text('5.9km'),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
