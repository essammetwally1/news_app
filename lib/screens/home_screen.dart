import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/categories/categories_view.dart';
import 'package:news_app/components/home_drawer.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/news/news_view.dart';
import 'package:news_app/screens/search_screnn.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/homescreen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryModel? selectedCategory;
  String? searchFor;
  bool _isSearching = false;
  bool searchScreen = false;
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          title: _isSearching
              ? TextField(
                  controller: _searchController,
                  focusNode: _searchFocus,
                  cursorColor: AppTheme.white,
                  style: const TextStyle(color: AppTheme.white, fontSize: 16),
                  decoration: InputDecoration(
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(10),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        onTap: () {
                          if (searchFor != null) {
                            selectedCategory = CategoryModel(
                              id: searchFor!,
                              name: searchFor!,
                              imagePath: '',
                            );
                            searchScreen = true;
                            setState(() {});
                          }
                        },
                        child: SvgPicture.asset('assets/icons/search.svg'),
                      ),
                    ),
                    hintText: 'Search...',
                    hintStyle: Theme.of(context).textTheme.titleMedium
                        ?.copyWith(color: AppTheme.white.withValues(alpha: .7)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: AppTheme.white,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: AppTheme.white,
                        width: 2,
                      ),
                    ),
                  ),
                  onTapOutside: (PointerDownEvent event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                    _searchController.clear();
                    _isSearching = false;
                    searchFor = null;
                  },
                  onChanged: (value) {
                    searchFor = value;
                  },
                )
              : Text(
                  selectedCategory == null ? 'Home' : selectedCategory!.name,
                ),
          actions: [
            !_isSearching
                ? IconButton(
                    icon: SvgPicture.asset('assets/icons/search.svg'),
                    onPressed: () {
                      setState(() {
                        _isSearching = true;
                      });
                    },
                  )
                : SizedBox(),
            const SizedBox(width: 16),
          ],
        ),
        drawer: HomeDrawer(goToHome: goToHome),
        body: selectedCategory == null
            ? CategoriesView(onSelectCategory: onSelectCategory)
            : searchScreen
            ? SearchScreen(categoryId: selectedCategory!.id)
            : NewsView(categoryId: selectedCategory!.id),
      ),
    );
  }

  void onSelectCategory(CategoryModel category) {
    selectedCategory = category;
    setState(() {});
  }

  void goToHome() {
    if (selectedCategory == null) {
      Navigator.of(context).pop();
    } else {
      selectedCategory = null;
      Navigator.of(context).pop();
      setState(() {});
    }
  }
}
