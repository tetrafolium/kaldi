// cudamatrix/cu-rand.h

// Copyright 2016  Brno University of Technology (author: Karel Vesely)

// See ../../COPYING for clarification regarding multiple authors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
// THIS CODE IS PROVIDED *AS IS* BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION ANY IMPLIED
// WARRANTIES OR CONDITIONS OF TITLE, FITNESS FOR A PARTICULAR PURPOSE,
// MERCHANTABLITY OR NON-INFRINGEMENT.
// See the Apache 2 License for the specific language governing permissions and
// limitations under the License.

#ifndef KALDI_CUDAMATRIX_CU_RAND_H_
#define KALDI_CUDAMATRIX_CU_RAND_H_

#include "cudamatrix/cu-device.h"
#include "cudamatrix/cu-matrix.h"
#include "cudamatrix/cu-vector.h"
#include "base/kaldi-math.h"

namespace kaldi {

template<typename Real>
class CuRand {
public:

  void SeedGpu() {
  #if HAVE_CUDA == 1
    CuDevice::Instantiate().SeedGpu();
  #endif
  }

  // CAUTION.
  // For the versions of these functions that output to a CuMatrix (as opposed to
  // CuMatrixBase), the random numbers depend on the stride, and the stride
  // is not guaranteed to be consistent for the same dimension of matrix
  // (it usually will be, but not when memory is nearly exhausted).  So
  // for applications where consistency is essential, either use the versions
  // of these function that accept CuMatrixBase, or initialize your matrix
  // with the kStrideEqualNumCols argument to ensure consistent stride.

  /// Fill with uniform [0..1] floats,
  void RandUniform(CuMatrixBase<Real> *tgt);
  void RandUniform(CuMatrix<Real> *tgt);
  void RandUniform(CuVectorBase<Real> *tgt);
  /// Fill with Normal random numbers,
  void RandGaussian(CuMatrixBase<Real> *tgt);
  void RandGaussian(CuMatrix<Real> *tgt);
  void RandGaussian(CuVectorBase<Real> *tgt);

  /// align probabilities to discrete 0/1 states (use uniform sampling),
  void BinarizeProbs(const CuMatrix<Real> &probs, CuMatrix<Real> *states);
  /// add gaussian noise to each element,
  void AddGaussNoise(CuMatrix<Real> *tgt, Real gscale = 1.0);
};

}  // namsepace

#endif  // KALDI_CUDAMATRIX_CU_RAND_H_
