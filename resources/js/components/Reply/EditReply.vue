<template>
    <div class="mt-1">
        <VueSimplemde v-model="reply.reply"></VueSimplemde>

        <v-card-actions>
            <v-btn icon small>
                <v-icon color="green" @click="update">save</v-icon>
            </v-btn>
            <v-btn icon small @click="cancel">
                <v-icon color="red">cancel</v-icon>
            </v-btn>
        </v-card-actions>
    </div>
</template>

<script>
    import VueSimplemde from 'vue-simplemde';

    export default {
        name: "EditReply",
        props: ['reply'],
        components: {
            VueSimplemde
        },
        methods: {
            update() {
                axios.patch(`/api/questions/${this.reply.question.slug}/replies/${this.reply.id}`, {body: this.reply.reply})
                    .then(response => {
                        this.$swal(
                            'Updated!',
                            response.data,
                            'success'
                        );
                        this.cancel();
                    }).catch(error => {
                    this.$swal(
                        'Not Updated!',
                        error.response.status == 500 ? 'Internal server error' : 'Data is missing for updated',
                        'warning'
                    );
                });
            },
            cancel() {
                EventBus.$emit('cancelEditing');
            }
        }
    }
</script>

<style scoped>

</style>
