require('./bootstrap');

window.Vue = require('vue');

import 'material-design-icons-iconfont/dist/material-design-icons.css';

import Vue from 'vue';

import Vuetify from 'vuetify'

Vue.use(Vuetify);

import VueSimplemde from 'vue-simplemde';

Vue.use(VueSimplemde);

import md from 'marked';

window.md = md;

// Sweat Alert
import VueSweetalert2 from 'vue-sweetalert2';

import 'sweetalert2/dist/sweetalert2.min.css';

Vue.use(VueSweetalert2);


import User from './Helpers/User';

window.User = User;

window.EventBus = new Vue();

Vue.component('AppHome', require('./components/Includes/AppHome').default);

import router from './Router/router';


const app = new Vue({
    el: '#app',
    vuetify: new Vuetify(),
    router,
    icons: {
        iconfont: 'md',
    }
});
