import 'package:ai_image_app/api_services.dart';
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
  var textController = TextEditingController();
  String image = '';
  var isLoaded = false;

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
                      SingleChildScrollView(
                        child: Container(
                          height: 44,
                          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 4),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)
                          ),
                          child: TextFormField(
                            controller: textController,
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
                         child: DropdownButtonHideUnderline(
                           child: DropdownButton(
                             icon: const Icon(Icons.expand_more,color: btnColor,),
                             value: dropValue,
                             hint: const Text('Select Size'),
                             items:List.generate(
                               sizes.length,
                                   (index) => DropdownMenuItem(
                                     value: value[index],
                                     child: Text(sizes[index]), ),),
                             onChanged: (value){
                               setState(() {
                                 dropValue = value.toString();
                               });
                             },
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
                           onPressed: () async {
                           if (textController.text.isNotEmpty && dropValue!.isNotEmpty){
                             setState(() {
                               isLoaded = false;
                             });
                             image = await Api.generateImage(textController.text, dropValue!);
                             setState(() {
                               isLoaded = true;
                             });
                            }else{
                             ScaffoldMessenger.of(context).showSnackBar(
                                 const SnackBar(
                                     content: Text("Please enter the text and size"),),);
                             }
                           },
                           child: const Text("Generate"))),
                 ],
                  )),
            Expanded(
              flex: 4,
                child: isLoaded
                    ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                           clipBehavior: Clip.antiAlias,
                           decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(12),
                         ),
                        child: Image.network(image, fit: BoxFit.contain,
                        ),
                ),
                        const SizedBox(height: 12,),

                        Row(children: [
                          Expanded(child: ElevatedButton.icon(
                            icon: const Icon(Icons.download_for_offline_rounded),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(8),
                              backgroundColor: btnColor,
                            ),
                            onPressed: (){},
                            label: const Text("Download"),
                            ),
                          ),
                          const SizedBox(width: 12,),
                          ElevatedButton.icon(
                          icon: const Icon(Icons.share),
                          style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(8),
                          backgroundColor: btnColor,
                          ),
                          onPressed: (){},
                          label: const Text("Share"),
                          ),
                        ],
                        )
                      ],
                    )
                    : Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/loader.gif"),
                      const SizedBox(height: 12,),
                      const Text("Image is been generated...",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),)
                    ],
                  ),
                ),),

          ],
        ),
      ),
    );
  }
}
