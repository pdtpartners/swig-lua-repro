#pragma once

#include <prefix.h>

struct KlazzB
{
    int method() const { return 2; }

    KlazzA& dummy() { return GetA(); }

    // N.B. Forward-declared class must be used to be included within a module
    KlazzA& getA() { return GetA(); }
    KlazzB& getB() { return GetB(); }
};

inline KlazzB& GetB()
{
    static KlazzB ret;
    return ret;
}

