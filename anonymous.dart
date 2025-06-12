void main() {
  // 🛒 Step 1: Original cart with item prices
  List<double> cart = [5.0, 12.5, 20.0, 9.99, 50.0];

  print("🛍️ Original Cart: $cart");

  // 🧹 Step 2: Filter out items < $10 using anonymous function
  cart = cart.where((item) => item >= 10).toList();
  print("✅ Filtered Cart (≥ \$10): $cart");

  // 💸 Step 3: Apply discount using higher-order function
  List<double> applyDiscount(List<double> items, double discountPercent) {
    return items.map((price) => price - (price * discountPercent / 100)).toList();
  }

  cart = applyDiscount(cart, 10); // 10% discount
  print("💸 After 10% Discount: $cart");

  // 🧾 Step 4: Calculate total with optional tax
  double calculateTotal(List<double> items, {double taxPercent = 0}) {
    double subtotal = items.reduce((a, b) => a + b);
    double tax = subtotal * (taxPercent / 100);
    return subtotal + tax;
  }

  double total = calculateTotal(cart, taxPercent: 8); // 8% tax
  print("🧾 Total with 8% Tax: \$${total.toStringAsFixed(2)}");

  // 🎲 Step 5: Factorial discount using recursion
  int factorial(int n) => (n <= 1) ? 1 : n * factorial(n - 1);

  int itemCount = cart.length;
  int discountFactor = factorial(itemCount);
  double discountAmount = total * (discountFactor / 100);
  double finalTotal = total - discountAmount;

  print("🎁 Factorial Discount (${discountFactor}%): -\$${discountAmount.toStringAsFixed(2)}");
  print("💰 Final Price: \$${finalTotal.toStringAsFixed(2)}");
}

