<template>
    <div v-if="question">
        <EditQuestion :question=question v-if="editing"></EditQuestion>
        <ShowQuestion :question=question v-else></ShowQuestion>
    </div>

</template>

<script>
    import ShowQuestion from "./ShowQuestion";
    import EditQuestion from "./EditQuestion";

    export default {
        name: "Read",
        components: {EditQuestion, ShowQuestion},
        data: () => ({
            question: null,
            editing: false
        }),
        created() {
            this.listenEditQuestion();
            this.listenCancelEditing();
            this.getQuestion();
        },

        methods: {
            listenEditQuestion() {
                EventBus.$on('editQuestion', () => {
                    this.editing = true;
                });
            },

            listenCancelEditing() {
                EventBus.$on('cancelEditing', () => {
                    this.editing = false;
                })
            },

            getQuestion() {
                axios.get(`/api/questions/${this.$route.params.slug}`)
                    .then(res => {
                        this.question = res.data.data
                    }).catch(error => {
                    console.log(error.response)
                });
            }
        }
    }
</script>

<style scoped>

</style>
