#pragma once

#include "../src/common/utils.h"
#include "../src/common_Zp/matrix.h"
#include "seal/seal.h"
#include "pasta/tests/resources/bfv_testvectors.h"

int main() {
    bool ret = true;
    int idx = 0;
    for (auto& test : KNOWN_ANSWER_TESTS) {
        std::cout << "Test " << idx << "\n";
        try {
            bool ok = test.run_test();
            if (ok) std::cout << "... ok";
            std::cout << "\n";
            ret = ret && ok;
        } catch(const std::exception& e) {
            bool ok = false;
            std::cout << "... exception occured: " << e.what()  << "\n";
            ret = ret && ok;
        }
        idx++;
    }
    return ret ? 0 : -1;
}

