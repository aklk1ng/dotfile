function setproxy
    export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 ALL_PROXY=socks5:://127.0.0.1:7891
end
