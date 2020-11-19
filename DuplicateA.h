#pragma once

#include <prefix.h>

namespace A {

    struct Dup
    {
        int dummy() const { return 1; }
    };

    struct Foo
    {
        A::Foo& getA() { return GetFooA(); }
        B::Foo& getB() { return GetFooB(); }
    };

}

inline A::Foo& GetFooA()
{
    static A::Foo ret;
    return ret;
}

