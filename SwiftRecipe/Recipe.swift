import Foundation

struct Recipe: Identifiable {
    let id: UUID
    var title: String
    var description: String
    var ingredients: [String]
    var steps: [String]
    
}

class RecipeViewModel : ObservableObject {
    @Published var recipes: [Recipe] = [
        Recipe(
                   id: UUID(),
                   title: "Spaghetti Carbonara",
                   description: "A classic Italian pasta dish with a creamy, savory sauce made from eggs, cheese, pancetta, and pepper. Perfect for a quick and satisfying meal.",
                   ingredients: [
                       "400g spaghetti",
                       "4 large eggs",
                       "100g Parmesan cheese, grated",
                       "150g pancetta, diced",
                       "Freshly ground black pepper",
                       "Salt",
                       "2 tbsp olive oil"
                   ],
                   steps: [
                       "Bring a large pot of salted water to a boil and cook the spaghetti until al dente.",
                       "In a bowl, whisk together eggs and most of the Parmesan cheese. Set aside.",
                       "Heat olive oil in a pan over medium heat and cook the pancetta until crispy.",
                       "Drain the pasta, reserving some pasta water. Add spaghetti to the pan with pancetta and toss.",
                       "Remove from heat and quickly mix in the egg mixture, adding a splash of reserved pasta water to create a creamy sauce.",
                       "Season with black pepper, sprinkle with remaining Parmesan, and serve."
                   ]
               ),
               Recipe(
                   id: UUID(),
                   title: "Chicken Stir-Fry",
                   description: "A vibrant, quick, and healthy stir-fry dish loaded with tender chicken and fresh vegetables, finished with a flavorful soy-ginger sauce.",
                   ingredients: [
                       "2 chicken breasts, sliced thin",
                       "1 head of broccoli, cut into florets",
                       "1 red bell pepper, sliced",
                       "1 yellow bell pepper, sliced",
                       "3 tbsp soy sauce",
                       "2 cloves garlic, minced",
                       "1 tbsp fresh ginger, grated",
                       "2 tbsp sesame oil",
                       "1 tbsp cornstarch mixed with 2 tbsp water",
                       "Cooked rice, for serving"
                   ],
                   steps: [
                       "Heat sesame oil in a large pan or wok over medium-high heat.",
                       "Add chicken and stir-fry until golden brown. Remove from the pan and set aside.",
                       "In the same pan, add broccoli and bell peppers. Stir-fry for 2-3 minutes.",
                       "Add garlic and ginger, and stir for another minute until fragrant.",
                       "Return the chicken to the pan and pour in the soy sauce and cornstarch mixture.",
                       "Toss everything together and cook for another 2 minutes until the sauce thickens.",
                       "Serve hot over rice."
                   ]
               ),
               Recipe(
                   id: UUID(),
                   title: "Avocado Toast",
                   description: "A deliciously simple, healthy, and customizable snack or breakfast made with creamy avocado and your choice of toppings.",
                   ingredients: [
                       "2 slices of whole grain bread",
                       "1 large ripe avocado",
                       "1 tbsp lemon juice",
                       "Salt to taste",
                       "Red pepper flakes",
                       "Optional: cherry tomatoes, feta cheese, or a poached egg"
                   ],
                   steps: [
                       "Toast the bread slices until golden brown.",
                       "Cut the avocado in half, remove the pit, and scoop the flesh into a bowl.",
                       "Mash the avocado with lemon juice and a pinch of salt.",
                       "Spread the mashed avocado onto the toasted bread.",
                       "Sprinkle with red pepper flakes and top with optional ingredients like cherry tomatoes or a poached egg.",
                       "Serve immediately."
                   ]
               ),
               Recipe(
                   id: UUID(),
                   title: "Pancakes",
                   description: "Fluffy, golden pancakes made from scratch with a touch of sweetness. Perfect for breakfast and customizable with your favorite toppings.",
                   ingredients: [
                       "1 1/2 cups all-purpose flour",
                       "3 1/2 tsp baking powder",
                       "1 tsp salt",
                       "1 tbsp sugar",
                       "1 1/4 cups milk",
                       "1 egg",
                       "3 tbsp melted butter",
                       "Maple syrup and fresh fruit for serving"
                   ],
                   steps: [
                       "In a large bowl, sift together flour, baking powder, salt, and sugar.",
                       "Make a well in the center and pour in the milk, egg, and melted butter.",
                       "Mix until smooth, but do not overmix.",
                       "Heat a lightly oiled griddle or frying pan over medium-high heat.",
                       "Pour or scoop the batter onto the griddle, using approximately 1/4 cup for each pancake.",
                       "Cook until bubbles form on the surface, then flip and cook until golden brown on both sides.",
                       "Serve hot with maple syrup and fresh fruit."
                   ]
               ),
               Recipe(
                   id: UUID(),
                   title: "Caesar Salad",
                   description: "A classic Caesar salad with crisp romaine, crunchy croutons, and a creamy homemade dressing. Add grilled chicken for extra protein.",
                   ingredients: [
                       "1 head of romaine lettuce, chopped",
                       "1 cup croutons",
                       "1/2 cup grated Parmesan cheese",
                       "1/3 cup Caesar dressing",
                       "2 chicken breasts, grilled and sliced (optional)",
                       "Lemon wedges for serving"
                   ],
                   steps: [
                       "Chop the romaine lettuce and place it in a large salad bowl.",
                       "Add croutons and half of the Parmesan cheese.",
                       "Drizzle Caesar dressing over the salad and toss well to combine.",
                       "Top with grilled chicken slices if desired and the remaining Parmesan cheese.",
                       "Serve with lemon wedges for a burst of freshness."
                   ]
               )
]

        func addRecipe(recipe: Recipe) {
            recipes.append(recipe)
        }

        func deleteRecipe(at offsets: IndexSet) {
            recipes.remove(atOffsets: offsets)
        }

        func editRecipe(recipe: Recipe, newTitle: String, newDescription: String, newIngredients: [String], newSteps: [String]) {
            if let index = recipes.firstIndex(where: { $0.id == recipe.id }) {
                recipes[index].title = newTitle
                recipes[index].description = newDescription
                recipes[index].ingredients = newIngredients
                recipes[index].steps = newSteps
            }
        }
}
