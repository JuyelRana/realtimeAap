<template>
    <div class="mt-3">
        <span class="red--text" v-if="reply_error"> {{ reply_error }}</span><br>
        <VueSimplemde v-model="body"></VueSimplemde>

        <v-btn color="green" dark @click="submit">
            Reply
        </v-btn>
    </div>
</template>

<script>
    import VueSimplemde from 'vue-simplemde';

    export default {
        name: "NewReply",
        props: ['questionSlug'],
        components: {
            VueSimplemde
        },
        data: () => ({
            body: null,
            reply_error: null
        }),

        methods: {
            submit() {
                axios.post(`/api/questions/${this.questionSlug}/replies`, {body: this.body})
                    .then(response => {
                        this.$swal(
                            'Added!',
                            response.data.message,
                            'success'
                        );
                        EventBus.$emit('newReply', response.data.reply);

                        window.scrollTo(0, 0);

                        this.body = '';

                    }).catch(error => {
                    this.reply_error = error.response.data.errors.body[0];
                    this.$swal(
                        'Not Added!',
                        error.response.status == 500 ? 'Data Processing Problem' : '' + error.response.data.message,
                        'warning'
                    )
                })
            }
        }
    }
</script>

<style scoped>

</style>
