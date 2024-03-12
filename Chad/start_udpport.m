PORT = 7070;
u = udpport("byte", "IPV4", "LocalHost","127.0.0.1","LocalPort", PORT, "EnablePortSharing",true);

while true 
    if (u.NumBytesAvailable > 0)
        data = read(u, u.NumBytesAvailable, "string");
        split = splitlines(data);
        line = split{end-1};
        toks = strsplit(line, ',');
        
        if ((length(toks) < 24) | (toks(1) ~= "FT"))
            print("Bad read")
        else
            cnt = str2num(toks{2})

        end
    end
end
