module TestMeshInterface

using MeshInterface: NoSuchTrait, FESetTrait, FEMeshTrait
import MeshInterface: fesettrait, femeshtrait
import MeshInterface: _numberofelements, _getconn!
using FinEtools

struct FEMesh
    fenodes
    fesets
end

fesettrait(::Type{T}) where {T<:FinEtools.FESetModule.AbstractFESet} = FESetTrait()
femeshtrait(::Type{FEMesh}) = FEMeshTrait()

_numberofelements(::FESetTrait, fes::T) where {T} = length(fes.conn)
_getconn!(::FESetTrait, c::C, fes::T, i)  where {C, T} = (c .= fes.conn[i])

end # module
