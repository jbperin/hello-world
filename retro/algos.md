

## Algo arithmétiques

http://nparker.llx.com/a2/mult.html

### Multiplication 8 bits
```
        LDA #0       ;Initialize RESULT to 0
        LDX #8       ;There are 8 bits in NUM2
L1      LSR NUM2     ;Get low bit of NUM2
        BCC L2       ;0 or 1?
        CLC          ;If 1, add NUM1
        ADC NUM1
L2      ROR A        ;"Stairstep" shift (catching carry from add)
        ROR RESULT
        DEX
        BNE L1
        STA RESULT+1
```

### Multiplication 16 bits
```
        LDA #0       ;Initialize RESULT to 0
        STA RESULT+2
        LDX #16      ;There are 16 bits in NUM2
L1      LSR NUM2+1   ;Get low bit of NUM2
        ROR NUM2
        BCC L2       ;0 or 1?
        TAY          ;If 1, add NUM1 (hi byte of RESULT is in A)
        CLC
        LDA NUM1
        ADC RESULT+2
        STA RESULT+2
        TYA
        ADC NUM1+1
L2      ROR A        ;"Stairstep" shift
        ROR RESULT+2
        ROR RESULT+1
        ROR RESULT
        DEX
        BNE L1
        STA RESULT+3
```

### Division de 2 nombres 16 bits

```
        LDA #0      ;Initialize REM to 0
        STA REM
        STA REM+1
        LDX #16     ;There are 16 bits in NUM1
L1      ASL NUM1    ;Shift hi bit of NUM1 into REM
        ROL NUM1+1  ;(vacating the lo bit, which will be used for the quotient)
        ROL REM
        ROL REM+1
        LDA REM
        SEC         ;Trial subtraction
        SBC NUM2
        TAY
        LDA REM+1
        SBC NUM2+1
        BCC L2      ;Did subtraction succeed?
        STA REM+1   ;If yes, save it
        STY REM
        INC NUM1    ;and record a 1 in the quotient
L2      DEX
        BNE L1
```


## Algo de geometrie


http://geomalgorithms.com/


[Line and Plane Intersection](http://geomalgorithms.com/a05-_intersect-1.html)

```C
#define SMALL_NUM   0.00000001 // anything that avoids division overflow
// dot product (3D) which allows vector operations in arguments
#define dot(u,v)   ((u).x * (v).x + (u).y * (v).y + (u).z * (v).z)
#define perp(u,v)  ((u).x * (v).y - (u).y * (v).x)  // perp product  (2D)
```


```C
// intersect3D_SegmentPlane(): find the 3D intersection of a segment and a plane
//    Input:  S = a segment, and Pn = a plane = {Point V0;  Vector n;}
//    Output: *I0 = the intersect point (when it exists)
//    Return: 0 = disjoint (no intersection)
//            1 =  intersection in the unique point *I0
//            2 = the  segment lies in the plane
int
intersect3D_SegmentPlane( Segment S, Plane Pn, Point* I )
{
    Vector    u = S.P1 - S.P0;
    Vector    w = S.P0 - Pn.V0;

    float     D = dot(Pn.n, u);
    float     N = -dot(Pn.n, w);

    if (fabs(D) < SMALL_NUM) {           // segment is parallel to plane
        if (N == 0)                      // segment lies in plane
            return 2;
        else
            return 0;                    // no intersection
    }
    // they are not parallel
    // compute intersect param
    float sI = N / D;
    if (sI < 0 || sI > 1)
        return 0;                        // no intersection

    *I = S.P0 + sI * u;                  // compute segment intersect point
    return 1;
}
```
