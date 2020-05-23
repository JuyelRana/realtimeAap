class Token {

    isValidToken(token) {

        const payload = this.payload(token);

        if (payload) {
            return payload.iss == "http://127.0.0.1:8000/api/auth/login" || "http://127.0.0.1:8000/api/auth/signup" ? true : false;
        }
        return false;
    }

    payload(token) {
        const payload = token.split('.')[1]

        return this.decodeToken(payload);
    }

    decodeToken(payload) {
        return JSON.parse(atob(payload));
    }
}

export default Token = new Token();