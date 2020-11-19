#pragma once

#include <prefix.h>

struct KlazzA
{
    int method() const { return 1; }

    KlazzB& dummy() { return GetB(); }

    // N.B. Forward-declared class must be used to be included within a module
    KlazzA& getA() { return GetA(); }
    KlazzB& getB() { return GetB(); }
};

inline KlazzA& GetA()
{
    static KlazzA ret;
    return ret;
}

