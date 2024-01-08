<script>
import axios from 'axios';

export default {
  props: ['beanId'],
  data() {
    return {
      res: {},
      message: '',
      bean: {},
      frontUrl: import.meta.env.VITE_BACK_URL,
    };
  },
  created() {
    this.getBean();
  },
  methods: {
    async getBean() {
      const res = await axios.get(this.frontUrl + '/beans/' + this.beanId);
      this.bean = res.data.bean;
    },
    async addBean() {
      const url = this.frontUrl + '/beans'
      console.log(this.bean)
      const params = {
        bean: this.bean,
      };
      const res = await axios.post(url,params);
      this.message = res.data.message;
      this.$router.push({ path: '/' });
    },
    async updateBean() {
      const url = this.frontUrl + '/beans/' + this.beanId
      const params = {
        bean: this.bean,
      };
      const res = await axios.patch(url,params);
      this.message = res.data.message;
      this.$router.push({ path: '/beans/' + this.beanId });
    },
    async deleteBean() {
      const res = await axios.delete(this.frontUrl + '/beans/' + this.beanId);
      this.message = res.data.message;
      this.$router.push({ path: '/' });
    },
  },
};
</script>

<template> 
  <div class='Beans' > 
    <div class='page_title' > 
    </div>
    <div class='inputBeans'>名前<input v-model='bean.name' /></div>
    <div class='inputBeans'>産地<input v-model='bean.producingArea' /></div>
    <div class='inputBeans'>品種<input v-model='bean.kind' /></div>
    <div class='inputBeans'>焙煎度<input v-model='bean.degreeOfRoasting' /></div>
    <div class='inputBeans'>価格<input v-model='bean.price' /></div>
    <div class='inputBeans'>味</div>
    <div class='inputBeans'>
        <label for='acidity'>酸味</label>
        <input type='range' v-model='bean.acidity'  min='0' max='10'   step='1'>
    </div>
    <div class='inputBeans'>
        <label for='bitter'>苦味</label>
        <input type='range' v-model='bean.bitter'  min='0' max='10'  step='1'>
    </div>
    <div class='inputBeans'>
        <label for='sweety'>甘味</label>
        <input type='range' v-model='bean.sweety'  min='0' max='10'  step='1'>
    </div>
    <div class='inputBeans'>
        <label for='fullBody'>コク</label>
        <input type='range' v-model='bean.fullBody'  min='0' max='10'  step='1'>
    </div>
    <div class='inputBeans'>
        <label for='aroma'>香り</label>
        <input type='range' v-model='bean.aroma'  min='0' max='10'  step='1'>
    </div>
    <div class='inputBeans'>コメント<input v-model='bean.comments' /></div>
    
    <button  v-if='beanId' @click='updateBean()'>変更</button>
    <button  v-else @click='addBean()'>登録</button>
    <button @click='deleteBean()'>削除</button>

    {{  this.message }}
</div>
</template>