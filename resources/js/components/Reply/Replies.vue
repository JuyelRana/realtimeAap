<template>
    <div>
        <Reply
            v-for="(reply, index) in content"
            :key="reply.id"
            :index="index"
            :reply="reply"></Reply>
    </div>
</template>

<script>
    import Reply from "./Reply";

    export default {
        name: "Replies",
        props: ['question'],
        components: {Reply},
        data() {
            return {
                content: this.question.replies,
            }
        },
        created() {
            // this.listenNewReply();
            // this.listenDeleteReply();

            this.listen();
        },
        methods: {

            listen() {

                // Listen Adding a New Reply
                EventBus.$on('newReply', (reply) => {
                    this.content.unshift(reply);
                });

                // Listen Deteling a Reply

                EventBus.$on('deleteReply', (index) => {

                    const replyId = this.content[index].id;

                    this.$swal({
                        title: 'Are you sure?',
                        text: "You won't be able to revert this!",
                        showCancelButton: true,
                        confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        confirmButtonText: 'Yes, delete it!'
                    }).then((result) => {
                        if (result.value) {

                            axios.delete(`/api/questions/${this.question.slug}/replies/${replyId}`)
                                .then(response => {
                                    this.$swal(
                                        'Deleted!',
                                        response.data,
                                        'success'
                                    );
                                    this.content.splice(index, 1);
                                }).catch(error => {
                                this.$swal(
                                    'Not Deleted!',
                                    error.response.status == 404 ? 'Reply not found' : 'Internal server error!',
                                    'warning'
                                );
                            })
                        }
                    });
                });


                // Notify to the user
                Echo.private('App.User.' + User.userId())
                    .notification((notification) => {
                        this.content.unshift(notification.reply);
                    });

                // Update if reply deleted
                Echo.channel('deleteReplyChannel')
                    .listen('.App\\Events\\Reply\\DeleteReplyEvent', (e) => {
                        for (let index = 0; index < this.content.length; index++) {
                            if (this.content[index].id === e.id) {
                                this.content.splice(index, 1);
                            }
                        }
                    });

            },

            // listenNewReply() {
            //     EventBus.$on('newReply', (reply) => {
            //         this.content.unshift(reply);
            //     })
            // },
            //
            // listenDeleteReply() {
            //     EventBus.$on('deleteReply', (index) => {
            //
            //         const replyId = this.content[index].id;
            //
            //         this.$swal({
            //             title: 'Are you sure?',
            //             text: "You won't be able to revert this!",
            //             showCancelButton: true,
            //             confirmButtonColor: '#3085d6',
            //             cancelButtonColor: '#d33',
            //             confirmButtonText: 'Yes, delete it!'
            //         }).then((result) => {
            //             if (result.value) {
            //
            //                 axios.delete(`/api/questions/${this.question.slug}/replies/${replyId}`)
            //                     .then(response => {
            //                         this.$swal(
            //                             'Deleted!',
            //                             response.data,
            //                             'success'
            //                         );
            //                         this.content.splice(index, 1);
            //                     }).catch(error => {
            //                     this.$swal(
            //                         'Not Deleted!',
            //                         error.response.status == 404 ? 'Reply not found' : 'Internal server error!',
            //                         'warning'
            //                     );
            //                 })
            //             }
            //         });
            //     })
            // }
            //
        }

    }
</script>

<style scoped>

</style>
