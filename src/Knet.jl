module Knet
using AutoGrad, CUDA

include("util/Util.jl")
include("libknet8/LibKnet8.jl")
include("knetarrays/KnetArrays.jl")
include("cuarrays/CuArrays.jl")
include("autograd_gpu/AutoGrad_gpu.jl")
include("ops20/Ops20.jl")
include("ops20_gpu/Ops20_gpu.jl")
# include("fileio_gpu/FileIO_gpu.jl")
# include("train20/Train20.jl")

# See if we have a gpu at initialization:
function __init__()
    Knet.AutoGrad_gpu.__init__() # sets gcnode based on cuallocator
    # if !CUDA.functional()
    #     @warn "Knet cannot use a GPU: CUDA.jl is not functional"
    # else                        # TODO: pick best gpu here.
    #     AutoGrad.set_gc_function(Knet.KnetArrays.cuallocator[] ? Knet.AutoGrad_gpu.gcnode : Knet.AutoGrad_gpu.knetgcnode)
    #     Knet.Train20.array_type[] = Knet.KnetArrays.KnetArray{Float32}
    # end
end

#=

# TODO: handle deprecated functions
using CUDA; export CuArray
using AutoGrad; export AutoGrad, cat1d, @diff, grad, gradloss, Param, params, value, @gcheck
using .Util; export gpu, gpucopy, cpucopy
using .Ops20; export relu, selu, elu, sigm, dropout, bmm, conv4, deconv4, mat, pool, unpool, logp, softmax, logsoftmax, logsumexp, nll, accuracy, logistic, bce, batchnorm, bnmoments, bnparams, RNN, rnninit, rnnforw, rnnparam, rnnparams
using .KnetArrays; export KnetArray
using .Train20

# The rest are from Train20: TODO: make this list smaller.
export		# ref:reference.md tut:tutorial
#    accuracy,	# ref, tut
    adadelta!,	# ref
    Adadelta,	# ref
    adadelta,	# ref
    adagrad!,	# ref
    Adagrad,	# ref
    adagrad,	# ref
    adam!,	# ref
    Adam,	# ref
    adam,	# ref, tut
#    AutoGrad,	# ref, tut
#    batchnorm,	# ref
#    bce,	# ref
    bilinear,	# ref
#    bmm,	# ref
#    bnmoments,	# ref
#    bnparams,	# ref
#    cat1d,	# ref
#    conv4,	# ref, tut
    converge!,	# ref
    converge,	# ref, tut
#    cpucopy,	# ref
#    CuArray,
    #Data,	# tut, use Knet.Data
#    deconv4,	# ref
#    @diff,	# ref, tut
    #dir,	# ref, tut, use Knet.dir
#    dropout,	# ref, tut
#    elu,	# ref
    #epochs,	# deprecated, use repeat(data,n)
    gaussian,	# ref
    #gc,  	# ref, tut, use Knet.gc
    #@gheck,	# ref, use AutoGrad.@gcheck
    goldensection, # ref
#    gpu,	# ref, tut
#    gpucopy,	# ref
#    grad,	# ref, tut
#    gradloss,	# ref
    hyperband,	# ref
#    invx,	# ref
#    KnetArray,	# ref, tut
#    knetgc,     # deprecated, use Knet.gc
    #load,	# ref, tut
    #@load,	# ref
#    logistic,	# ref
#    logp,	# ref
#    logsoftmax,	# ref
#    logsumexp,	# ref
#    mat,	# ref, tut
    minibatch,	# ref, tut
    #minimize!,	# use sgd!, adam! etc.
    #minimize,	# use sgd, adam etc.
    momentum!,	# ref
    Momentum,	# ref
    momentum,	# ref
    nesterov!,	# ref
    Nesterov,	# ref
    nesterov,	# ref
#    nll,	# ref, tut
    optimizers,	# deprecated, use sgd etc.
#    Param,	# ref, tut
    param,	# ref, tut
    param0,	# ref, tut
#    params,	# ref, tut
#    pool,	# ref, tut
    #@primitive, # ref, use AutoGrad.@primitive
    progress!,	# ref, tut
    progress,	# ref, tut
#    relu,	# ref, tut
    rmsprop!,	# ref
    Rmsprop,	# ref
    rmsprop,	# ref
#    RNN,	# ref, tut
#    rnninit,    # deprecated, use RNN
#    rnnparam,	# ref, rnnparam(r,w,l,i,d) deprecated, use rnnparam(r,l,i,d)
#    rnnparams,	# ref, rnnparams(r,w) deprecated, use rnnparams(r)
    #save,	# ref, tut, use Knet.save
    #@save,	# ref, use Knet.@save
    #seed!,	# ref, use Knet.seed!
#    selu,	# ref
#    setseed,	# deprecated, use Knet.seed!
    sgd!,	# ref
    SGD,	# ref
    Sgd,	# deprecated, use SGD
    sgd,	# ref, tut
#    sigm,	# ref
#    softmax,	# ref
    train!,	# deprecated, use sgd, adam etc.
    #train,	# deprecated, use sgd, adam etc.
#    training,	# ref, tut
#    unpool,	# ref
    update!,	# ref
    #updates,	# deprecated, use take(cycle(data),n)
#    value,	# ref, tut
    xavier,	# ref, tut
    xavier_uniform,	# ref
    xavier_normal,	# ref
    #@zerograd, # ref, use AutoGrad.@zerograd
    zeroone	# ref, tut

# @use X,Y,Z calls using on packages installing them if necessary. (WIP)
# 1. still need "using Knet"
# 2. Pkg.insalled gives false for stdlib packages.
# macro use(ps)
#     if isa(ps, Symbol); ps = Expr(:tuple,ps); end
#     a = map(ps.args) do p
#         s=string(p) 
#         esc(:(haskey(Pkg.installed(),$s)||Pkg.add($s); using $p))
#     end
#     Expr(:block,:(using Pkg),a...)
# end
# export @use

#using  AutoGrad: @diff, Param, params, grad, gradloss, value, cat1d, @primitive, @zerograd, @primitive1, @zerograd1, forw, back, Value, AutoGrad
#export AutoGrad, @diff, Param, params, grad, gradloss, value, cat1d #@primitive, @zerograd, @primitive1, @zerograd1, forw, back, Value, getval

=#
end # module


