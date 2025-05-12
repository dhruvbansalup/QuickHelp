// models/index.js
export { default as User } from './user.model.js';
export { default as Gallery } from './serviceProviderGallery.js';

export { default as ServiceCategory } from './service.model.js';
export { default as Service } from './service.model.js';
export { default as ProvidersService } from './service.model.js';

export { default as Review } from './review.model.js';

export { default as Chat } from './chat.model.js';
export { default as Message } from './chat.model.js';

export { default as Booking } from './booking.model.js';
// No need to export address.model.js directly unless used outside schemas
