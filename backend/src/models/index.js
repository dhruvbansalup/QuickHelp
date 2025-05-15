// models/index.js
import User from './user.model.js';
import Gallery from './serviceProviderGallery.js';
import { ServiceCategory, Service, ProvidersService } from './service.model.js';
import Review from './review.model.js';
import { Chat, Message } from './chat.model.js';
import Booking from './booking.model.js';

export {
    User,
    Gallery,
    ServiceCategory,
    Service,
    ProvidersService,
    Review,
    Chat,
    Message,
    Booking
}