PORT = 7070;
u = udpport("byte", "IPV4", "LocalHost","127.0.0.1","LocalPort", PORT, "EnablePortSharing",true);

while true 
    if (u.NumBytesAvailable > 0)
        data = read(u, u.NumBytesAvailable, "string");
        TextAsCells = regexp(data, '/n', 'split');
        line = TextAsCells{1};
        size(TextAsCells,2)
        toks = strsplit(line, ',');
        
        if ((length(toks) < 24) | (toks(1) ~= "FT"))
            print("Bad read")
        else
            cnt = str2num(toks{2})

        end
    end
end
