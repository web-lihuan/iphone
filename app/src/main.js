import Vue from 'vue'
import App from './App.vue'
import router from './router'

import 'mint-ui/lib/style.css'
Vue.config.productionTip = false
//5: 设置请求的根路径 
//Vue.http.options.root = "http://127.0.0.1/vue_ser/";
//6:全局设置post 时候表音的数据组织格式为 application/x-www-form-urlencoded
//Vue.http.options.emulateJSON = true;
// 导入 MUI 的样式表， 和 Bootstrap 用法没有差别
import './lib/mui/css/mui.css'
// 导入 MUI 的样式表，扩展图标样式，购物车图标
// 还需要加载图标字体文件
import './lib/mui/css/icons-extra.css'

import Mint from 'mint-ui';

Vue.use(Mint);
//main.js
//1.引入Header组件
import {Header,Swipe,SwipeItem,Button} from "mint-ui";
import { Navbar, TabItem } from 'mint-ui';
Vue.component(Navbar.name, Navbar);
Vue.component(TabItem.name, TabItem);

import { Loadmore } from 'mint-ui';
Vue.component(Loadmore.name, Loadmore);

import { Search } from 'mint-ui';
Vue.component(Search.name, Search);

//2.注册Header组件
//           标签名        组件对象
Vue.component(Header.name,Header);
Vue.component(Swipe.name,Swipe);
Vue.component(SwipeItem.name,SwipeItem);
Vue.component(Button.name,Button);
//3.引入VueResource
import VueResource from "vue-resource"
//4.加载(注册)VueResource
Vue.use(VueResource)
//5.定义全局(日期格式)的过滤器
//两种方式：1.第三方模块 moment 过滤器日期2.自定义
//dataFormat 过滤器名称  datastr用户日期
Vue.filter("dataFormat",function(datastr,pattern="YYYY-MM-DD"){
  return new Date(datastr).toLocaleString();
})
Vue.filter("dataLoad",function(datastr,pattern="YYYY/MM/DD"){
  return new Date(datastr).toLocaleDateString();
})
//6.设置全局ajax访问基础路径
Vue.http.options.root="http://127.0.0.1:3000/"
//7.设置全局ajax post 访问格式
Vue.http.options.emulateJSON = true;
new Vue({
  router,
  render: h => h(App)
}).$mount('#app')
