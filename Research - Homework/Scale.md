# Scale function


It is a generic function whose default method centers and / or scales the columns of a numeric matrix.

```r
scale(x, center = TRUE, scale = TRUE)
```

## Arguments
>* x *: a numeric array (like an object).
>* center *: either a logical value or a numeric vector of length equal to the number of columns in x, where 'similar numeric' means that as.numeric (.) will be applied successfully if is.numeric (.) is not true.
>*scale*: either a logical value or a similar numeric vector of length equal to the number of columns of x.

The value of "center" determines how the column is centered. If "center" is a vector of numeric type with a length equal to the number of columns of x, then each column of x has the corresponding value of center subtracted. If “center” is TRUE, centering is performed by subtracting the means of the columns (omitting NA s) from x their corresponding columns, and if “center” is thus FALSE, no centering is performed.

The value of scale determines how the column is scaled (after centering). If scale is a vector of numeric type with a length equal to the number of columns of x, then each column of x is divided by the corresponding value of scale. If scale is TRUE then the scale is performed by dividing the columns (centered) of x by their standard deviations if “cente” is TRUE, and the root of the mean square otherwise. If scale is like this FALSE, no scale is performed.

## Information sources

>--. (--). scale. 29/11/2020, de rdocumentation Sitio web: https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/scale

>Dr. Francisco José Alcaraz Ariza. (2013). Clasificación y ordenación con R. 29/11/2020, de Universidad de Murcia Sitio web: https://www.um.es/docencia/geobotanica/ficheros/practica2.pdf

