/**
 * @Author: Brandon Baars <brandon>
 * @Date:   Monday, August 7th 2017, 10:29:02 am
 * @Filename: index.js
 * @Last modified by:   brandon
 * @Last modified time: Thursday, August 10th 2017, 9:21:40 pm
 */

import mongodb from 'mongodb';

export default {
  "port": 3005,
  "mongoUrl": "mongodb://localhost:27017/chat-api",
  // "port": process.env.PORT,
  // "mongoUrl": process.env.MONGODB_URI,
  "bodyLimit": "100kb"
}
