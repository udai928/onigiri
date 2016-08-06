# -*-config:utf-8-*-

from bs4 import BeautifulSoup
import urllib.request
import time

def main():
    start_time = time.time()
    print ("START html_parse from wear.",time.ctime())
    url = "http://hogehoge.com"
    soup = html_parser_from_wear(url)
    html_scraping_from_soup(soup)
    end_time = time.time()
    print ("END html_parse from wear. ", time.ctime())
    print ("Processing time was %f" %(end_time - start_time) +"s.")

def html_parser_from_wear(url_str):

    user_agent = 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mobile Safari/537.36'
    headers = { 'User-Agent' : user_agent }
    req = urllib.request.Request(url_str, None, headers)
    response = urllib.request.urlopen(req)
    html = response.read()
    soup = BeautifulSoup(html, 'lxml')

    return soup

def html_scraping_from_soup(bs4_soup):
# スクレイピングするだけの関数にしたいけど、更新チェック関数をfor文で回すところどうしようかな。

    class_meta_clearfixs = bs4_soup.find_all('div', class_ = 'meta clearfix')
    result = ''
    for class_meta_clearfix in class_meta_clearfixs:
        class_time = class_meta_clearfix.find_all('p', class_ = 'time')
        str_class_time = str(class_time).replace('<p class="time">','').replace('</p>','')
        result = wear_update_check(str_class_time)
    print (result)

def wear_update_check(str_class_time):

    if '分前' in str_class_time:
        message = (str_class_time + 'に更新がありました。ちぇけらψ(｀∇´)ψ')
        return message
    elif '時間前' in str_class_time:
      int_class_time = int(str_class_time.replace('時間前', ''))
      if int_class_time > 5:
          print (str_class_time + 'に更新がありました。ちぇけらψ(｀∇´)ψ')
          return message
      else:
          pass
    else:
        pass
    return '更新はありませんでした。'

    # class_name = class_meta_clearfix.find_all('p', class_ = 'name')
    # class_txt =  class_meta_clearfix.find_all('p', class_ = 'txt')     
    # str_class_name = str(class_name).replace('<p class="name">','').replace('</p>','')
    # str_class_txt = str(class_txt).replace('<p class="txt">','').replace(',  JP</p>','')

    # print (str_class_name, str_class_txt, str_class_time)

if __name__ == '__main__':
	main()