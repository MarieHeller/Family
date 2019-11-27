import "bootstrap";
import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!
// CSS
import 'mapbox-gl/dist/mapbox-gl.css';
// internal imports
import { initMapbox } from '../plugins/init_mapbox';

initMapbox();

flatpickr(".datepicker", {})

import { initStarRating } from '../plugins/init_star_rating';

initStarRating();
