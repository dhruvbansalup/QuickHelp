import connectDB from '../config/db.js';
import { ServiceCategory } from "../models/index.js";

const categories = [
    { name: "Plumbing" },
    { name: "Electrical" },
    { name: "Cleaning" },
];

async function seedServiceCategories() {
    connectDB();

    await ServiceCategory.deleteMany({});
    await ServiceCategory.insertMany(categories);
    console.log("Service categories seeded!");
}

export default seedServiceCategories;

