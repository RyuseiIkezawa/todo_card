<template>
  <!-- cardsのコンポーネントの記述をする -->
  <div class="cards">
    <div v-for="card in cards" >
      <div v-for="todo in card" class="card">
        <p>{{ todo.title }}</p>
        <p>{{ todo.description }}</p>
        <p>{{ todo.updated_at }}</p>
      </div>
    </div>
  </div>
</template>

<script>
    import axios from 'axios';

    export default {
        data: function () {
            return {
                cards: null
            }
        },
        mounted: function () {
            axios
                .get('http://localhost:5000/cards/all')
                .then(response => (this.cards = response.data))
        },
      }
</script>