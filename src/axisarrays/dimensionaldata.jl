using .DimensionalData: DimArray, DimensionalData, data, Dim, metadata

_dname(::DimensionalData.Dim{N}) where N = N
_dname()
dimname(x::DimArray, i) = _dname(DimensionalData.dims(x)[i])


dimvals(x::DimArray,i) = DimensionalData.dims(x)[i].val

getdata(x::DimArray) = data(x)

getattributes(x::DimArray) = metadata(x)

function yaxcreate(::Type{<:DimArray},data,dnames,dvals,atts)
  d = ntuple(ndims(data)) do i
    Dim{Symbol(dnames[i])}(dvals[i])
  end
  DimArray(data,d,metadata = atts)
end
