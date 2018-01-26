import Unsplash, { toJson } from 'unsplash-js';

const unsplash = new Unsplash({
    applicationId: "d7d1b807ad670ac321bdb72ddd1059d7ae268a83bbc8c7878c0fa50976378a97",//process.env.unsplash_app_id,
    secret: "e4d92d0d216d5df4bb2f001bea6120a95f1cbf13db3445f21ec97886453b17ca",//process.env.unsplash_secret,
    callbackUrl: "urn:ietf:wg:oauth:2.0:oob"//process.env.unsplash_callback
});

function search_photos(query,page) {
    return unsplash.search.photos('cat',1)
        .then(toJson)
}

export default search_photos();