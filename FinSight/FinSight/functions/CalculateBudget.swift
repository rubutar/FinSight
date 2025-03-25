func CalculateBudget(
    stipenAmount: Double,
    otherIncomeAmount: Double,
    rentAmount: Double,
    savingAmount: Double
) -> Double {
    return( (stipenAmount + otherIncomeAmount) - (rentAmount+savingAmount)
)}

func CalculateDetail(for percentage: Double, budget: Double) -> Double {
    return budget * percentage
}
