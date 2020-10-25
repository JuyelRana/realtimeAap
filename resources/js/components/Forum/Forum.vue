<template>
    <v-container fluid grid-list-md>
        <v-layout row wrap>
            <v-flex xs8>
                <v-toolbar color="indigo" dark dense v-if="hasCategory">
                    <v-toolbar-title>{{ category.name }}</v-toolbar-title>
                </v-toolbar>

                <Questions
                    v-for="question in allquestions"
                    :key="question.path"
                    :question="question"
                    v-if="allquestions.length > 0">
                </Questions>

                <NotFound v-if="allquestions.length === 0"></NotFound>
            </v-flex>

            <v-flex xs4>
                <Sidebar></Sidebar>
            </v-flex>

        </v-layout>
    </v-container>
</template>

<script>
    import Questions from "../Question/Questions";
    import Sidebar from "../Includes/Sidebar";
    import NotFound from "../partials/NotFound";
    import Exception from "../../Helpers/Exception";

    export default {
        name: "Forum",
        components: {
            NotFound,
            Sidebar,
            Questions
        },
        data: () => ({
            allquestions: {},
            category: {},
            hasCategory: false,
        }),
        created() {
            this.getQuestions();
            this.listenQuestionsByCategory();
        },
        methods: {
            listenQuestionsByCategory() {
                EventBus.$on('questionsByCategory', (category) => {
                    if (category !== null) {
                        this.allquestions = category.questions;
                        this.category = category;
                        this.hasCategory = true;
                    }
                });
            },
            getQuestions() {
                axios.get('/api/questions')
                    .then(res => {
                        this.allquestions = res.data.data;
                    }).catch(error => {
                    Exception.handle(error);
                });
            }
        }
    }
</script>

<style scoped>

</style>
