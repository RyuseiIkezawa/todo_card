<template>
  <!-- cardsのコンポーネントの記述をする -->
  <div class="cards">
    <div v-for="todo in cards" :key="todo.id" class="card">
      <div class="card-el card-title">{{ todo.title.slice(0, 10) }}</div>
      <div class="card-el card-desc">{{ todo.description.slice(0, 40) }}</div>
      <!--   todo: ちゃんとDateで扱う   -->
      <div class="card-el card-deadline">{{ todo.deadline.slice(0, 10) }}</div>
    </div>
  </div>
</template>

<script>
    import axios from 'axios';

    export default {
        data: function () {
            return {
                cards: []
            }
        },
        mounted: function () {
            axios
                .get('http://localhost:5000/cards/all')
                .then(response => {
                    this.cards = response.data.map(card => card['todo'])
                })
                .catch(response => console.log(response))
        },
      }
</script>