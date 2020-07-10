const { Router } = require('express');
const { celebrate, Joi } = require('celebrate');

const { Note } = require('../../models');
const { NotesService } = require('../../services');

const router = Router();

module.exports = (routes) => {
  routes.use('/notes', router);

  router.get(
    '/',
    async (req, res, next) => {
      try {
        res.status(200).json({
          status: 'success',
          message: 'All Notes.',
          data: {
            notes: await new NotesService(Note).index(),
          },
        });
      } catch (err) {
        next(err);
      }
    },
  );

  router.post(
    '/',
    celebrate({
      body: Joi.object().keys({
        title: Joi.string().trim().required(),
        content: Joi.string().trim().required(),
      }),
    }),
    async (req, res, next) => {
      try {
        res.status(201).json({
          status: 'success',
          message: 'Note Created.',
          data: {
            note: await new NotesService(Note).store(req.body),
          },
        });
      } catch (err) {
        next(err);
      }
    },
  );

  router.get(
    '/:id',
    async (req, res, next) => {
      try {
        res.status(200).json({
          status: 'success',
          message: 'Single Note.',
          data: {
            note: await new NotesService(Note).show(req.params.id),
          },
        });
      } catch (err) {
        next(err);
      }
    },
  );

  router.put(
    '/:id',
    celebrate({
      body: Joi.object().keys({
        title: Joi.string().trim().required(),
        content: Joi.string().trim().required(),
      }),
    }),
    async (req, res, next) => {
      try {
        res.status(200).json({
          status: 'success',
          message: 'Note Updated.',
          data: {
            note: await new NotesService(Note).update(req.params.id, req.body),
          },
        });
      } catch (err) {
        next(err);
      }
    },
  );

  router.delete(
    '/:id',
    async (req, res, next) => {
      try {
        await new NotesService(Note).destroy(req.params.id)

        res.status(200).json({
          status: 'success',
          message: 'Note Deleted.',
          data: null,
        });
      } catch (err) {
        next(err);
      }
    },
  );
};
