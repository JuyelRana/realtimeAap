import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

import Login from "../components/login/Login";
import Forum from "../components/Forum/Forum";
import CreateQuestion from "../components/Question/CreateQuestion";
import Category from "../components/Category/Category";
import Signup from "../components/login/Signup";
import Logout from "../components/login/Logout";
import Read from "../components/Forum/Read";

const routes = [
    {path: '/login', component: Login},
    {path: '/forum', component: Forum, name: 'forum'},
    {path: '/questions/:slug', component: Read, name: 'read'},
    {path: '/category', component: Category},
    {path: '/create-question', component: CreateQuestion},
    {path: '/signup', component: Signup},
    {path: '/logout', component: Logout},

]

const router = new VueRouter({
    routes,
    mode: 'history'
})


export default router;

