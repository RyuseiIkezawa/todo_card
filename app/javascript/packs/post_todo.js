import Vue from 'vue/dist/vue.esm.js'
import axios from 'axios'

axios.defaults.headers.post['Content-Type'] = 'application/json;charset=utf-8';
axios.defaults.headers.common = {
    'X-Requested-With': 'XMLHttpRequest',
    'X-CSRF-TOKEN' : document.querySelector('meta[name="csrf-token"]').getAttribute('content')
};

// eslint-disable-next-line no-unused-vars

new Vue({
    el: '#post-todo',
    data: {
        deadline: '',
        title: '',
        description: ''
    },
    methods: {
        postTodo: function () {
            axios
                .post('http://localhost:5000/cards/create_or_update', {
                    card: {
                        deadline: this.deadline,
                        title: this.title,
                        description: this.description
                    }
                })
                .then(response => (console.log(response.data), this.info = response))
        }
    }
})
