import 'package:falack_app/core/navigation/navigation.dart';
import 'package:falack_app/features/interests/presentation/screen/selected_intreset_label.dart';
import 'package:falack_app/features/interests/presentation/widgets/category_tile.dart';
import 'package:falack_app/shared/button/filled_button_factory.dart';
import 'package:falack_app/shared/text_from_feaild/text_form_feild.dart';
import 'package:flutter/material.dart';

class InterestScreen extends StatefulWidget {
  const InterestScreen({super.key});

  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  String? selectedMainCategory; // Selected main category
  List<String> selectedSecondaryCategories =
      []; // Selected secondary categories
  bool allowSecondarySelection = false; // Flag to allow secondary selection

  final List<Map<String, String>> categories = [
    {'title': 'Arts & Entertainment', 'icon': '🎨'},
    {'title': 'Business & Finance', 'icon': '💼'},
    {'title': 'Computers & Technology', 'icon': '🖥️'},
    {'title': 'Education', 'icon': '📚'},
    {'title': 'Food & Drink', 'icon': '🍔'},
    {'title': 'Health & Fitness', 'icon': '💪'},
    {'title': 'Home & Garden', 'icon': '🏠'},
    {'title': 'Lifestyle', 'icon': '🧘‍♂️'},
    {'title': 'Manufacturing & Industry', 'icon': '🏭'},
    {'title': 'Media & Communications', 'icon': '🎥'},
    {'title': 'Science & Technology', 'icon': '🔬'},
    {'title': 'Society & Culture', 'icon': '👐'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent.withOpacity(1),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.scrim,
              Theme.of(context).colorScheme.scrim,
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.scrim,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Pick your main category',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              'to score points and unlock badges',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            const SizedBox(height: 20),
            const TextF(
              prefixIcon: Icon(Icons.search),
              hintText: 'Search for interests',
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  final category = categories[index];
                  final isMainSelected =
                      selectedMainCategory == category['title'];
                  final isSecondarySelected =
                      selectedSecondaryCategories.contains(category['title']);

                  return CategoryTile(
                    icon: category['icon']!,
                    title: category['title']!,
                    isMainSelected: isMainSelected,
                    isSecondarySelected: isSecondarySelected,
                    onTap: () {
                      if (!allowSecondarySelection) {
                        // Toggle main category before pressing "Next"
                        setState(() {
                          if (isMainSelected) {
                            selectedMainCategory =
                                null; // Deselect main category
                          } else {
                            selectedMainCategory =
                                category['title']; // Select main category
                          }
                        });
                      } else if (selectedMainCategory != category['title']) {
                        // Select or deselect secondary categories, limit to 3
                        setState(() {
                          if (isSecondarySelected) {
                            selectedSecondaryCategories
                                .remove(category['title']);
                          } else if (selectedSecondaryCategories.length < 3) {
                            selectedSecondaryCategories.add(category['title']!);
                          }
                        });
                      }
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            FilledButtonWidget(
          
              title: allowSecondarySelection ? "Finish" : "Next",
              onPressed: () {
                if (selectedMainCategory != null && !allowSecondarySelection) {
                  // User has selected a main category and pressed Next, allow secondary selection
                  setState(() {
                    allowSecondarySelection = true;
                  });
                } else if (allowSecondarySelection) {
                  // Submit selected categories
                  print('Main category: $selectedMainCategory');
                  print(
                      'Selected secondary categories: $selectedSecondaryCategories');
                  context.navigateTo(const SelectedIntresetLabel());
                }
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
