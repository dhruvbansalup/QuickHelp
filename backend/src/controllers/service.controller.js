
import asyncErrorHandler from "../utils/asyncErrorHandler.js";

//Models Import
import { ServiceCategory } from "../models/index.js";


const listServiceCategories = asyncErrorHandler(async (_req, res, _next) => {
    const categories = await ServiceCategory.find();
    categories = categories.map((category) => {
        return {
            id: category._id,
            name: category.name,
            image: category.image,
        };
    });
    categories.sort((a, b) => a.name.localeCompare(b.name));
    res.status(200).json({ categories });
});



const serviceControllers = {
    listServiceCategories
}

export default serviceControllers;