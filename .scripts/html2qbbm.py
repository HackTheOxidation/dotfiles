#!/usr/bin/python3
import sys

from bs4 import BeautifulSoup


def get_bookmarks(file_name):
    with open(file_name, 'r') as fp:
        soup = BeautifulSoup(fp, 'html.parser')
        for anchor in soup.find_all('a'):
            yield str(anchor.string), anchor.get('href')


def write_to_file(file_name: str, links):
    with open(file_name, 'w+') as fp:
        for name, link in links:
            fp.write(format_bookmark(name, link))


def format_bookmark(name: str, link: str) -> str:
    return name + ' ' + link + '\n'


if __name__ == '__main__':
    argc = len(sys.argv) - 1
    if argc != 2:
        print(f'ERROR: Incorrect number of arguments - Expected 2, got {argc}')
        sys.exit(-1)
    
    source = sys.argv[1]
    dest = sys.argv[2]
    
    bookmarks = get_bookmarks(source)
    write_to_file(dest, bookmarks)
