res = {}
tmp = {}
function f65(arr,x)
    f652(arr,1,1,x)
end
--arr-数组 n-选择组合中第几个方法 i-从第几个索引开始取 x-需要取多少个元素
function f652(arr,n,i,x)
    if(n>x) then
        res[#res+1]={table.unpack(tmp)}
        return
    end
    for k = i, #arr do
        tmp[n] = arr[k]
        f652(arr,n+1,k+1,x)
    end
end

f65({1,2,3,4},3)
for i = 1, #res do
    for z = 1, #res[i] do
        io.write(res[i][z])
    end
    io.write("\n")
end

