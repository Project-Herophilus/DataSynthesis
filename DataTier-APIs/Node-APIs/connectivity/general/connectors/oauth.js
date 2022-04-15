/*
 * (C) Copyright Data Fusion Specialists. 2022
 *
 * SPDX-License-Identifier: Apache-2.0
 */

const axios = require("axios");

/**
 * Refresh the microsoft provider tokens
 */
const refreshTokens = async (
    tenantId,
    clientId,
    clientSecret,
    refreshToken
) => {
    const tokenUrl = `https://login.microsoftonline.com/${tenantId}/oauth2/v2.0/token`;
    const tokenParams = new URLSearchParams();
    tokenParams.append("grant_type", "refresh_token");
    tokenParams.append("client_id", clientId);
    tokenParams.append("client_secret", clientSecret);
    tokenParams.append("refresh_token", refreshToken);

    return axios
        .post(tokenUrl, tokenParams)
        .then((response) => response.data)
        .then((response) => {
            // Extract the tokens from the oauth2 response
            const accessToken = response["access_token"];
            const refreshToken = response["refresh_token"];

            process.env.PROVIDER_ACCESS_TOKEN = accessToken;
            process.env.PROVIDER_REFRESH_TOKEN = refreshToken;
        })
        .catch((err) => {
            console.log("There was a problem refreshing tokens");
            console.log(err);
        });
};

module.exports = {
    refreshTokens,
};