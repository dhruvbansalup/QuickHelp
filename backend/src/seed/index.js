import dotenv from 'dotenv';
dotenv.config();


import seedServiceCategories from "./serviceCategorySeed.js";

// Run the seed functions
seedServiceCategories().catch(console.error);