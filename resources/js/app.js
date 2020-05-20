require('./bootstrap');

window.Vue = require('vue');

import Vue from 'vue';

import Vuetify from 'vuetify';

Vue.use(Vuetify);

import User from './Helpers/User';

window.User = User;
console.log(User.userId());
//User.logout();

Vue.component('AppHome', require('./components/AppHome').default);

import router from './Router/router';


const app = new Vue({
    el: '#app',
    vuetify: new Vuetify(),
    router
});
