import "package:flutter_menu_app/models/meal.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class FavoritesNotifier extends StateNotifier<List<Meal>> {
  FavoritesNotifier() : super([]);

  bool toggleFavorite(Meal meal) {
    if (state.contains(meal)) {
      state = state.where((element) => element.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, List<Meal>>((ref) {
  return FavoritesNotifier();
});
