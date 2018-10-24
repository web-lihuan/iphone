import Vue from 'vue'
import Router from 'vue-router'
import HelloContainer from "./components/HelloWorld.vue"
//src/router.js 配置组件访问路由
//1.引入自定义组件
import HomeContainer from "./components/tabbar/HomeContainer"
import NewsContainer from "./components/news/NewsContainer"
import SearchContainer from "./components/tabbar/SearchContainer"
import ShopContainer from "./components/tabbar/ShopContainer"
import MemberContainer from "./components/tabbar/MemberContainer"
import NewsDetailContainer from "./components/news/NewsDetailContainer"
import GoodList from "./components/goods/GoodList"
import GoodsInfo from "./components/goods/GoodsInfo"
import MovieContainer from "./components/movie/MovieContainer"
import MovieDetailContainer from "./components/movie/MovieDetailContainer"
import MusicContainer from "./components/music/MusicContainer"
Vue.use(Router)
//2.指定该组件的访问路径
export default new Router({
  routes: [
    {path:'/',redirect:"/home"},
    {path:'/home',component:HomeContainer},
    {path:'/home/newslist',component:NewsContainer},
    {path:'/home/goodslist',component:GoodList},
    {path:'/home/goodsinfo/:id',component:GoodsInfo,name:"goodsinfo"},
    {path:'/shop',component:ShopContainer},
    {path:'/member',component:MemberContainer},
    {path:'/search',component:SearchContainer},
    {path:'/newsdetail/:id',component:NewsDetailContainer},
    {path:'/movie',component:MovieContainer},
    {path:'/moviedetail',component:MovieDetailContainer},
    {path:'/music',component:MusicContainer},
  ],
  linkActiveClass:"mui-active"
})
