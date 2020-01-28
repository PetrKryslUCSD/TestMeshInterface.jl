module TestMeshInterface

using MeshInterface: NoSuchTrait, FESetTrait, FEMeshTrait
import MeshInterface: fesettrait, femeshtrait
import MeshInterface: _numberofsets, _numberofelements, _getconn!, _numberofnodesperelement
using FinEtools

struct FEMesh
    fenodes
    fesets
end

fesettrait(::Type{T}) where {T<:FinEtools.FESetModule.AbstractFESet} = FESetTrait()
femeshtrait(::Type{FEMesh}) = FEMeshTrait()

_numberofsets(::FEMeshTrait, m::FEMesh) = length(m.fesets)
_numberofnodesperelement(::FESetTrait, fes::T) where {T} = nodesperelem(fes)
_numberofelements(::FESetTrait, fes::T) where {T} = length(fes.conn)
_getconn!(::FESetTrait, c::C, fes::T, i)  where {C, T} = (c .= fes.conn[i])

end # module
