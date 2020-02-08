import Vue from 'vue/dist/vue.esm.js'
import Cards from './components/cards.vue'

// eslint-disable-next-line no-unused-vars
var getCards = new Vue({
    el: '#get-cards',
    components: {
        'cards': Cards,
    }
});
