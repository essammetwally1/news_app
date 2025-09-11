import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/shared/app_theme.dart';
import 'package:news_app/models/language_model.dart';

class HomeDrawer extends StatefulWidget {
  final VoidCallback goToHome;
  const HomeDrawer({super.key, required this.goToHome});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  final List<Language> languages = [
    Language(code: 'en', name: 'English'),
    Language(code: 'ar', name: 'العربية'),
  ];

  String menuValue = 'en';
  bool isActiveSwitch = true;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Container(
        width: MediaQuery.sizeOf(context).width * .85,
        decoration: BoxDecoration(color: AppTheme.black),
        child: Column(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * .2,
              width: double.infinity,
              color: AppTheme.white,
              child: Center(
                child: Text(
                  'News App',
                  style: textTheme.titleLarge!.copyWith(
                    color: AppTheme.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
              child: Column(
                children: [
                  InkWell(
                    onTap: widget.goToHome,
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/icons/home.svg'),
                        SizedBox(width: 8),
                        Text(
                          'Go To Home',
                          style: textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),

                  Divider(
                    indent: 16,
                    color: AppTheme.white,
                    thickness: 2,
                    endIndent: 16,
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/theme.svg'),
                      SizedBox(width: 8),
                      Text(
                        'Theme',
                        style: textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Switch(
                        activeTrackColor: const Color.fromARGB(255, 61, 55, 55),
                        inactiveTrackColor: AppTheme.black,
                        value: isActiveSwitch,
                        onChanged: (_) {
                          setState(() {
                            isActiveSwitch = !isActiveSwitch;
                          });
                        },
                      ),
                    ],
                  ),

                  SizedBox(height: 16),
                  Divider(
                    indent: 16,
                    color: AppTheme.white,
                    thickness: 2,
                    endIndent: 16,
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/language.svg'),
                      SizedBox(width: 8),
                      Text(
                        'Language',
                        style: textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  DropdownButton(
                    value: menuValue,
                    borderRadius: BorderRadius.circular(16),
                    dropdownColor: AppTheme.black,

                    iconEnabledColor: AppTheme.white,

                    isExpanded: true,
                    underline: SizedBox(),
                    iconSize: 30,
                    items: languages
                        .map(
                          (element) => DropdownMenuItem(
                            value: element.code,
                            child: Row(
                              children: [
                                Text(
                                  element.name,
                                  style: Theme.of(context).textTheme.titleLarge!
                                      .copyWith(
                                        color: AppTheme.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (menuValue != value) {
                        setState(() {
                          menuValue = value!;
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
