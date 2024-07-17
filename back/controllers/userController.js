const User = require('../model/userModel')

const CreateUser = (req, res) => {
    try {
        const { user_nom, user_prenom, user_email, user_pass, user_type } = req.body;
        const newUser = User.create({
            user_nom,
            user_prenom,
            user_email,
            user_pass,
            user_type,
        });
        res.status(201).json(newUser);
    }
    catch (error) {
        console.error(error);
  }
}

const UpdateUser = (req, res) => {
    const { id } = req.params;
    const { user_nom, user_prenom, user_email, user_pass, user_type } = req.body;
    try {
        const user = User.update({
            user_nom,
            user_prenom,
            user_email,
            user_pass,
            user_type,
        }, {
            where: {
                user_id: id,
            },
        });
        res.status(200).json(user);
    }
    catch (error) {
        console.error(error);
    }
}

const DeleteUser = (req, res) => {
    const { id } = req.params;
    try {
        User.destroy({
            where: {
                user_id: id,
            },
        });
        res.status(204).send();
    }
    catch (error) {
        console.error(error);
    }
};

const AllUser = (req, res) => {
    try {
        const users = User.findAll();
        res.status(200).json(users);
    }
    catch (error) {
        console.error(error);
    }
}

module.exports = {
    CreateUser,
    UpdateUser,
    DeleteUser,
    AllUser
}