<template>
    <v-container fluid grid-list-md>
        <v-layout row wrap>
            <v-flex xs8>
                <Questions v-for="question in allquestions" :key="question.path" :question="question"></Questions>
            </v-flex>
            <v-flex xs4>
                <Sidebar></Sidebar>
            </v-flex>
        </v-layout>
    </v-container>
</template>

<script>
    import Questions from "./Questions";
    import Sidebar from "./Sidebar";

    export default {
        name: "Forum",
        components: {
            Sidebar,
            Questions
        },
        data: () => ({
            allquestions: {}
        }),
        created() {
            axios.get('/api/questions')
                .then(res => {
                    // console.log(res.data.data)
                    this.allquestions = res.data.data
                }).catch(error => {
                console.log(error.response.data)
            });
        }
    }
</script>

<style scoped>

</style>
