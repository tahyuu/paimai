import socket

family, socktype, proto, canonname, sockaddr = socket.getaddrinfo('test.alltobid.com',843)[0]
print family, socktype, proto, canonname, sockaddr
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect(sockaddr)
s.sendall('<policy-file-request/>\x00')
data = s.recv(1024)
s.close()
print 'Received', repr(data)
