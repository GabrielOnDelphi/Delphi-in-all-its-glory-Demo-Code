using BenchmarkTools
println("----------- Test for loops")
# test for loops
function for_fun(a)
    total = 0
    big = 0
    small = 0
    for i in 1:a
        total += 1
        if i > 500000
            big += 1
        else
            small += 1
        end    
    end   

    return (total, small, big)
end

res_for = for_fun(1000000000)
println(res_for)
@btime for_fun(1000000000)


elem_vect = 10000
# test memory allocation undefined vector
println("---------- Test memory undef")
function mem_undef_fun(nr_elem::Int)
    big_vect = Vector{Vector}(undef, nr_elem)

    for i in 1:nr_elem
        big_vect[i] = Vector{Int32}(undef, nr_elem)

        #println("Interm vector size for loop $i is $(sizeof(big_vect))")
    end
    #println(sizeof(big_vect))
    return big_vect
end
res_mem_undef = mem_undef_fun(elem_vect)

@btime mem_undef_fun(elem_vect)
println("Allocated mem by mem_undef_fun is $((@allocated mem_undef_fun(elem_vect))/1048576) Megabytes.")
#println("Sizeof res_undef is $(sizeof(res_mem_undef))")
#println("Length of res_undef is $(length(res_mem_undef))")

# test memory allocation zeros vector
println("Test memory zeros")

function mem_zero_fun(nr_elem::Int)
    big_vect = Vector{Vector}(undef, nr_elem)

    for i in 1:nr_elem
        big_vect[i] = zeros(Int32, nr_elem)
    end

    return big_vect
end
res_mem_zero = mem_zero_fun(elem_vect)

@btime mem_zero_fun(elem_vect)
println("Allocated mem by mem_zero_fun is $((@allocated mem_zero_fun(elem_vect))/1048576) Megabytes.")
#println("Sizeof res_zero is $(sizeof(res_mem_zero))")
#println("Length of res_zero is $(length(res_mem_zero))")


#measure fill mem
#fill string with chars
println("--------- Test fill string with strings")
nr_char = 100000000
@btime repeat('A', nr_char)
println("Allocated mem is $((@allocated repeat('A', nr_char))/1048576) Megabytes.")


#find shortest and longest string
println("--------- Find shortest and longest string")
nr_strings = 1000000

#preparatory function
function make_string_vect_fun(nr_strings)
    string_size_float = rand(nr_strings) .* (500-1) .+ 1
    string_size_int = Vector{Int}(undef, nr_strings)
    for i in 1:nr_strings 
        string_size_int[i] = round(Int, string_size_float[i])
    end
    
    string_vect = Vector{String}(undef, nr_strings)
    for j in 1:nr_strings
        string_vect[j] = repeat('A', string_size_int[j])
    end
    
    return string_vect 
end

string_vect = make_string_vect_fun(nr_strings)

#find min max function
function find_min_max_fun(string_vect)
    min_s = 1000
    max_s = 0
    for x in 1:length(string_vect)
        len = length(string_vect[x])
        if len < min_s
            min_s = len
        elseif len > max_s
            max_s = len
        end
    end
    
    return (min_s, max_s)
end 


@btime find_min_max_fun(string_vect)
println(find_min_max_fun(string_vect))