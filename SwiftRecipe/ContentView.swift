import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = RecipeViewModel()
    @State private var showingAddRecipeModal = false

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.recipes) { recipe in
                    NavigationLink(destination: RecipeDetailView(viewModel: viewModel, recipe: recipe)) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(recipe.title)
                                .font(.headline)
                            Text(recipe.description)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .lineLimit(1)
                        }
                        .padding(8)
                    }
                }
                .onDelete(perform: viewModel.deleteRecipe)
            }
            .listStyle(PlainListStyle())
            .background(Color.clear)
            .navigationTitle("Recipes")
            .foregroundColor(.purple)
            .navigationBarItems(trailing: Button(action: {
                showingAddRecipeModal = true
            }) {
                Image(systemName: "plus")
                    .font(.title2)
                    .foregroundColor(.purple)
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
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(recipe.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.purple)
                    .padding(.bottom, 8)

                Text(recipe.description)
                    .font(.body)
                    .italic()
                    .foregroundColor(.secondary)
                    .padding(.bottom, 16)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Ingredients")
                        .font(.headline)
                        .foregroundColor(.purple)
                        .padding(.bottom, 4)

                    ForEach(recipe.ingredients, id: \.self) { ingredient in
                        Text(". \(ingredient)")
                            .padding(.leading, 8)
                            }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(UIColor.systemGroupedBackground))
                )


                VStack(alignment: .leading, spacing: 8) {
                    Text("Steps")
                        .font(.headline)
                        .foregroundColor(.purple)
                        .padding(.bottom, 4)

                    ForEach(recipe.steps, id: \.self) { step in
                        Text(step)
                            .padding(8)
                            .foregroundColor(.primary)
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(UIColor.systemGroupedBackground))
                )
            }
            .padding(.horizontal)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: EditRecipeView(viewModel: viewModel, recipe: recipe)) {
                    Image(systemName: "pencil")
                        .font(.title2)
                        .foregroundColor(.purple)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
