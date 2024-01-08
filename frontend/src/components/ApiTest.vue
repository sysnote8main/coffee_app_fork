<template>
    <div>
      <h1>ApiTest</h1>
      <button @click="test">ApiTest</button>
      <p>{{ message }}</p>
    </div>
</template>
  
<script>
  export default {
    data() {
      return {
        message: '',
        frontUrl: import.meta.env.VITE_BACK_URL + '/api/test'
        // 'http://localhost:3000/api/test'
      }
    },
    methods: {
      test() {
        fetch(this.frontUrl)
            .then((response) => response.json())
            .then((data) => {
            this.message = data.message
            })
      }
    }
  }
  </script>