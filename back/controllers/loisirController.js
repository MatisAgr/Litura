const Loisir = require ('../model/loisirModel') 

const CreateLoisir = async(req, res) => {
    try {
        const { loisir_type, loisir_nom, loisir_image, loisir_note, loisir_description } = req.body;
        const newLoisir = await Loisir.create({
            loisir_type,
            loisir_nom,
            loisir_image,
            loisir_note,
            loisir_description,
        });
        res.status(200).json(newLoisir);
    }
    catch (error) {
        console.error(error);
  }
}
  
  const UpdateLoisir = async(req, res) => {
    const { id } = req.params;
    const { loisir_type, loisir_nom, loisir_image, loisir_note, loisir_description } = req.body;
    try {
        const loisir = await Loisir.update({
            loisir_type,
            loisir_nom,
            loisir_image,
            loisir_note,
            loisir_description,
        }, {
            where: {
                loisir_id: id,
            },
        });
        res.status(200).json(loisir);
    }
    catch (error) {
        console.error(error);
    }
  }
  
  const DeleteLoisir = async(req, res) => {
    const { id } = req.params;
    try {
         await Loisir.destroy({
            where: {
                loisir_id: id,
            },
        });
        res.status(204).send();
    }
    catch (error) {
        console.error(error);
    }
  };
  
  const AllLoisir = async(req, res) => {
    try {
        const loisirs = await Loisir.findAll();
        res.status(200).json(loisirs);
    }
    catch (error) {
        console.error(error);
    }
  };
  
  const FindLoisir = async (req, res) => {
    const { categorie } = req.params;
    try {
        const loisirs = await Loisir.findAll({
            where: {
                loisir_type: categorie,
            },
        });
        res.status(200).json(loisirs);
    }
    catch (error) {
        console.error(error);
    };
}
  
  module.exports = {
    CreateLoisir,
    UpdateLoisir,
    DeleteLoisir,
    AllLoisir,
    FindLoisir,
  };