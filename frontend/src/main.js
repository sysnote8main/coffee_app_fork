import './assets/main.css'

import { createApp } from 'vue'
import App from './App.vue'
import { createRouter, createWebHashHistory } from "vue-router"
import ListComponent from "./pages/List.vue"
import BeansComponent from "./pages/Beans.vue"

const routes = [
  { path: '/', component: ListComponent },
  { path: '/beans/:id', component: BeansComponent, props: route => ({ beanId: route.params.id })},
  { path: '/beans', component: BeansComponent },
]

const router = createRouter({
  history: createWebHashHistory(),
  routes,
})

createApp(App).use(router).mount("#app") 