import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

import Login from "../components/login/Login";
import Forum from "../components/Forum/Forum";
import Question from "../components/Question/Question";
import Category from "../components/Category/Category";
import Signup from "../components/login/Signup";
import Logout from "../components/login/Logout";

const routes = [
    {path: '/login', component: Login},
    {path: '/forum', component: Forum, name: 'forum'},
    {path: '/category', component: Category},
    {path: '/question', component: Question},
    {path: '/signup', component: Signup},
    {path: '/logout', component: Logout},

]

const router = new VueRouter({
    routes,
    mode: 'history'
})

export default router;

