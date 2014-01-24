//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Volumes/Duong's Data/MyMoney/Mobile Software/DLLIB/HWDBF/src/DLMath/DLMatrix.java
//
//  Created by buiduong on 1/16/14.
//

#include "DLMath/DLMatrix.h"
#include "IOSClass.h"
#include "IOSIntArray.h"
#include "IOSObjectArray.h"
#include "java/io/PrintStream.h"
#include "java/lang/Exception.h"
#include "java/lang/System.h"

@implementation DLMathDLMatrix

+ (void)displayMatrixWithIntArray2:(IOSObjectArray *)maxtrix {
  [((JavaIoPrintStream *) nil_chk([JavaLangSystem out])) printWithNSString:@"\n=====Maxtrix...."];
  for (int i = 0; i < (int) [((IOSObjectArray *) nil_chk(maxtrix)) count]; i++) {
    [[JavaLangSystem out] printlnWithNSString:@""];
    for (int j = 0; j < (int) [((IOSIntArray *) nil_chk(IOSObjectArray_Get(maxtrix, 0))) count]; j++) {
      if (j == 0) [[JavaLangSystem out] printWithNSString:@"["];
      else if (j == (int) [((IOSIntArray *) nil_chk(IOSObjectArray_Get(maxtrix, 0))) count] - 1) [[JavaLangSystem out] printWithNSString:@"]"];
      else [[JavaLangSystem out] printWithNSString:[NSString stringWithFormat:@" %d", IOSIntArray_Get(nil_chk(IOSObjectArray_Get(maxtrix, i)), j)]];
    }
  }
}

+ (IOSObjectArray *)multiplyMatrixWithIntArray2:(IOSObjectArray *)maxtrix1
                                  withIntArray2:(IOSObjectArray *)maxtrix2 {
  [((JavaIoPrintStream *) nil_chk([JavaLangSystem out])) printlnWithNSString:@"\n---start----"];
  if ((int) [((IOSIntArray *) nil_chk(IOSObjectArray_Get(nil_chk(maxtrix1), 0))) count] != (int) [((IOSObjectArray *) nil_chk(maxtrix2)) count]) {
    @throw [[[JavaLangException alloc] initWithNSString:@"Can only mutiply two maxtrix M*N x N*P => M*P "] autorelease];
  }
  int maxRows = (int) [maxtrix1 count];
  int maxCols = (int) [((IOSIntArray *) nil_chk(IOSObjectArray_Get(maxtrix2, 0))) count];
  IOSObjectArray *resutlMaxtrix = [IOSIntArray arrayWithDimensions:2 lengths:(int[]){ maxRows, maxCols }];
  for (int row1 = 0; row1 < maxRows; row1++) {
    for (int c = 0; c < maxCols; c++) {
      int sum = 0;
      IOSIntArray *rowvectorM1 = [DLMathDLMatrix getRowVectorWithIntArray2:maxtrix1 withInt:row1];
      IOSIntArray *colvectorM2 = [DLMathDLMatrix getColVectorWithIntArray2:maxtrix2 withInt:c];
      sum += [DLMathDLMatrix multiplyVectorWithIntArray:rowvectorM1 withIntArray:colvectorM2];
      (*IOSIntArray_GetRef(nil_chk(IOSObjectArray_Get(resutlMaxtrix, row1)), c)) = sum;
    }
  }
  [[JavaLangSystem out] printlnWithNSString:@"stop----"];
  return resutlMaxtrix;
}

+ (IOSIntArray *)getRowVectorWithIntArray2:(IOSObjectArray *)matrix
                                   withInt:(int)row {
  IOSIntArray *vector = [IOSIntArray arrayWithLength:(int) [((IOSIntArray *) nil_chk(IOSObjectArray_Get(nil_chk(matrix), 0))) count]];
  for (int i = 0; i < (int) [((IOSIntArray *) nil_chk(IOSObjectArray_Get(matrix, 0))) count]; i++) {
    (*IOSIntArray_GetRef(vector, i)) = IOSIntArray_Get(nil_chk(IOSObjectArray_Get(matrix, row)), i);
  }
  return vector;
}

+ (IOSIntArray *)getColVectorWithIntArray2:(IOSObjectArray *)matrix
                                   withInt:(int)col {
  IOSIntArray *vector = [IOSIntArray arrayWithLength:(int) [((IOSObjectArray *) nil_chk(matrix)) count]];
  for (int row = 0; row < (int) [matrix count]; row++) {
    (*IOSIntArray_GetRef(vector, row)) = IOSIntArray_Get(nil_chk(IOSObjectArray_Get(matrix, row)), col);
  }
  return vector;
}

+ (int)multiplyVectorWithIntArray:(IOSIntArray *)vector1
                     withIntArray:(IOSIntArray *)vector2 {
  int result = 0;
  for (int i = 0; i < (int) [((IOSIntArray *) nil_chk(vector1)) count]; i++) {
    result += IOSIntArray_Get(vector1, i) * IOSIntArray_Get(nil_chk(vector2), i);
  }
  return result;
}

- (id)init {
  return [super init];
}

+ (J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { "multiplyMatrixWithIntArray2:withIntArray2:", NULL, "LIOSObjectArray", 0x9, "JavaLangException" },
    { "getRowVectorWithIntArray2:withInt:", NULL, "LIOSIntArray", 0x9, NULL },
    { "getColVectorWithIntArray2:withInt:", NULL, "LIOSIntArray", 0x9, NULL },
  };
  static J2ObjcClassInfo _DLMathDLMatrix = { "DLMatrix", "DLMath", NULL, 0x1, 3, methods, 0, NULL, 0, NULL};
  return &_DLMathDLMatrix;
}

@end