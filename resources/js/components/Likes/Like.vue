<template>
    <div>
        <v-btn icon @click="likeIt">
            <v-icon :color="color">{{ icon }}</v-icon>
            {{ count }}
        </v-btn>
    </div>
</template>

<script>
    export default {
        name: "Like",
        props: ['content'],
        data() {
            return {
                liked: this.content.liked,
                count: this.content.like_count,
            }
        },
        created() {
            Echo.channel('likeChannel')
                .listen('.App\\Events\\Like\\LikeEvent', (e) => {
                    if (this.content.id === e.id) {
                        e.type === 1 ? this.count++ : this.count--;
                    }
                })
        },
        computed: {
            color() {
                return this.liked ? 'red' : 'red lighten-4';
            },
            icon() {
                return this.liked ? 'favorite' : 'favorite_border';
            }
        },
        methods: {
            likeIt() {
                if (User.loggedIn()) {
                    this.liked ? this.decrement() : this.increment();
                    this.liked = !this.liked;
                }
            },
            increment() {
                axios.post(`/api/like/${this.content.id}`)
                    .then(response => {
                        console.log(response.data);
                        this.count++;
                    }).catch(error => {
                    console.log(error.response.data);
                });

            },
            decrement() {
                axios.delete(`/api/like/${this.content.id}`)
                    .then(response => {
                        console.log(response.data);
                        this.count--;
                    }).catch(error => {
                    console.log(error.response.data);
                });
            }
        }
    }
</script>

<style scoped>

</style>
