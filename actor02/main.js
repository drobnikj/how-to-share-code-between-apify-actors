const Apify = require('apify');
const { myUtilFunc } = require('shared/utils');

Apify.main(async () => {

    const test = myUtilFunc();

    console.log(`Result of myUtilFunc() is ${test}`);

    console.log('Done.');
});
