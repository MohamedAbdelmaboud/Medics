import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:medical_expert_app/core/componants/buttons/custom_botton.dart';
import 'package:medical_expert_app/core/componants/colors.dart';
import 'package:medical_expert_app/core/function/app_router.dart';
import 'package:medical_expert_app/features/Profile/views/widgets/custtom_content.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topRight,
                colors: [
                  kPrimary,
                  kPrimary,
                  kPrimary.withOpacity(0.7),
                ],
              ),
            ),
            height: double.maxFinite,
            width: double.maxFinite,
            child: Align(
              alignment: Alignment.topRight,
              child: Image.asset('assets/images/Group 119.png'),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(110),
              child: Container(
                height: 120,
                width: 120,
                decoration: const BoxDecoration(
                    color: kSecondary2,
                    borderRadius: BorderRadius.all(Radius.circular(90))),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(90),
                  child: CachedNetworkImage(
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                    imageUrl:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRao_0xQcdcOVK9S6UuSGjkQGy4j2uPsZ0Uug&usqp=CAU',
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: double.maxFinite,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                height: MediaQuery.of(context).size.height * 0.5,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      CusttomContent(
                        onTap: () {
                          GoRouter.of(context).push(AppRouter.kEditProfileView);
                        },
                        title: 'Edit profile',
                        icon: Icons.edit,
                      ),
                      CusttomContent(
                        onTap: () {
                          GoRouter.of(context).push(AppRouter.kFaqsView);
                        },
                        title: 'FAQs',
                        icon: Ionicons.chatbubble_ellipses_outline,
                      ),
                      CusttomContent(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.white,
                                actionsAlignment: MainAxisAlignment.spaceAround,
                                title: Center(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      height: 102,
                                      width: 102,
                                      decoration: const BoxDecoration(
                                          color: kSecondary2,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50))),
                                      child: const Icon(
                                        Icons.logout_outlined,
                                        color: kPrimary,
                                        size: 70,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Text(
                                      'Are you sure to log out of your account?',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                )),
                                actions: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40),
                                    child: CustomButton(
                                      title: 'Log Out',
                                      onPressed: () {
                                        GoRouter.of(context).pushReplacement(
                                            AppRouter.kLoginView);
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40),
                                    child: CustomButton(
                                      titleColor: kPrimary,
                                      color: Colors.transparent,
                                      title: 'Cancel',
                                      onPressed: () {
                                        GoRouter.of(context).pop();
                                      },
                                    ),
                                  )
                                ],
                              );
                            },
                          );
                        },
                        title: 'Logout',
                        icon: Ionicons.log_out_outline,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
