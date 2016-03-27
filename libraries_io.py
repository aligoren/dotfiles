# -*- coding: utf-8 -*-
"""
Libraries.IO Wrapper
Sample:
    LibIO_Tech = "npm"
    LibIO_Lib = "grunt"
    LibIO_API_KEY = "YOUR_API_KEY"


    /* main.py */
    
    import libraries_io as libio
    
    libio.LibIO_Tech = "npm"
    libio.LibIO_Lib = "grunt"
    libio.LibIO_API_KEY = "MY_API_KEY"

    lio = libio.LibrarisIO()
    
    lio.getAllInfo() # or other methods

This is bad practice :/
"""

import requests as rq
import json


LibIO_Tech = ""
LibIO_Lib = ""
LibIO_API_KEY = ""


def getData(teche, libe, API_KEYe):
    url = "https://libraries.io/api/%s/%s?api_key=%s" % (teche, libe, API_KEYe)

    r = rq.get(url)

    data = json.loads(r.text)

    return data


class LibrarisIO(object):

    def __init__(self):
        getVersion = self.getVersion
        getName = self.getName
        getPlatform = self.getPlatform
        getDescription = self.getDescription
        getHomepage = self.getHomepage
        getRepository_url = self.getRepository_url
        getNormalized_licenses = self.getNormalized_licenses
        getAllInfo = self.getAllInfo

    def getVersion(self):

        number_list = []
        published_list = []
        version_list = []
        ln_version = 1
        uri = getData(LibIO_Tech, LibIO_Lib, LibIO_API_KEY)
        for get_data in uri["versions"]:
            number_list.append(len(get_data))
            ln_version = len(number_list)

        for get_data in uri["versions"]:
            version_list.append(get_data["number"])

        for get_data in uri["versions"]:
            published_list.append(get_data["published_at"])

        get_latest_version = version_list[ln_version - 1]
        get_version_date = published_list[ln_version - 1]

        return get_latest_version + " - " + get_version_date[:10]

    def getName(self):
        uri = getData(LibIO_Tech, LibIO_Lib, LibIO_API_KEY)
        return uri["name"]

    def getPlatform(self):
        uri = getData(LibIO_Tech, LibIO_Lib, LibIO_API_KEY)
        return uri["platform"]

    def getDescription(self):
        uri = getData(LibIO_Tech, LibIO_Lib, LibIO_API_KEY)
        return uri["description"]

    def getHomepage(self):
        uri = getData(LibIO_Tech, LibIO_Lib, LibIO_API_KEY)
        return uri["homepage"]

    def getRepository_url(self):
        uri = getData(LibIO_Tech, LibIO_Lib, LibIO_API_KEY)
        return uri["repository_url"]

    def getNormalized_licenses(self):
        license = ''
        uri = getData(LibIO_Tech, LibIO_Lib, LibIO_API_KEY)
        for get_license in uri["normalized_licenses"]:
            license += get_license
        return license

    def getAllInfo(self):
        rtn = "Name: %s\nDescription: %s\nPlatform: %s\nVersion: %s\nHomepage: %s\nRepo URL: %s\nLicense: %s" % (self.getName(), self.getDescription(
        ), self.getPlatform(), self.getVersion(), self.getHomepage(), self.getRepository_url(), self.getNormalized_licenses())

        print(rtn)
