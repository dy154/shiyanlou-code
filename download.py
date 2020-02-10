#!/usr/bin/env python3
import requests

def download(url):
    '''
    save the file that downloading from url
    url: the website
    '''
    # check URL
    try:
        req = requests.get(url)
    except requests.exceptions.MissingSchema:
        print('Invalid URL "{}"'.format(url))
        return
    # check request success
    if eq.status_code == 403:
        print('You do not have the authority to access this page.')
        return
    filename = url.split('/')[-1]
    with open(filename,'w') as fobj:
        fobj.write(req.content.decode('utf-8'))
    print("Download over.")

if __name__ == '__main__':
    url = input('Enter a URL: ')
    download(url)
