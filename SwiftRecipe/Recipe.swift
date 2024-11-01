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
        description: "A classic Italian pasta dish with a creamy sauce.",
        ingredients: [
            "Spaghetti",
            "Eggs",
            "Parmesan cheese",
            "Pancetta",
            "Black pepper"
        ],
        steps: [
            "Cook the spaghetti.",
            "Fry the pancetta until crispy.",
            "Mix eggs and Parmesan cheese in a bowl.",
            "Combine spaghetti with pancetta and egg mixture.",
            "Season with black pepper and serve."
        ]
    ),
    Recipe(
        id: UUID(),
        title: "Chicken Stir-Fry",
        description: "A quick and healthy chicken dish with vegetables.",
        ingredients: [
            "Chicken breast",
            "Broccoli",
            "Bell peppers",
            "Soy sauce",
            "Garlic",
            "Ginger"
        ],
        steps: [
            "Slice chicken and vegetables.",
            "Stir-fry chicken until cooked through.",
            "Add garlic and ginger, then stir-fry vegetables.",
            "Mix with soy sauce and serve."
        ]
    ),
    Recipe(
        id: UUID(),
        title: "Avocado Toast",
        description: "A simple yet tasty breakfast or snack.",
        ingredients: [
            "Bread",
            "Avocado",
            "Lemon juice",
            "Salt",
            "Red pepper flakes"
        ],
        steps: [
            "Toast the bread.",
            "Mash avocado and mix with lemon juice and salt.",
            "Spread avocado on toast and sprinkle with red pepper flakes."
        ]
    ),
    Recipe(
        id: UUID(),
        title: "Pancakes",
        description: "Fluffy pancakes perfect for breakfast.",
        ingredients: [
            "Flour",
            "Baking powder",
            "Milk",
            "Eggs",
            "Sugar",
            "Butter"
        ],
        steps: [
            "Mix flour, baking powder, and sugar.",
            "Whisk eggs and milk, then combine with dry ingredients.",
            "Cook on a hot griddle until golden brown.",
            "Serve with butter and syrup."
        ]
    ),
    Recipe(
        id: UUID(),
        title: "Caesar Salad",
        description: "A popular salad with a creamy dressing.",
        ingredients: [
            "Romaine lettuce",
            "Croutons",
            "Parmesan cheese",
            "Caesar dressing",
            "Grilled chicken (optional)"
        ],
        steps: [
            "Chop lettuce and add to a bowl.",
            "Mix with croutons, Parmesan cheese, and Caesar dressing.",
            "Add grilled chicken if desired and serve."
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
