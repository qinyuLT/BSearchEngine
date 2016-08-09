# SearchEngine
搜索结果来自Google自定义搜索，搜索资源来自百度云盘，更改url可以实现任何网盘资源的搜索

##BaiduYun
这是一个完整项目，包括一个servlet:访问url,解析返回的json数据，返回页面</br>

两个页面：
- index.html:简单的搜索页面</br>
- result.jsp:云盘搜索结果页面</br>

##BaiduYunServer
测试url的项目

##Google自定义搜索Url的获取方式
- 1.有Google账号(会翻墙)
- 2.Google搜索：google自定义搜索引擎
- 3.Add -> 要搜索的网站 -> 搜索引擎的名称 ->  创建
- 4.打开创建的google搜索,在右边模拟搜索，用F12开发者工具查找自己的url</br>
![](https://raw.githubusercontent.com/qinyuLT/Images/master/geturl.png)  </br>
###我的URL是这个(可能会失效，需要自己手动操作一遍，查找自己的url)
```javascript
https://www.googleapis.com/customsearch/v1element?key=AIzaSyCVAXiUzRYsML1Pv6RwSG1gunmMikTzQqY&rsz=filtered_cse&num=10&hl=zh_CN&prettyPrint=false&source=gcsc&gss=.com&sig=8bdfc79787aa2b2b1ac464140255872c&start=00&cx=016789904072617331679:m99586mr47g&q=java&sort=date&googlehost=www.google.com
```
```javascript
https://www.googleapis.com/customsearch/v1element?key=AIzaSyCVAXiUzRYsML1Pv6RwSG1gunmMikTzQqY&rsz=filtered_cse&num=10&hl=zh_CN&prettyPrint=false&source=gcsc&gss=.com&sig=8bdfc79787aa2b2b1ac464140255872c&start=10&cx=016789904072617331679:m99586mr47g&q=java&sort=date&googlehost=www.google.com
```
####两次获取的url
![](https://raw.githubusercontent.com/qinyuLT/Images/master/url.png)  </br>
其中标签很多
- 1.&start=00   //00表示从搜索结果的第一个显示，result.jsp每页显示10条记录
- 2.&q=java     //java表示搜索的关键字
- 3.&sort=date  //data表示搜索结果按照日期排序

最重要的的只有一个
- &q="需要搜索的关键字"

修改&q=后面的内容，将此URL粘贴到浏览器中，可以得到服务器返回的搜索结果Json</br>
当然返回的json很难看，推荐一个[json在线解析工具](http://json.cn/ "悬停显示")</br>
我们需要做的就是解析这个json文件，提取其中有用的信息，红色标记的属性</br>
![](https://raw.githubusercontent.com/qinyuLT/Images/master/json.png)  </br>

##推荐一个搜索云盘资源的网站
- [网盘搜](http://www.wangpansou.cn/)
- [上面网站会出现很多广告，用这个软件，让你的页面变得干净](http://ad-muncher.en.softonic.com/)
