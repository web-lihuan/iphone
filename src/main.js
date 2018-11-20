import Vue from 'vue'
import App from './App.vue'
import router from './router'
import axios from 'axios'
axios.defaults.withCredentials=true;//让axios随身携带认证信息过去
Vue.config.productionTip = false

//粒子
import VueParticles from 'vue-particles'
Vue.use(VueParticles)

//小图标
import './lib/mui/css/iconfont.css'

import 'mint-ui/lib/style.css'

// 导入 MUI 的样式表， 和 Bootstrap 用法没有差别
import './lib/mui/css/mui.css'
// 导入 MUI 的样式表，扩展图标样式，购物车图标
import './lib/mui/js/jquery-3.2.1'
// 还需要加载图标字体文件
import './lib/mui/css/icons-extra.css'
import Mint from 'mint-ui'
//滑动引入
import vuescroll from 'vuescroll';
Vue.use(vuescroll)
import 'vuescroll/dist/vuescroll.css';
//引入购物车公共
import Vuex from "vuex"   //引入Vuex组件
Vue.use(Vuex);    //注册组件中所有的内容
//创建Vuex对象：共享数据，操作方法，获取并监听数据方法
var store=new Vuex.Store({
  state:{       //共享数据
    carPanelData:[],
    cartCount:0   //共享数据购物车中数量
  },
  mutations:{   //操作共享数据方法
    increment(state,num){state.cartCount+=num},
    substract(state){state.cartCount--},
    clearcount(state){state.cartCount=0},
    addCarpanelData(state,data){
      //cart 是判断购物车是否增加过 
      let cart=true
      state.carPanelData.forEach(goods=>{
        if(goods.id===data.id){
          goods.count++
          cart=false
        }
      })
      if(cart){
        let goodsData=data
        Vue.set(goodsData,'count',1)  //对象 变量 数量
        state.carPanelData.unshift(goodsData)
      }
      //console.log(state.carPanelData)
    }
  },
  //异步操作放在actions中
  getters:{   //获取并监听数据方法
    optCount:function(state){
      return state.cartCount; 
    }
  }
});
Vue.use(Mint);
//main.js
//1.引入Header组件
import {Header,Swipe,SwipeItem,Button} from "mint-ui";
import { Navbar, TabItem } from 'mint-ui';
Vue.component(Navbar.name, Navbar);
Vue.component(TabItem.name, TabItem);
import { TabContainer, TabContainerItem } from 'mint-ui';
Vue.component(TabContainer.name, TabContainer);
Vue.component(TabContainerItem.name, TabContainerItem);

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
  render: h => h(App),
  store //将Vuex对象注册在vue对象中
}).$mount('#app')
