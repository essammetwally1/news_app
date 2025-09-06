import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/categories/categories_view.dart';
import 'package:news_app/components/home_drawer.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/news/view/widgets/news_view.dart';
import 'package:news_app/screens/search_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/homescreen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocus = FocusNode();

  final ValueNotifier<bool> _isSearching = ValueNotifier(false);
  final ValueNotifier<String?> _searchFor = ValueNotifier(null);
  final ValueNotifier<CategoryModel?> _selectedCategory = ValueNotifier(null);
  final ValueNotifier<bool> _showSearchScreen = ValueNotifier(false);

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocus.dispose();
    _isSearching.dispose();
    _searchFor.dispose();
    _selectedCategory.dispose();
    _showSearchScreen.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: ValueListenableBuilder<bool>(
          valueListenable: _isSearching,
          builder: (context, isSearching, _) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: isSearching
                  ? SizedBox(
                      key: const ValueKey("searchField"),
                      height: 40,
                      child: TextField(
                        controller: _searchController,
                        focusNode: _searchFocus,
                        cursorColor: AppTheme.white,
                        style: const TextStyle(
                          color: AppTheme.white,
                          fontSize: 16,
                        ),
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                          ),
                          suffixIcon: IconButton(
                            icon: SvgPicture.asset(
                              'assets/icons/search.svg',
                              colorFilter: const ColorFilter.mode(
                                AppTheme.white,
                                BlendMode.srcIn,
                              ),
                            ),

                            onPressed: () {
                              if (_searchFor.value?.isNotEmpty == true) {
                                _selectedCategory.value = CategoryModel(
                                  id: _searchFor.value!,
                                  name: _searchFor.value!,
                                  imagePath: '',
                                );
                                _showSearchScreen.value = true;
                              }
                            },
                          ),
                          hintText: 'Search...',
                          hintStyle: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(color: AppTheme.white.withAlpha(180)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: AppTheme.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: AppTheme.white,
                              width: 2,
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          _searchFor.value = value;
                          _showSearchScreen.value = value.isNotEmpty;
                          if (value.isNotEmpty) {
                            _selectedCategory.value = CategoryModel(
                              id: value,
                              name: value,
                              imagePath: '',
                            );
                          }
                        },
                      ),
                    )
                  : ValueListenableBuilder<CategoryModel?>(
                      valueListenable: _selectedCategory,
                      builder: (_, cat, __) {
                        return Text(
                          key: const ValueKey("titleText"),
                          cat?.name ?? 'Home',
                        );
                      },
                    ),
            );
          },
        ),
        actions: [
          ValueListenableBuilder<bool>(
            valueListenable: _isSearching,
            builder: (context, isSearching, _) {
              if (!isSearching) {
                return IconButton(
                  icon: SvgPicture.asset('assets/icons/search.svg'),
                  onPressed: () {
                    _isSearching.value = true;
                    _searchFocus.requestFocus();
                  },
                );
              }
              return const SizedBox.shrink();
            },
          ),
          const SizedBox(width: 16),
        ],
      ),
      drawer: HomeDrawer(goToHome: goToHome),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _closeSearch,
        child: ValueListenableBuilder<CategoryModel?>(
          valueListenable: _selectedCategory,
          builder: (context, selected, _) {
            return ValueListenableBuilder<bool>(
              valueListenable: _showSearchScreen,
              builder: (context, showSearch, __) {
                if (selected == null) {
                  return CategoriesView(onSelectCategory: onSelectCategory);
                } else if (showSearch) {
                  return SearchScreen(categoryId: selected.id);
                } else {
                  return NewsView(categoryId: selected.id);
                }
              },
            );
          },
        ),
      ),
    );
  }

  void onSelectCategory(CategoryModel category) {
    _selectedCategory.value = category;
  }

  void _closeSearch() {
    FocusScope.of(context).unfocus();
    _isSearching.value = false;
    _searchController.clear();
    _searchFor.value = null;
    _showSearchScreen.value = false;
  }

  void goToHome() {
    _closeSearch();
    _selectedCategory.value = null;
    Navigator.of(context).pop();
  }
}
