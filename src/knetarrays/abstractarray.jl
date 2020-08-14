import Base: IndexStyle, eachindex, eltype, fill!, first, isempty, iterate, lastindex, length, ndims, ones, similar, size, stride, strides, zero
using AutoGrad: AutoGrad, @primitive1, ungetindex

# AbstractArray interface

eachindex(a::KnetArray) = (1:length(a))
eltype(::KnetArray{T}) where {T}=T
eltype(::Type{KnetArray{T}}) where {T} = T
eltype(::Type{KnetArray{T,n}}) where {T,n} = T
lastindex(a::KnetArray) = length(a)
lastindex(a::KnetArray,d) = size(a,d)
fill!(a::KnetArray{T},x) where {T}=(a[:] .= T(x);a)
first(a::KnetArray) = a[1]
# AutoGrad leaves `first` as a compound proc calling start which doesn't work with KnetArrays
@primitive1  first(x::KnetArray),dy,y  AutoGrad.ungetindex(x,dy,1)
isempty(a::KnetArray) = (0==length(a))
length(a::KnetArray)=prod(size(a))

ndims(a::KnetArray{T,N}) where {T,N}=N
ones(a::KnetArray{T}) where {T}=fill!(similar(a),one(T))
similar(a::KnetArray, T, dims::Dims)      = KnetArray{T}(undef,dims)
similar(a::KnetArray, T, dims::Int...)    = similar(a, T, dims)
similar(a::KnetArray, T)                  = similar(a, T, size(a))
similar(a::KnetArray{T}) where {T}               = similar(a, T, size(a))
similar(a::KnetArray{T}, dims::Dims) where {T}   = similar(a, T, dims)
similar(a::KnetArray{T}, dims::Int...) where {T} = similar(a, T, dims)
size(a::KnetArray)=a.dims
size(a::KnetArray{T,N},i::Integer) where {T,N}=(if i>N; 1; else; size(a)[i]; end)
stride(a::KnetArray{T,N},i::Integer) where {T,N}=(if i>N; length(a); else; s=1; for n=1:(i-1); s*=size(a,n); end; s; end)
strides(a::KnetArray{T,N}) where {T,N}=ntuple(n->stride(a,n), N)
zero(a::KnetArray{T}) where {T}=fill!(similar(a),zero(T))

iterate(A::KnetArray,I...)=error() # throw(MethodError(iterate,A,I...))
IndexStyle(::Type{<:KnetArray})=IndexLinear()
