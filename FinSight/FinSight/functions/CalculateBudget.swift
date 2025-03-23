func CalculateBudget(
    stipenAmount: Double,
    otherIncomeAmount: Double,
    rentAmount: Double,
    waterAmount: Double,
    electricityAmount: Double,
    otherExpensesAmount: Double,
    savingAmount: Double
) -> Double {
    return( (stipenAmount + otherIncomeAmount) - (rentAmount+waterAmount+electricityAmount+otherExpensesAmount+otherExpensesAmount+savingAmount)
)}
