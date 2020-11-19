
fwdA = ForwardDeclA.KlazzA()
fwdB = ForwardDeclB.KlazzB()

print(fwdA)
print(fwdA:getB())
print(fwdA:getB():getA())

print(fwdB)
print(fwdB:getA())
print(fwdB:getA():getB())

