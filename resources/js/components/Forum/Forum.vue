<template>
    <v-container fluid grid-list-md>
        <v-layout row wrap>
            <v-flex xs8>
                <Questions></Questions>
            </v-flex>
            <v-flex xs4>
                Sidebar
            </v-flex>
        </v-layout>
    </v-container>
</template>

<script>
    import Questions from "./Questions";

    export default {
        name: "Forum",
        components: {
            Questions
        }
    }
</script>

<style scoped>

</style>
