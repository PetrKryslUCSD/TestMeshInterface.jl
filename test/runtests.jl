module m1a
using FinEtools
using MeshInterface: numberofelements, getconn!
using TestMeshInterface: FEMesh
using Test
function test()
    A= 100. # strip width
    N = 16
    fens,fes = T3block(A, A, N, N)
    mesh = FEMesh(fens, [fes])

    @show numberofelements(mesh.fesets[1])
    c = fill(0, 3)
    @show getconn!(c, mesh.fesets[1], 1)
    @test c[1] == fes.conn[1][1]
    @test c[3] == fes.conn[1][3]

    true
end
end
using .m1a
m1a.test()
