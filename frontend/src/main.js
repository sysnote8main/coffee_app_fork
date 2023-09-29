import './assets/main.css'

import { createApp } from 'vue'
import App from './App.vue'
import { createRouter, createWebHashHistory } from "vue-router"
import MainComponent from "./pages/index.vue"
import InputComponent from "./pages/input.vue"
import ListComponent from "./pages/List.vue"

const routes = [
  { path: '/', component: MainComponent },
  { path: '/input', component: InputComponent },
  { path: '/list', component: ListComponent },
]

const router = createRouter({
  history: createWebHashHistory(),
  routes,
})

createApp(App).use(router).mount("#app") 