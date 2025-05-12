const AddressSchema = new mongoose.Schema({
  label: { type: String, required: true }, // e.g., "Home", "Office"
  houseNo: { type: String },
  landmark: { type: String },
  street: { type: String, required: true },
  city: { type: String, required: true },
  state: { type: String, required: true },
  pincode: { type: String, required: true },
  latitude: { type: Number, required: true },
  longitude: { type: Number, required: true },
  isDefault: { type: Boolean, default: false }
});

export default AddressSchema;