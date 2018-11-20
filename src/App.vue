<template>
 <div class="app-container">
    <!--1.顶层导航-->
    <!--<mt-header fixed title="LOVE IS ALL"></mt-header>-->
    <!--2.路由显示其他模块-->
    <router-view></router-view>
    <!--3.mui tabbar-->
    <nav class="mui-bar mui-bar-tab">
        <router-link class="mui-tab-item" to="/home">
            <span class="mui-icon mui-icon-extra mui-icon-extra-heart"></span>
            <span class="mui-tab-label">love</span>
        </router-link>
        <router-link class="mui-tab-item" to="/member">
            <span class="mui-icon mui-icon-star"></span>
            <span class="mui-tab-label">all</span>
        </router-link>
        <router-link class="mui-tab-item" to="/shop">
            <span class="mui-icon mui-icon-extra mui-icon-extra-lamp">
                <!--<span class="mui-badge">{{this.$store.getters.optCount}}</span>-->
            </span>
            <span class="mui-tab-label">world</span>
        </router-link>
        <router-link class="mui-tab-item" to="/search">
            <span class="mui-icon mui-icon-contact"></span>
            <span class="mui-tab-label">me</span>
        </router-link>
	</nav>
 </div>
</template>
<style>
   .app-container{
     padding-top:40px;
     padding-bottom:50px;
     overflow-x:hidden;
   }

 .mui-bar-tab .mui-tab-item-tao.mui-active {
    color: #007aff;
 }
.mui-bar-tab .mui-tab-item-tao {
    display: table-cell;
    overflow: hidden;
    width: 1%;
    height: 50px;
    text-align: center;
    vertical-align: middle;
    white-space: nowrap;
    text-overflow: ellipsis;
    color: #929292;
}
.mui-bar-tab .mui-tab-item-tao .mui-icon {
    top: 3px;
    width: 24px;
    height: 24px;
    padding-top: 0;
    padding-bottom: 0;
}

.mui-bar-tab .mui-tab-item-tao .mui-icon~.mui-tab-label {
   font-size:11px;
   display:block;
   overflow:hidden;
   text-overflow:ellipsis;

}
</style>
