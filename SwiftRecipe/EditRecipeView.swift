import SwiftUI

struct EditRecipeView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: RecipeViewModel
    var recipe: Recipe

    @State private var title: String
    @State private var description: String
    @State private var ingredients: String
    @State private var steps: String

    init(viewModel: RecipeViewModel, recipe: Recipe) {
        self.viewModel = viewModel
        self.recipe = recipe
        _title = State(initialValue: recipe.title)
        _description = State(initialValue: recipe.description)
        _ingredients = State(initialValue: recipe.ingredients.joined(separator: ", "))
        _steps = State(initialValue: recipe.steps.joined(separator: "\n"))
    }

    var body: some View {
        Form {
            Section(header: Text("Title")) {
                TextField("Recipe Title", text: $title)
            }
            Section(header: Text("Description")) {
                TextField("Recipe Description", text: $description)
            }
            Section(header: Text("Ingredients (comma-separated)")) {
                TextField("Ingredients", text: $ingredients)
            }
            Section(header: Text("Steps (newline-separated)")) {
                TextEditor(text: $steps)
            }
            Button("Save Changes") {
                viewModel.editRecipe(
                    recipe: recipe,
                    newTitle: title,
                    newDescription: description,
                    newIngredients: ingredients.split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces) },
                    newSteps: steps.split(separator: "\n").map { $0.trimmingCharacters(in: .whitespaces) }
                )
                presentationMode.wrappedValue.dismiss()
            }
        }
        .navigationTitle("Edit Recipe")
    }
}
