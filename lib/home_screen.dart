import 'package:ai_image_app/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var sizes = ["Small", "Medium", "Large"];
  var value = ["256x256", "512x512", "1024x1024"];
  String? dropValue;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('AI Image Generator',
          style: TextStyle(fontFamily: "Poppins-Bold",
              color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                   Row(
                     children: [
                      Expanded(
                        child: Container(
                          height: 44,
                          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 4),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)
                          ),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: "eg 'Prince'",
                              border: InputBorder.none
                            ) ,),
                        ),
                      ),
                       const SizedBox(width: 12),
                       Container(
                         height: 44,
                         padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 2),
                         decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.circular(12),
                         ),
                         child: DropdownButtonHideUnderline(child: DropdownButton(
                             icon: const Icon(Icons.expand_more,color: btnColor,),
                             value: dropValue,
                             hint: const Text('Select Size'),
                             items:List.generate(
                               sizes.length,
                                   (index) => DropdownMenuItem(
                                     value: value[index],
                                     child: Text(sizes[index]), ),),
                             onChanged: (value){},
                          ),
                         ),
                       )
                     ],
                   ),
                   SizedBox(
                       width: 300,
                       height: 44,
                       child: ElevatedButton(
                         style: ElevatedButton.styleFrom(
                           backgroundColor: btnColor,
                           shape: const StadiumBorder()
                         ),
                           onPressed: (){},
                           child: const Text("Generate"))),
                 ],
                  )),
            Expanded(
              flex: 4,
                child: Container(
                  color: Colors.amber,
                )),

          ],
        ),
      ),
    );
  }
}
