<template>

    <v-card>
        <v-container fluid>
            <v-card-title>
                <div>
                    <div class="headline">{{ question.title }}</div>
                    <span class="grey--text"> {{ question.user }} said {{ question.created_at }}</span>
                </div>

                <v-spacer></v-spacer>
                <v-btn color="teal" v-if="question.replies.length > 0">{{ question.replies.length }} Replies</v-btn>
            </v-card-title>
            <v-card-text v-html="body"></v-card-text>

            <v-card-actions v-if="own">
                <v-btn icon small @click="edit">
                    <v-icon color="orange">edit</v-icon>
                </v-btn>
                <v-btn icon small @click="destroy">
                    <v-icon color="red">delete</v-icon>
                </v-btn>
            </v-card-actions>
        </v-container>

    </v-card>

</template>

<script>
    export default {
        name: "ShowQuestion",
        props: ['question'],
        computed: {
            body() {
                return md.parse(this.question.body);
            },
            own() {
                return User.own(this.question.user_id);
            }
        },
        methods: {
            destroy() {

                this.$swal({
                    title: 'Are you sure?',
                    text: "You won't be able to revert this!",
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!'
                }).then((result) => {

                    if (result.value) {

                        axios.delete(`/api/questions/${this.$route.params.slug}`)
                            .then(res => {
                                this.$swal(
                                    'Deleted!',
                                    res.data,
                                    'success'
                                );
                                this.$router.push('/forum');
                            })
                            .catch(error => {
                                this.$swal(
                                    'Problem Deleted!',
                                    error.response.data.message,
                                    'warning'
                                );
                            });
                    }
                });
            },
            edit() {
                EventBus.$emit('editQuestion');
            }
        }
    }
</script>

<style scoped>

</style>
