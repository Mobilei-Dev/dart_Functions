import 'dart:math';

void main() {
  // Sample cart with item prices
  List<double> cartItems = [5.99, 12.50, 20.00, 7.99, 15.00, 30.00];

  print("🛒 Original Cart Items: $cartItems");

  // Step 1: Filter out items below $10 (using anonymous function)
  List<double> filteredCart = cartItems.where((price) => price >= 10).toList();
  print("✅ Filtered Items (\$10+): $filteredCart");

  // Step 2: Apply discount (using higher-order function)
  List<double> discountedCart = applyDiscount(filteredCart, 10); // 10% discount
  print("💸 After 10% Discount: $discountedCart");

  // Step 3: Calculate total with optional tax (e.g., 8%)
  double total = calculateTotal(discountedCart, taxRate: 0.08);
  print("🧾 Total with Tax: \$${total.toStringAsFixed(2)}");

  // Step 4: Apply extra factorial discount
  int itemCount = discountedCart.length;
  double factorialDisc = factorial(itemCount).toDouble();
  double finalPrice = max(total - factorialDisc, 0); // Ensure no negative price

  print("🎯 Final Price after \$${factorialDisc.toStringAsFixed(2)} factorial discount: \$${finalPrice.toStringAsFixed(2)}");
}

// Higher-order function to apply a discount
List<double> applyDiscount(List<double> items, double discountPercent) {
  return items.map((price) => price * (1 - discountPercent / 100)).toList();
}

// Recursive function to calculate factorial
int factorial(int n) {
  if (n <= 1) return 1;
  return n * factorial(n - 1);
}

// Function to calculate total with optional tax
double calculateTotal(List<double> items, {double taxRate = 0.0}) {
  double subtotal = items.fold(0, (sum, item) => sum + item);
  return subtotal * (1 + taxRate);
}
