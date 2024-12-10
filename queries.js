// More work would need to be done to vectorize queries but
// this is a simple example of how it could be done.
db.hydrocarbons.find({
    vector_representation: [ 0.12, 0.34, 0.56, 0.78]
});

// Unique identifier for each molecule
db.hydrocarbons.find({ "structure.smile": "CC" });

// find all metals with a density greater than 4
db.metals.find({
    "properties.density": { $gt: 4 }
});

// find all noble gases
db.elements.find({
    category: "Noble Gas"
});

// gives a count of elements by category
db.elements.aggregate([
    { $group: { _id: "$category", count: { $sum: 1 } } }
]);