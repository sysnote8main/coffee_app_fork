<script>
  import axios from 'axios'
  export default {
    data() {
      return {
        res: {},
        message: '',
        frontUrl: import.meta.env.VITE_FRONT_URL,
      }
    },
    methods: {
      async addBeans() {
        const url = this.frontUrl + "/beans"
        const params = {
          name: this.name,
          producingArea: this.producingArea,
          kind: this.kind,
          degreeOfRoasting: this.degreeOfRoasting,
          price: this.price,
          acidity: this.acidity,
          bitter: this.bitter,
          sweety: this.sweety,
          fullBody: this.fullBody,
          aroma: this.aroma,
          inputBeans: this.inputBeans,
        };
        // const headers = {
        //     'Content-Type': 'application/json',
        // }
        
        const res = await axios.post(url,params);
        this.message = res.data.message;
      }
    }
  }
</script>

<template> 
  <div class="input" > 
    <div class="page_title" > 
    </div>
    <div class="inputBeans">名前<input v-model="name" /></div>
    <div class="inputBeans">産地<input v-model="producingArea" /></div>
    <div class="inputBeans">品種<input v-model="kind" /></div>
    <div class="inputBeans">焙煎度<input v-model="degreeOfRoasting" /></div>
    <div class="inputBeans">価格<input v-model="price" /></div>
    <div class="inputBeans">味</div>
    <div class="inputBeans">
        <label for="acidity">酸味</label>
        <input type="range" id="acidity" name="acidity"  min="0" max="10"  value="5" step="1">
    </div>
    <div class="inputBeans">
        <label for="bitter">苦味</label>
        <input type="range" id="bitter" name="bitter"  min="0" max="10"  value="5" step="1">
    </div>
    <div class="inputBeans">
        <label for="sweety">甘味</label>
        <input type="range" id="sweety" name="sweety"  min="0" max="10"  value="5" step="1">
    </div>
    <div class="inputBeans">
        <label for="fullBody">コク</label>
        <input type="range" id="fullBody" name="fullBody"  min="0" max="10"  value="5" step="1">
    </div>
    <div class="inputBeans">
        <label for="aroma">香り</label>
        <input type="range" id="aroma" name="aroma"  min="0" max="10"  value="5" step="1">
    </div>
    <div class="inputBeans">コメント<input v-model="comments" /></div>
    <button @click="addBeans()">登録</button>
    <button @click="delBeans()">削除</button>

    {{  this.message }}
</div>
</template>