import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:Tiwee/business_logic/provider/languageProvider.dart';
import 'package:Tiwee/core/consts.dart';
import 'package:Tiwee/presentation/screens/home/language_list.dart';
import 'package:lottie/lottie.dart';

class Language extends ConsumerWidget {
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final country = ref.watch(languageProvider);
    return Scaffold(
      body: country.when(
        data: (data) {
          kLanguages.sort((a,b)=>a.toString().compareTo(b.toString()));
          print(data);
          return ListView.builder(

            itemCount: data.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LanguageList(channels: data[kLanguages[index]]??[],),)),
              child: ListTile(
                title: Text(kLanguages[index]),
              ),
            ),
          );
        },
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => Center(
            child: SizedBox(
                width: width / 3,
                child: Lottie.asset(
                  kLoading,
                  width: 100,
                ))),
      ));
  }
}
