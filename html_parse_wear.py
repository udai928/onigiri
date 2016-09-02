# coding:utf-8

from bs4 import BeautifulSoup
import urllib.request
import time

import smtplib
from email.mime.text import MIMEText
from email.utils import formatdate

import read_setting


ACCOUNT = read_setting.get_config_one("from")
To = read_setting.get_config_one("to")
PASSWORD = read_setting.get_config_one("password")
SUB = read_setting.get_config_one("subject")

URL = read_setting.get_config_one("target_url")
#URL = "http://wear.jp/sp/women-coordinate/?search_word=%E3%82%B7%E3%83%A7%E3%83%BC%E3%83%91%E3%83%B3&from_height=150&to_height=170&type_id=2"

def main():
    start_time = time.time()
    print ("START html_parse from wear.",time.ctime())
    
    soup = html_parser_from_wear(URL)
    body = html_scraping_from_soup(soup)
    send_message_using_smtp_ssl(SUB,body)

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
        if result is '更新はありませんでした。':
            pass
        else:
            break
    print (result)
    return result


def wear_update_check(str_class_time):

    if '分前' in str_class_time:
        message = (str_class_time + 'に更新がありました。ちぇけらψ(｀∇´)ψ¥n¥n' + URL)
        return message
    elif '時間前' in str_class_time:
      int_class_time = int(str_class_time.replace('時間前]', '').replace('[',''))
      if int_class_time <= 10: #10時間以内に更新があったかどうか。あったら通知よう本文をセット。
          message = (str_class_time + 'に更新がありました。ちぇけらψ(｀∇´)ψ¥n¥n' + URL)
          return message
      else:
          pass
    else:
        pass
    return '更新はありませんでした。'
    

def create_message(subject,body):
    msg = MIMEText(body)
    msg["Subject"] = subject
    msg["From"] = ACCOUNT
    msg["To"] = To
    msg["Date"] = formatdate(localtime=True)
    return msg


def send_message_using_smtp_ssl(subject,body):
    if '更新はありませんでした。' in body :
        pass
    else:
        msg = create_message(subject,body)

        print (subject,body)

        s = smtplib.SMTP_SSL("smtp.gmail.com")
        s.login(ACCOUNT, PASSWORD)

        s.send_message(msg)
        s.quit()


if __name__ == '__main__':
	main()