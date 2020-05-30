<template>
    <div v-if="question">
        <EditQuestion :question=question v-if="editing"></EditQuestion>
        <ShowQuestion :question=question v-else></ShowQuestion>
        <v-container>
            <Replies :replies="question.replies"></Replies>
            <NewReply :questionSlug="question.slug"></NewReply>
        </v-container>
    </div>

</template>

<script>
    import ShowQuestion from "./ShowQuestion";
    import EditQuestion from "./EditQuestion";
    import Replies from "../Reply/Replies";
    import NewReply from "../Reply/NewReply";

    export default {
        name: "Read",
        components: {NewReply, Replies, EditQuestion, ShowQuestion},
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
