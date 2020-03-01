<template>
  <!-- cardsのコンポーネントの記述をする -->
  <div class="cards">
    <div v-for="todo in cards" :key="todo.id" class="card">
      <a @click="edit(todo)">edit</a>
      <a @click="destroy(todo.id)">delete</a>
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
                cards: [],
                todo: {
                  id: '',
                  title: '',
                  description: '',
                  deadline: '',
                }
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
        methods: {
          // eslint-disable-next-line no-unused-vars
          edit(todo) {
            // this.todo = Object.assign({}, todo, {});
          },
          destroy(id) {
            axios
                .delete(`http://localhost:5000/cards/${id}`)
                .then(response => (console.log(response.data), this.info = response))
                .catch(response => console.log(response))
            id
          }
        }
      }
</script>