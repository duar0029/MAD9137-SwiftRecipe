import SwiftUI

struct AddRecipeView: View {
    @ObservedObject var viewModel: RecipeViewModel
    @Environment(\.presentationMode) var presentationMode

    @State private var title: String = ""
    @State private var description: String = ""
    @State private var ingredients: [String] = [""]
    @State private var steps: [String] = [""]

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Recipe Details")) {
                    TextField("Title", text: $title)
                    TextField("Description", text: $description)
                }

                Section(header: Text("Ingredients")) {
                    ForEach(0..<ingredients.count, id: \.self) { index in
                        TextField("Ingredient", text: $ingredients[index])
                    }
                    Button(action: {
                        ingredients.append("")
                    }) {
                        Text("Add Ingredient")
                    }
                }

                Section(header: Text("Steps")) {
                    ForEach(0..<steps.count, id: \.self) { index in
                        TextField("Step", text: $steps[index])
                    }
                    Button(action: {
                        steps.append("")
                    }) {
                        Text("Add Step")
                    }
                }
            }
            .navigationTitle("Add Recipe")
            .navigationBarItems(leading: Button("Cancel") { presentationMode.wrappedValue.dismiss() })
            .navigationBarItems(trailing: Button("Save") {
                let newRecipe = Recipe(id: UUID(), title: title, description: description, ingredients: ingredients, steps: steps)
                viewModel.addRecipe(recipe: newRecipe)
                presentationMode.wrappedValue.dismiss() 
            })
        }
    }
}

