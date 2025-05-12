import mongoose from "mongoose";

const ServiceCategorySchema = new mongoose.Schema({
    name: { type: String, required: true },
    description: { type: String, required: true },
    imageUrl: { type: String, required: true },
}, {
    timestamps: true
});

const ServiceSchema = new mongoose.Schema({
    title: { type: String, required: true },
    description: { type: String },
    category: { type: mongoose.Schema.Types.ObjectId, ref: "ServiceCategory", required: true },
    isCustom: { type: Boolean, default: false },
    addedBy: { type: mongoose.Schema.Types.ObjectId, ref: "User", required: true },
    images: [{ type: String }],
}, {
    timestamps: true
});

const ProvidersServiceSchema = new mongoose.Schema({
    userId: { type: mongoose.Schema.Types.ObjectId, ref: "User", required: true },
    serviceId: { type: mongoose.Schema.Types.ObjectId, ref: "Service", required: true },
    price: { type: Number },
    isAvailable: { type: Boolean, default: true }
}, {
    timestamps: true
});


const ServiceCategory = mongoose.model("ServiceCategory", ServiceCategorySchema);
const Service = mongoose.model("Service", ServiceSchema);
const ProvidersService = mongoose.model("ProvidersService", ProvidersServiceSchema);

export { ServiceCategory, Service, ProvidersService };
