import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

import Login from "../components/login/Login";
import Forum from "../components/Forum/Forum";
import Question from "../components/Question/Question";
import Category from "../components/Category/Category";

const routes = [
    {path: '/login', component: Login},
    {path: '/forum', component: Forum},
    {path: '/category', component: Category},
    {path: '/question', component: Question}

]

const router = new VueRouter({
    routes,
    mode: 'history'
})

export default router;

