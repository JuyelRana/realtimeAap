<template>
    <div class="mt-3">
        <v-card>
            <v-card-title>
                <div class="headline">{{ reply.user }}</div>
                <div class="ml-2">said {{ reply.reply_time }}</div>

                <v-spacer></v-spacer>
                <Like :content="reply"></Like>
            </v-card-title>

            <v-divider></v-divider>

            <EditReply v-if="editing" :reply="reply"></EditReply>

            <v-card-text v-html="getReply" v-else></v-card-text>

            <v-divider></v-divider>

            <div v-if="!editing">
                <v-card-actions v-if="own">
                    <v-btn icon small>
                        <v-icon color="orange" @click="edit">edit</v-icon>
                    </v-btn>
                    <v-btn icon small @click="destroy">
                        <v-icon color="red">delete</v-icon>
                    </v-btn>
                </v-card-actions>
            </div>
        </v-card>
    </div>
</template>

<script>
    import EditReply from "./EditReply";
    import Like from "../Likes/Like";

    export default {
        name: "Reply",
        components: {Like, EditReply},
        props: ['reply', 'index'],
        data() {
            return {
                editing: false,
                beforeEditReplyBody: null,
            }
        },
        computed: {
            own() {
                return User.own(this.reply.user_id);
            },
            getReply() {
                return md.parse(this.reply.reply);
            }
        },
        created() {
            this.listen();
        },
        methods: {
            destroy() {
                EventBus.$emit('deleteReply', this.index);
            },
            edit() {
                this.editing = true;
                this.beforeEditReplyBody = this.reply.reply;
            },

            listen() {
                EventBus.$on('cancelEditing', () => {
                    this.editing = false;
                    this.reply.reply = this.beforeEditReplyBody;
                    this.beforeEditReplyBody = '';
                });
            }
        }
    }
</script>

<style scoped>

</style>
