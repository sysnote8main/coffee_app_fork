<script>
  import axios from 'axios'
  export default {
    components: {
      axios
    },
    data() {
      return {
        res: {},
        message: '',
        frontUrl: import.meta.env.VITE_FRONT_URL,
        // 'http://localhost:3000/api/test'
      }
    },
    methods: {
      test() {
        fetch(this.frontUrl + 'test')
            .then((response) => response.json())
            .then((data) => {
            this.message = data.message
            })
      },

      addBeans() {
        const url = "http://localhost:3000/beans"
        const params = {
          method : "POST",
          headers: {'Content-Type': 'application/json'}
        };
        // fetch(url, params)
        // .then((response) => {
        //   console.log(response)
        //   if (!response.ok) {
        //     throw new Error("Network response was not OK");
        //   }
        //   return response.json();
        // })
        // .then((data) => {
        //   this.message = data.message
        //   })
        // .catch((error) => {
        //   console.log('error')
        //   console.error("There has been a problem with your fetch operation:", error);
        // });

        axios.post(url, params)
            .then((response) => response.json())
            .then((data) => {
            this.message = data.message
            })
        // const response = await fetch(url, params);
        // this.message = await response.json();
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
</div>
</template>