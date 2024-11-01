import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = RecipeViewModel()
    @State private var showingAddRecipeModal = false

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.recipes) { recipe in
                    NavigationLink(destination: RecipeDetailView(viewModel: viewModel, recipe: recipe)) {
                        VStack(alignment: .leading) {
                            Text(recipe.title).font(.headline)
                            Text(recipe.description).font(.subheadline).lineLimit(1)
                        }
                    }
                }
                .onDelete(perform: viewModel.deleteRecipe)
            }
            .navigationTitle("Recipes")
            .navigationBarItems(trailing: Button(action: {
                showingAddRecipeModal = true
            }) {
                Text("Add Recipe")
            })
            .sheet(isPresented: $showingAddRecipeModal) {
                AddRecipeView(viewModel: viewModel)
            }
        }
        .padding() 
    }
}

struct RecipeDetailView: View {
    @ObservedObject var viewModel: RecipeViewModel
    var recipe: Recipe

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {

            Text(recipe.description).padding()

            Text("Ingredients").font(.headline).padding(.top)
            ForEach(recipe.ingredients, id: \.self) { ingredient in
                Text("• \(ingredient)")
            }

            Text("Steps").font(.headline).padding(.top)
            ForEach(recipe.steps, id: \.self) { step in
                Text("\(step)")
            }
        }
        .padding()
        .navigationTitle(recipe.title)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: EditRecipeView(viewModel: viewModel, recipe: recipe)) {
                    Text("Edit")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
