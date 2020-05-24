<template>
    <ShowQuestion :data=question v-if="question"></ShowQuestion>
</template>

<script>
    import ShowQuestion from "./ShowQuestion";

    export default {
        name: "Read",
        components: {ShowQuestion},
        data: () => ({
            question: null
        }),
        created() {
            axios.get(`/api/questions/${this.$route.params.slug}`)
                .then(res => {
                    this.question = res.data.data
                }).catch(error => {
                console.log(error.response)
            })
        }
    }
</script>

<style scoped>

</style>
