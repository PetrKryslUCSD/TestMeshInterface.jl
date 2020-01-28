module TestMeshInterface

using MeshInterface: NoSuchTrait, FESetTrait, FEMeshTrait
import MeshInterface: fesettrait, femeshtrait
import MeshInterface: _numberofsets, _numberofelements, _getconn!, _numberofnodesperelement
using FinEtools

struct FinEtoolsFESetTrait<:FESetTrait;    end
struct FinEtoolsFEMeshTrait<:FEMeshTrait;    end

struct FEMesh
    fenodes
    fesets
end

fesettrait(::Type{T}) where {T<:FinEtools.FESetModule.AbstractFESet} = FinEtoolsFESetTrait()
femeshtrait(::Type{FEMesh}) = FinEtoolsFEMeshTrait()

_numberofsets(::FinEtoolsFEMeshTrait, m::FEMesh) = length(m.fesets)
_numberofnodesperelement(::FinEtoolsFESetTrait, fes::T) where {T} = nodesperelem(fes)
_numberofelements(::FinEtoolsFESetTrait, fes::T) where {T} = length(fes.conn)
_getconn!(::FinEtoolsFESetTrait, c::C, fes::T, i)  where {C, T} = (c .= fes.conn[i])

end # module
