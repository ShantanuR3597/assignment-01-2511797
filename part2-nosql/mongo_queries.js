// OP1: insertMany() — insert all 3 documents from sample_documents.json

db.products.insertMany([
{
  product_id: "ELEC001",
  name: "Samsung 55-inch Smart TV",
  category: "Electronics",
  price: 65000,
  brand: "Samsung",
  specifications: {
    screen_size: "55 inches",
    resolution: "4K UHD",
    voltage: "220V"
  },
  warranty_years: 2
},

{
  product_id: "CLOTH001",
  name: "Men's Cotton Casual Shirt",
  category: "Clothing",
  price: 1200,
  brand: "Levi's",
  sizes_available: ["S","M","L","XL"],
  material: "Cotton"
},

{
  product_id: "GROC001",
  name: "Organic Almond Milk",
  category: "Groceries",
  price: 250,
  brand: "Organic Farms",
  expiry_date: ISODate("2024-12-15"),
  nutrition: {
    calories: 40,
    protein: "1g"
  }
}
]);


// OP2: find() — retrieve all Electronics products with price > 20000

db.products.find(
  { category: "Electronics", price: { $gt: 20000 } }
);


// OP3: find() — retrieve all Groceries expiring before 2025-01-01

db.products.find(
  { category: "Groceries", expiry_date: { $lt: ISODate("2025-01-01") } }
);


// OP4: updateOne() — add a "discount_percent" field to a specific product

db.products.updateOne(
  { product_id: "ELEC001" },
  { $set: { discount_percent: 10 } }
);


// OP5: createIndex() — create an index on category field

db.products.createIndex({ category: 1 });

// Creating an index on the category field improves query performance
// when filtering products by category, such as retrieving all electronics
// or groceries quickly in large product collections.
