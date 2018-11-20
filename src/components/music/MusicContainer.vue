<template>
  <!--音乐-->
  <div class="app-music">
    <header id="heade" class="mui-bar mui-bar-transparent">
			<router-link class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" to="/home">
            </router-link>
            <h1 class="mui-title">love  is  all</h1>
    </header>
    <a-player autoplay :music="{
        title: 'secret base~君がくれたもの~',
        artist: 'Silent Siren',
        src: 'http://127.0.0.1:3000/img/bg.mp3',
        pic: 'http://127.0.0.1:3000/img/1.jpg'
      }"
      :list=list
    />
  </div>
</template>
 
<script>
import VueAplayer from 'vue-aplayer'
export default {
  components: {
    'a-player': VueAplayer
  },
  data () {
  	return {
      list:[]
  	}
  },
  methods:{
    getMusic(){
      var url="musiclist/list"
      this.$http.get(url).then(result=>{
        this.list=result.body.msg;
      })
    }
  },
  created(){
    this.getMusic()
  }
}
</script>
 
<style>
    .app-music #heade .mui-action-back{
        color:#ddd;
    }
    .app-music #heade .mui-title{
        color:#fff;
    }
</style>
