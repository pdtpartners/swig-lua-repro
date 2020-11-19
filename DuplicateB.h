#pragma once

#include <prefix.h>

namespace B {

    struct Dup
    {
        int dummy() const { return 2; }
    };

    struct Foo
    {
        A::Foo& getA() { return GetFooA(); }
        B::Foo& getB() { return GetFooB(); }
    };

}

inline B::Foo& GetFooB()
{
    static B::Foo ret;
    return ret;
}

