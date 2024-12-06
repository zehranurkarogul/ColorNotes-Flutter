import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 4, 4, 68),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  width: 150,
                  height: 150,
                  child: Image.asset(
                    'assets/images/logo.webp',
                    fit: BoxFit.contain,
                  ),
                ),
                
                const SizedBox(height: 30),

                InkWell(
                  onTap: () {
                    context.go("/home");
                  },
                  child: SizedBox(
                    width: 300,
                    child: DotLottieLoader.fromAsset(
                      "assets/motions/loading.lottie",
                      frameBuilder: (BuildContext ctx, DotLottie? dotlottie) {
                        if (dotlottie != null) {
                          return Lottie.memory(dotlottie.animations.values.single);
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                ),

                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
