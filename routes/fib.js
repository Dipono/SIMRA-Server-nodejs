const express = require('express');
const connection = require("../config/config");
const router = express.Router();

router.get('/indicators', (req, res) => {
    var indicators = [

        {
            indicator: "E.coli", pathogen: [{ path_name: 'E.coli 0157', ratio: '1:0.05' },
            { path_name: 'Salmonella', ratio: '1:0.5' },
            { path_name: 'Campylobacter', ratio: '1:0.03' },
            { path_name: 'Vibrio Cholerae', ratio: '1:0.3' },]
        },

        {
            indicator: "Coliforms", pathogen: [{ path_name: 'E.coli 0157', ratio: '1:0.4' },
            { path_name: 'Salmonella', ratio: '1:0.4' },
            { path_name: 'Campylobacter', ratio: '1:0.03' },
            { path_name: 'Vibrio Cholerae', ratio: '1:0.2' },]
        },

        {
            indicator: "Enterococcus", pathogen: [{ path_name: 'E.coli 0157', ratio: '1:0.1' },
            { path_name: 'Salmonella', ratio: '1.1:1' },
            { path_name: 'Campylobacter', ratio: '1:0.1' },
            { path_name: 'Vibrio Cholerae', ratio: '1:0.5' },]
        },

        {
            indicator: "Clostridium", pathogen: [{ path_name: 'Cryptosporidium', ratio: '1:0.6' },
            { path_name: 'Giardia', ratio: '1:0.8' },]
        },

        { indicator: "Other", pathogen: [{ path_name: '', ratio: '' }] },
    ]

    res.send({ message: "List of Indicators", success: true, indicators })
})

router.get('/reference_pathogens', (req, res) => {
    var reference_pathogens = [
        { pathogen: "Cryptosporidium Parvum", best_fit_model: "exponential", parameter: [{ constant: 0.0199, n50: null }] },
        { pathogen: "E.coli 0157:H7", best_fit_model: "beta-poisson", parameter: [{ alpha: 0.4, beta: 45.9 }] },
        { pathogen: "Campylobacter jejuni", best_fit_model: "beta-poisson", parameter: [{ alpha: 0.145, beta: 7.85 }] },
        { pathogen: "Salmonella typhi", best_fit_model: "beta-poisson", parameter: [{ alpha: 0.21, beta: 49.78 }] },
        { pathogen: "S.Flexneri", best_fit_model: "beta-poisson", parameter: [{ alpha: 0.265, beta: 1480 }] },
        { pathogen: "Vibrio Cholerae", best_fit_model: "beta-poisson", parameter: [{ alpha: 0.169, beta: 2305 }] },
        { pathogen: "Giardia lambia", best_fit_model: "exponential", parameter: [{ constant: 0.0199, n50: null }] },
        { pathogen: "Entamoeba coli", best_fit_model: "beta-poisson", parameter: [{ alpha: 0.101, n50: 341 }] },
        { pathogen: "Other", best_fit_model: "", parameter: [0] }
    ]

    res.send({ message: "List of Indicators", success: true, reference_pathogens })
})

router.get('/maker_genes', (req, res) => {
    var makers = [

        {
            maker: "BacHum", pathogen: [{ path_name: 'E.coli 0157:H7', ratio: '1:0.02' },
            { path_name: 'Salmonella', ratio: '1:0.6' },
            { path_name: 'Campylobacter jejuni', ratio: '1:0.1' },
            { path_name: 'Cryptosporidium', ratio: '1:0.3' },
            { path_name: 'Giardia', ratio: '1:1.5' },]
        },

        {
            maker: "BacCow", pathogen: [{ path_name: 'E.coli 0157:H7', ratio: '1:0.04' },
            { path_name: 'Salmonella', ratio: '1:1.3' },
            { path_name: 'Campylobacter jejuni', ratio: '1:0.2' },
            { path_name: 'Cryptosporidium', ratio: '1:0.4' },
            { path_name: 'Giardia', ratio: '1:2.2' },]
        },


        {
            maker: "Pig-2-Bac", pathogen: [{ path_name: 'E.coli 0157:H7', ratio: '1:0.01' },
            { path_name: 'Salmonella', ratio: '1:0.4' },
            { path_name: 'Campylobacter jejuni', ratio: '1:0.1' },
            { path_name: 'Cryptosporidium', ratio: '1:0.3' },
            { path_name: 'Giardia', ratio: '1:1.6' },]
        },


        {
            maker: "BacCan", pathogen: [{ path_name: 'E.coli 0157:H7', ratio: '1:0.01' },
            { path_name: 'Salmonella', ratio: '1:0.4' },
            { path_name: 'Campylobacter jejuni', ratio: '1:0.1' },
            { path_name: 'Cryptosporidium', ratio: '1:0.02' },
            { path_name: 'Giardia', ratio: '1:0.1' },]
        },


        {
            maker: "CyTB", pathogen: [{ path_name: 'E.coli 0157:H7', ratio: '1:0.02' },
            { path_name: 'Salmonella', ratio: '1:0.8' },
            { path_name: 'Campylobacter jejuni', ratio: '1:0.1' },
            { path_name: 'Cryptosporidium', ratio: '1:0.5' },
            { path_name: 'Giardia', ratio: '1:3' },]
        },


        { maker: "Other", pathogen: [{ path_name: '', ratio: '' }] }


    ]

    res.send({ message: "List of maker genes", success: true, makers })
})


module.exports = router