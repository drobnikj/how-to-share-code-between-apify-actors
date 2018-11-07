const Apify = require('apify');
const { MY_CONSTANTS } = require('shared/consts');

Apify.main(async () => {
    const requestQueue = await Apify.openRequestQueue();
    await requestQueue.addRequest(new Apify.Request({ url: 'https://www.iana.org/' }));
    const pseudoUrls = [new Apify.PseudoUrl('https://www.iana.org/[.*]')];

    const crawler = new Apify.PuppeteerCrawler({
        requestQueue,
        handlePageFunction: async ({ request, page }) => {
            console.log(MY_CONSTANTS)
            const title = await page.title();
            console.log(`Title of ${request.url}: ${title}`);
            await Apify.utils.puppeteer.enqueueLinks(page, 'a', pseudoUrls, requestQueue);
        },
        maxRequestsPerCrawl: 100,
        maxConcurrency: 10,
    });

    await crawler.run();
});
