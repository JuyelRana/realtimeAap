<template>
    <div>
        <Reply
            v-for="reply in replies"
            :key="reply.id"
            :reply="reply"></Reply>
    </div>
</template>

<script>
    import Reply from "./Reply";

    export default {
        name: "Replies",
        props: ['replies'],
        components: {Reply},
        created() {
            this.listenReply();
        },
        methods: {
            listenReply() {
                EventBus.$on('newReply', (reply) => {
                    this.replies.unshift(reply);
                })
            }
        }

    }
</script>

<style scoped>

</style>
