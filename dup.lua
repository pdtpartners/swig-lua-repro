
dupA = DuplicateA.Dup()
dupB = DuplicateB.Dup()

-- The following line will not work in swig 2 without the fix
print(dupA,dupA:dummy())
-- The following line will not work in swig 4 without the fix
print(dupB,dupB:dummy())

fooA = DuplicateA.Foo()
fooB = DuplicateB.Foo()

print(fooA)
print(fooA:getB())
print(fooA:getB():getA())

print(fooB)
print(fooB:getA())
print(fooB:getA():getB())
