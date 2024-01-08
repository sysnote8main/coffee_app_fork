<script>
import axios from 'axios';

export default {
  data() {
    return {
      beans: [],
      frontUrl: import.meta.env.VITE_BACK_URL,
    };
  },
  mounted() {
    console.log('mounted')
    this.getBeansList();
  },
  methods: {
    async getBeansList() {
      const res = await axios.get(this.frontUrl + '/beans');
      this.beans = res.data;
      console.log(res)
    },
  },
};
</script>

<template> 
  <div class="List" > 
    <h1>コーヒー豆一覧</h1>
    <router-link to="/beans">新規登録</router-link>
    <ul>
      <li v-for="bean in beans" :key="bean.id">
        <router-link :to="`/beans/${bean.id}`">{{ bean.name }}</router-link>
      </li>
    </ul>
  </div>
</template>