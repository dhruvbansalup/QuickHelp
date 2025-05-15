
import asyncErrorHandler from "../utils/asyncErrorHandler.js";

//Models Import
import { ServiceCategory } from "../models/index.js";


const listServiceCategories = asyncErrorHandler(async (_req, res, _next) => {
    const categories = await ServiceCategory.find();
    categories.sort((a, b) => a.name.localeCompare(b.name));
    const categoriesOnlyNames = categories.map(category => category.name);
    res.status(200).json({ categories: categoriesOnlyNames });
});



const serviceControllers = {
    listServiceCategories
}

export default serviceControllers;