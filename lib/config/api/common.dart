//  掘金配置API
const loginRequestUrlByMobile = 'https=//juejin.im/auth/type/phoneNumber';
const loginRequestUrlByEMail = 'https=//juejin.im/auth/type/email';
const notifyRequestUrl = 'https=//ufp-api-ms.juejin.im/v1';
const bannerRequestUrl = 'https=//banner-storage-ms.juejin.im/v1';
const timelineRequestUrl = 'https=//timeline-merger-ms.juejin.im/v1';
const xiaoceRequestUrl = 'https=//xiaoce-timeline-api-ms.juejin.im/v1';
const xiaoceCacheApiMs = 'https=//xiaoce-cache-api-ms.juejin.im/v1';
const postStorageApiMsRequestUrl = 'https=//post-storage-api-ms.juejin.im/v1';
const userLikeWrapperMsRequestUrl = 'https=//user-like-wrapper-ms.juejin.im/v1';
// const searchMergerMsRequestUrl= 'https=//search-merger-ms.juejin.im/v1';
const collectionSetMsRequestUrl = 'https=//collection-set-ms.juejin.im/v1';
const shortMsgMsRequestUrl = 'https=//short-msg-ms.juejin.im/v1';
const ufpApiMsRequestUrl = 'https=//ufp-api-ms.juejin.im/v1';
const lccroApiMsRequestUrl = 'https=//lccro-api-ms.juejin.im/v1';
const entryViewStorageApiMsRequestUrl =
    'https=//entry-view-storage-api-ms.juejin.im/v1';
const goldTagMsRequestUrl = 'https=//gold-tag-ms.juejin.im/v1';
const userNotificationApiMsRequestUrl =
    'https=//user-notification-api-ms.juejin.im/v1';
const apiRequestUrl = 'https=//user-storage-api-ms.juejin.im/v1';
const imageServer = 'https://images.weserv.nl/';

const aid = '2608';
const uuid = '6933837354391193102';

const headers = {
  ':authority': 'api.juejin.cn',
  ':method': 'GET',
  ':path':
      '/tag_api/v1/query_category_briefs?aid=2608&uuid=6933837354391193102',
  ':scheme': 'https',
  'accept': '*/*',
  'accept-encoding': 'gzip, deflate, br',
  'accept-language': 'zh-CN,zh;q=0.9',
  'content-type': 'application/json',
  'cookie':
      '_ga=GA1.2.675238409.1614409820; n_mh=iVNUTrjDHkooCIYKR2SrPyhNY5AYnQJQwnXLh5lxcNE; MONITOR_WEB_ID=99f1383d-03c4-4a11-bccd-5c214802fe88; gr_user_id=1c52c59d-80b9-4150-9c76-df1ebcb622f0; grwng_uid=1c54041c-76e9-4325-8c1e-3e896b621c81; _tea_utm_cache_2608={%22utm_source%22:%22gold_browser_extension%22}; passport_csrf_token_default=9d8fe9cee349ef26982cd5f344a4f9f7; passport_csrf_token=9d8fe9cee349ef26982cd5f344a4f9f7; sid_guard=f39132953c06a1d2ac3d5be61b7715fa%7C1630546747%7C5184000%7CMon%2C+01-Nov-2021+01%3A39%3A07+GMT; uid_tt=ec6c1fcbe039bd1be2bb3f768d589621; uid_tt_ss=ec6c1fcbe039bd1be2bb3f768d589621; sid_tt=f39132953c06a1d2ac3d5be61b7715fa; sessionid=f39132953c06a1d2ac3d5be61b7715fa; sessionid_ss=f39132953c06a1d2ac3d5be61b7715fa; sid_ucp_v1=1.0.0-KGM0ZTUxNjhmMzg2NmRiZTI3Zjc4ZDFkZDZkZWI4ODM3YmZiNmY3ZTYKFgjI5LDA_fX9AhC71sCJBhiwFDgIQAsaAmxmIiBmMzkxMzI5NTNjMDZhMWQyYWMzZDViZTYxYjc3MTVmYQ; ssid_ucp_v1=1.0.0-KGM0ZTUxNjhmMzg2NmRiZTI3Zjc4ZDFkZDZkZWI4ODM3YmZiNmY3ZTYKFgjI5LDA_fX9AhC71sCJBhiwFDgIQAsaAmxmIiBmMzkxMzI5NTNjMDZhMWQyYWMzZDViZTYxYjc3MTVmYQ; _gid=GA1.2.480087578.1630906692',
  'origin': 'https://juejin.cn',
  'referer': 'https://juejin.cn/',
  'sec-ch-ua':
      '"Chromium";v="92", " Not A;Brand";v="99", "Google Chrome";v="92"',
  'sec-ch-ua-mobile': '?0',
  'sec-fetch-dest': 'empty',
  'sec-fetch-mode': 'cors',
  'sec-fetch-site': 'same-site',
  'user-agent':
      'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36'
};

const httpHeaders = {
  'Accept': '*/*',
  'Accept-Encoding': 'gzip, deflate, br',
  'Accept-Language': 'zh-CN,zh;q=0.9',
  'Connection': 'keep-alive',
  'Host': 'gold-tag-ms.juejin.im',
  'Origin': 'https://juejin.cn',
  'Referer': 'https://juejin.im/timeline',
  'User-Agent':
  'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1',
  'X-Juejin-Client': '1532136021731',
  'X-Juejin-Src': 'web',
  'X-Juejin-Token':
  'eyJhY2Nlc3NfdG9rZW4iOiJWUmJ2dDR1RFRzY1JUZXFPIiwicmVmcmVzaF90b2tlbiI6IjBqdXhYSzA3dW9mSTJWUEEiLCJ0b2tlbl90eXBlIjoibWFjIiwiZXhwaXJlX2luIjoyNTkyMDAwfQ==',
  'X-Juejin-Uid': '59120a711b69e6006865dd7b'
};
