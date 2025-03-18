func getLabelById(id: String) -> String? {
    // Mencari elemen berdasarkan id
    if let category = arrayExpensesCategory.first(where: { $0.id == id }) {
        return category.label
    } else {
        return nil  // Jika tidak ditemukan
    }
}
