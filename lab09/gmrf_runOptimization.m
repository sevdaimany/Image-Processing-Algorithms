function mrf = gmrf_runOptimization(mrf)

    switch mrf.OptiMethod
        case 'MMD' 
            mrf = gmrf_doMMD(mrf);
        case 'ICM'
            mrf = gmrf_doICM(mrf);
    end

end